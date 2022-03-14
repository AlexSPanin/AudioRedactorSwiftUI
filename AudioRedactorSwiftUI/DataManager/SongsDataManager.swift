//
//  Music.swift
//  AudioEngine
//
//  Created by Александр Панин on 12.02.2022.
//

import Foundation
import Combine


class SongsDataManager: ObservableObject {
    @Published var audioSongs: [AudioDataModel] = fetchSongs()
}
    func fetchSongs() -> [AudioDataModel] {

        var songsModel = [AudioDataModel]()
        
        AudioDataManager.audio = fetchSongModel(name: "Scott Buckley - Life In Silico", format: "mp3")
        songsModel.append(AudioDataManager.fetchAudioData())
        AudioDataManager.audio = fetchSongModel(name: "otbivka", format: "mp3")
        songsModel.append(AudioDataManager.fetchAudioData())
        AudioDataManager.audio = fetchSongModel(name: "01 The St. Louis Blues", format: "m4a")
        songsModel.append(AudioDataManager.fetchAudioData())
        
        return songsModel
    }
    
    func fetchSongModel(name: String, format: String ) -> SongModel {
        let song: SongModel = SongModel(name: name, format: format)
        return song
    }

