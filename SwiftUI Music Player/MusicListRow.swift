//
//  MusicListRow.swift
//  SwiftUI Music Player
//
//  Created by Anant Prakash on 2020-03-25.
//  Copyright © 2020 Anant Prakash. All rights reserved.
//

import SwiftUI

struct MusicListRow: View {
    @Binding var currSong:SongDetails
    @Binding var songTapped:Bool
    var songDetail:SongDetails
    var body: some View {
        ZStack{
            Button(action: {
                AudioManager.playNewSong(url: self.songDetail.url)
                self.songDetail.colors = self.songDetail.albumArt.getColors(quality: .low)!
                self.currSong = self.songDetail
                self.songTapped = true
            }) {
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 65)
                    .foregroundColor(Color.gray.opacity(0.05))
                    .blur(radius: 0.5)
                    .animation(.spring())
                
            }
            HStack {
                Image(uiImage: self.songDetail.albumArt)
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .cornerRadius(10)
                VStack(alignment: .leading) {
                    Text(self.songDetail.title)
                        .font(.headline)
                    Text(self.songDetail.artist)
                        .font(.footnote)
                }
                Spacer()
                
            }
            .padding([ .leading])
        }
    }
}

//struct MusicListRow_Previews: PreviewProvider {
//    static var previews: some View {
//        MusicListRow(currSong: .constant(SongDetails()), songTapped: .constant(true), songDetail: .constant(SongDetails()))
//    }
//}
