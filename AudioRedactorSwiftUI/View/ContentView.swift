//
//  ContentView.swift
//  AudioRedactorSwiftUI
//
//  Created by Александр Панин on 14.03.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var songsDataManager: SongsDataManager
    var songs: [AudioDataModel] {songsDataManager.audioSongs}
    
    var body: some View {
        VStack {
            ForEach(songs) { song in
                Text("\(song.name.name) \(song.name.format)")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SongsDataManager())
    }
}
