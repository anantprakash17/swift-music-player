//
//  AudioManager.swift
//  SwiftUI Music Player
//
//  Created by Anant Prakash on 2020-03-23.
//  Copyright © 2020 Anant Prakash. All rights reserved.
//

import Foundation
import AVFoundation
import MediaPlayer
import Combine
import SwiftUI

public class AudioManager:ObservableObject {
    static var songList:[SongDetails] = []
    static var audioPlayer:AVAudioPlayer?
    static var currTime:TimeInterval = 0.0
    let queue = DispatchQueue(label: "media processing")
    
    static func playNewSong(url:URL?){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        }catch {
            print("Error")
        }
        
        
    }
    static func playSong(url: URL?) {
        if currTime == 0.0{
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url!)
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            }catch {
                print("Error")
            }
        }else {audioPlayer?.play()}
        
        
    }
    static func pauseSong(){
        audioPlayer?.pause()
        currTime = audioPlayer?.currentTime ?? 0
    }
    static func audioData(url: URL?) -> SongDetails {
        let asset =  AVAsset(url: url!)
        let data = asset.metadata
        var title:String?
        var artist: String?
        var art: Data?
        for item in data {
            switch item.commonKey
            {
            case .commonKeyTitle? :
                title = item.value as? String
               // print(title!,"title")
            case .commonKeyArtist? :
                artist = item.value as? String
            case .commonKeyArtwork? :
                art = item.value as? Data
                
            default :
                break
                
            }
        }
        let details:SongDetails = SongDetails()
        if art != nil{
            let img = UIImage(data: art!)
            details.albumArt = img!
        }
        if title != nil{
            details.title = title!
        }
        if artist != nil{
            details.artist = artist!
        }
        details.url = url!
        return details
    }
    static func getSongList() -> [SongDetails]? {
        let songURLs = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: "/songs")!
        for url in songURLs{
            self.songList.append(AudioManager.audioData(url: url))
        }
        
        return songList
    }
  static func measure(_ title: String, block: (@escaping () -> ()) -> ()) {

        let startTime = CFAbsoluteTimeGetCurrent()

        block {
            let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
            print("\(title):: Time: \(timeElapsed)")
        }
    }
}


