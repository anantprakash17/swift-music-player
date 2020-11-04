//
//  SongDetails.swift
//  SwiftUI Music Player
//
//  Created by Anant Prakash on 2020-03-22.
//  Copyright © 2020 Anant Prakash. All rights reserved.
//
import UIKit
import SwiftUI

class SongDetails: Identifiable {
    var id = UUID()
    var title, artist: String
    var albumArt: UIImage
    var colors: UIImageColors
    var url:URL?
    init(){
        self.title = "No Title"
        self.artist = "Unknown Artist"
        self.albumArt = UIImage(named: "albumcover")!
        self.url = URL(fileURLWithPath: "")
        self.colors = (UIImage(named: "albumcover")?.getColors())!
    }
}



