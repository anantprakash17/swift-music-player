//
//  MusicListView.swift
//  SwiftUI Music Player
//
//  Created by Anant Prakash on 2020-03-22.
//  Copyright © 2020 Anant Prakash. All rights reserved.
//

import SwiftUI
import UIKit
struct MusicListView: View {
    @State var songTapped:Bool = false
    @Binding var songList: [SongDetails]?
    @Binding var currSong: SongDetails
    
    var body: some View {
        VStack {
            Text("Songs")
                .font(.title)
                .fontWeight(.bold)

            List(songList!) { song in
                MusicListRow(currSong: self.$currSong, songTapped: self.$songTapped, songDetail: song)
            } .onAppear{
                self.currSong = SongDetails()
                UITableView.appearance().separatorStyle = .none
            } .edgesIgnoringSafeArea(.all)
            Spacer()
            NowPlayingBar(songTap: self.$songTapped, songList: self.$songList, currSong: self.$currSong)
        }
        
    }
}

struct MusicListView_Previews: PreviewProvider {
    static var previews: some View {
        MusicListView(songList: .constant([SongDetails()]), currSong: .constant(SongDetails()))
        
    }
}
