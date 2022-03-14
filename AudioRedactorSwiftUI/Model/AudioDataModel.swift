//
//  AudioDataModel.swift
//  AudioRedactor
//
//  Created by Александр Панин on 04.03.2022.
//

import AVFAudio

struct AudioDataModel: Identifiable {
    var id = UUID()
    var name = SongModel()
    var file = AVAudioFile()
    var audioLengthSamples: AVAudioFramePosition = 0
    var audioLengthSeconds: Double = 0
    var audioSampleRate: Double = 0
    var audioFormat = AVAudioFormat()
}

