//
//  NowPlaying.swift
//  SwiftUI Music Player
//
//  Created by Anant Prakash on 2020-03-22.
//  Copyright © 2020 Anant Prakash. All rights reserved.
//

import SwiftUI
import MediaPlayer

struct NowPlaying: View {
    @Binding var currSong: SongDetails
    @Binding var isPlaying: Bool
    var body: some View {
        VStack {
            Spacer()
                .frame(height:10)
            Image(systemName: "rectangle.fill")
                .resizable()
                .frame(width: 35, height: 4, alignment: .center)
                .aspectRatio(0.25, contentMode: .fit)
            Image(uiImage: self.currSong.albumArt)
                .resizable()
                .cornerRadius(20)
                .frame(width: 350, height: 350, alignment: .center)
                .shadow(radius: 20)
            Spacer()
                .frame(height:30)
            Text(self.currSong.title)
                .font(.title)
            .foregroundColor(Color(self.currSong.colors.detail))
                .fontWeight(.semibold)
            Text(self.currSong.artist)
                .font(.subheadline)
            .foregroundColor(Color(self.currSong.colors.detail))
            Spacer()
                .frame( height: 50)
            HStack(alignment: .center, spacing: 50) {
                
                Image(systemName: "backward.fill")
                    .resizable()
                    .foregroundColor(Color(self.currSong
                        .colors.detail))
                    .frame(width: 30, height: 20, alignment: .center)
                Button(action: {
                    if self.isPlaying{
                        AudioManager.pauseSong()
                        self.isPlaying = false
                    }
                    else {
                        AudioManager.playSong(url: self.currSong.url)
                        self.isPlaying = true
                    }
                    
                }) {
                    if self.isPlaying {
                        Image(systemName: "pause.fill")
                            .resizable()
                            .frame(width: 35, height: 35, alignment: .center)
                    }
                    else {
                        Image(systemName: "play.fill")
                            .resizable()
                            .frame(width: 35, height: 35, alignment: .center)
                        
                    }
                }
                .animation(.spring())
                .accentColor(Color(currSong.colors.detail))
                Image(systemName: "forward.fill")
                    .resizable()
                    .foregroundColor(Color(self.currSong
                    .colors.detail))
                    .frame(width: 30 , height: 20, alignment: .center)
            }
            .padding(.horizontal)
            Spacer()
        }
       .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center) .background(Color(self.currSong.colors.background).edgesIgnoringSafeArea(.all))
        
    }
}

struct NowPlaying_Previews: PreviewProvider {
    static var previews: some View {
        NowPlaying(currSong: .constant(SongDetails()), isPlaying: .constant(false))
    }
}
