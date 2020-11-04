//
//  MediaAcessManager.swift
//  SwiftUI Music Player
//
//  Created by Anant Prakash on 2020-03-27.
//  Copyright © 2020 Anant Prakash. All rights reserved.
//

import Foundation
import MediaPlayer

public class MediaPlayerManager {
    static var songList:[SongDetails] = []
    static func loadSongs() -> [SongDetails]?{
       
        let itunesSongs = MPMediaQuery.songs()
        let isPresent = MPMediaPropertyPredicate(value:false,
               forProperty:MPMediaItemPropertyIsCloudItem,
               comparisonType:.equalTo)
           itunesSongs.addFilterPredicate(isPresent)
        let songs = itunesSongs.items
        if songs == nil {
            return [];
        }
        for n in 1...15{
            let details = SongDetails()
            let song = songs![n]
            details.artist = song.albumArtist!
            print(details.artist)
            details.title = song.title!
            print(details.title)
            details.albumArt = (song.artwork?.image(at: CGSize(width: 350, height: 350)))!
            details.url = song.assetURL
            songList.append(details)
        }
        return songList
    }

}
