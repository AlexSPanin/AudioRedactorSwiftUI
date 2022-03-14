//
//  DataNodes.swift
//  AudioEngine
//
//  Created by Александр Панин on 22.02.2022.
//

//MARK: - настройка какие фреймы привязываю к трэкам и с какими парраметрами

import AVFAudio
import Combine

class AudioTracksDataManager: ObservableObject {
    
    @Published var currentSecTime: Double = 0           // текущая позиция проигрования в треке в секундах
    @Published var lengthSecTime: Double = 0            // длина узла изначально равна сумме длин фрэймов в секундах
    @Published var audioTracks: [AudioFrameModel] = fetchTracks()

    
func addFrameToTrack(frame: AudioFrameModel, track: Int) {
    let audioTracks = audioTracks
    
    
}


}
    func fetchTracks() -> [AudioFrameModel] {
        
        var dataFrames = [AudioFrameModel]()
        let dataSongs = fetchSongs()
        
        AudioFrameDataManager.audioData = dataSongs[0]
        dataFrames.append(AudioFrameDataManager.getFrame(track: 0, startInAudio: 15, length: 15, offset: 0))
        AudioFrameDataManager.audioData = dataSongs[1]
        dataFrames.append(AudioFrameDataManager.getFrame(track: 0, startInAudio: 10, length: 30, offset: 10))
        AudioFrameDataManager.audioData = dataSongs[1]
        dataFrames.append(AudioFrameDataManager.getFrame(track: 0, startInAudio: 0, length: 60, offset: 10))
        
        AudioFrameDataManager.audioData = dataSongs[1]
        dataFrames.append(AudioFrameDataManager.getFrame(track: 1, startInAudio: 20, length: 30, offset: 10))
        AudioFrameDataManager.audioData = dataSongs[3]
        dataFrames.append(AudioFrameDataManager.getFrame(track: 1, startInAudio: 150, length: 40, offset: 10))
        
        AudioFrameDataManager.audioData = dataSongs[1]
        dataFrames.append(AudioFrameDataManager.getFrame(track: 2, startInAudio: 0, length: 0, offset: 10))
        
        var minOffset: Double = 0
        
        
        // MARK: -  прижатие хотябы одного первого фрэйма к началу проекта
        
        for dataTrack in dataTracks {
            minOffset = max(minOffset, dataTrack.framesForTrack[0].offsetSecFrameToFrame)
        }
        for dataTrack in dataTracks {
            minOffset = min(minOffset, dataTrack.framesForTrack[0].offsetSecFrameToFrame)
        }
        for dataTrack in dataTracks {
            dataTrack.framesForTrack[0].offsetSecFrameToFrame = dataTrack.framesForTrack[0].offsetSecFrameToFrame - minOffset
        }
        
       //   расстановка позиций фрэймов и вычисление максимальной длинны дорожки и проверка смещения первого фрэйма каждого трэка
        for dataTrack in dataTracks {
            let frames = dataTrack.framesForTrack
            var length: Double = 0
            var startSecondFrameInTracks: Double = 0
            var startFrameInTracks: AVAudioFramePosition = 0
            
            for frame in frames {
                
                startSecondFrameInTracks += frame.offsetSecFrameToFrame
                frame.startSecFrameInTracks = startSecondFrameInTracks
                startSecondFrameInTracks += frame.lengthSecFrame
                
                startFrameInTracks += frame.offsetFrameToFrame
                frame.startFrameInTracks = startFrameInTracks
                startFrameInTracks += AVAudioFramePosition(frame.lengthFrame)
                
                length += (frame.lengthSecFrame + frame.offsetSecFrameToFrame)
            }
            if length > tracksModel.lengthSecTime { tracksModel.lengthSecTime = length}
        }
        tracksModel.trackForTracks = dataTracks
        return dataFrames
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
