//
//  ContentView.swift
//  SwiftUI Music Player
//
//  Created by Anant Prakash on 2020-03-22.
//  Copyright © 2020 Anant Prakash. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State var audData =  AudioManager.getSongList()
    @State var currSong = SongDetails()
    var body: some View {
        MusicListView(songList: self.$audData, currSong: self.$currSong)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
