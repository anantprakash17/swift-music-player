//
//  NowPlayingBar.swift
//  SwiftUI Music Player
//
//  Created by Anant Prakash on 2020-03-22.
//  Copyright © 2020 Anant Prakash. All rights reserved.
//

import SwiftUI
import Combine
import AVKit
struct NowPlayingBar: View {
    @Binding var songTap:Bool
    @Binding var songList:[SongDetails]?
    @State var isTapped: Bool = false
    @Binding var currSong:SongDetails
    var body: some View {
        VStack{
            Spacer()
            ZStack{
                Button(action: {
                    self.isTapped = true
                }) {
                    Rectangle()
                        .frame(height: 65)
                        .foregroundColor(Color(self.currSong.colors.background))
                        .opacity(1)
                        .blur(radius: 0.5)
                }.sheet(isPresented: self.$isTapped) {
                    NowPlaying(currSong: self.$currSong ,isPlaying: self.$songTap)
                }
                
                VStack {
                    HStack {
                        Image(uiImage: currSong.albumArt)
                            .resizable()
                            .cornerRadius(10)
                            .frame(width: 50, height: 50, alignment: .center)
                        VStack(alignment: .leading) {
                            Text(self.currSong.title)
                            .foregroundColor(Color(self.currSong.colors.detail))
                                .font(.headline)
                        }
                        Spacer()
                        Button(action: {
                            if self.songTap{
                                AudioManager.pauseSong()
                                self.songTap = false
                            }
                            else {
                                AudioManager.playSong(url: self.currSong.url)
                                self.songTap = true
                            }
                            
                            
                        }) {
                            
                            if self.songTap {
                                Image(systemName: "pause.fill")
                                    .resizable()
                                .foregroundColor(Color(self.currSong.colors.detail))
                                    .frame(width: 20, height: 20, alignment: .center)
                            }
                            else {
                                Image(systemName: "play.fill")
                                    .resizable()
                                .foregroundColor(Color(self.currSong.colors.detail))
                                    .frame(width: 20, height: 20, alignment: .center)
                                
                            }
                            
                            
                        }
                        .accentColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                        Spacer()
                            .frame(width:15)
                        Image(systemName: "forward.fill")
                            .resizable()
                            .foregroundColor(Color(self.currSong.colors.detail))
                            .frame(width: 30, height: 20)
                            .padding(.trailing)
                    }
                    .padding(.leading)
                }
            }
        }
        .frame(height: 65)
        
    }
}

struct NowPlayingBar_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingBar(songTap: .constant(false), songList: .constant([SongDetails()]), currSong: .constant(SongDetails()))
    }
}
