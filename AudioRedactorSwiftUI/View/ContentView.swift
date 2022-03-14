//
//  ContentView.swift
//  AudioRedactorSwiftUI
//
//  Created by Александр Панин on 14.03.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var songsDataManager: SongsDataManager
    var songs: [SongModel] {songsDataManager.audioSongs}
    
    var body: some View {
        VStack {
        ForEach(songs, id: \.name) { song in
            Text("\(song.name) \(song.format)")
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
