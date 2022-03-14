//
//  VolumeModel.swift
//  AudioRedactor
//
//  Created by Александр Панин on 06.03.2022.
//

import AVFAudio

struct VolumeFrameModel {
    var startPointFrame: AVAudioFramePosition = 0
    var endPointFrame: AVAudioFramePosition = 0
    var increment: Float = 0
}
