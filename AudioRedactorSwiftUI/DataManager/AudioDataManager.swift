//
//  DataSongs.swift
//  AudioEngine
//
//  Created by Александр Панин on 18.02.2022.
//

import AVFAudio

struct AudioDataManager {
    
    static var audio = SongModel()
  
    static func fetchAudioData() -> AudioDataModel {
        var audioData = AudioDataModel()
            guard let url = Bundle.main.url(forResource: audio.name, withExtension: audio.format) else { return audioData }
            do {
                let file = try AVAudioFile(forReading: url)
                let format = file.processingFormat
                var dataSong = AudioDataModel()
                dataSong.name = audio
                dataSong.file = file
                dataSong.audioLengthSamples = file.length
                dataSong.audioLengthSeconds = Double(file.length) / format.sampleRate
                dataSong.audioSampleRate = format.sampleRate
                dataSong.audioFormat = format
                audioData = dataSong
            } catch {
                print("error Setup Audio")
            }
        return audioData
    }
}

