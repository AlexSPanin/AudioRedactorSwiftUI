//
//  Music.swift
//  AudioEngine
//
//  Created by Александр Панин on 12.02.2022.
//

import Foundation
import Combine


class SongsDataManager: ObservableObject {
    @Published var audioSongs: [SongModel] = fetchSongs()
}
    func fetchSongs() -> [SongModel] {

        let song1 = fetchAudioSong(name: "Scott Buckley - Life In Silico", format: Format.mp3.rawValue)
        let song2 = fetchAudioSong(name: "otbivka", format: Format.mp3.rawValue)
        let song3 = fetchAudioSong(name: "01 The St. Louis Blues", format: Format.m4a.rawValue)
        
        var songsModel = [SongModel]()
        songsModel.append(song1)
        songsModel.append(song2)
        songsModel.append(song3)
        return songsModel
    }
    
    func fetchAudioSong(name: String, format: String ) -> SongModel {
        let song: SongModel = SongModel(name: name, format: format)
        return song
    }

