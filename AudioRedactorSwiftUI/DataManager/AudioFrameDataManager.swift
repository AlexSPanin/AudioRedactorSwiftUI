//
//  AudioFrameDataManager.swift
//  AudioRedactor
//
//  Created by Александр Панин on 06.03.2022.
//

import AVFAudio

struct AudioFrameDataManager {
    
    static var audioData = AudioDataModel()
    
    //MARK: - new frame from library for Track and Offset
    static func getFrame(track: Int, offset: Double ) -> AudioFrameModel {
        
        var dataAudioFrame = AudioFrameModel()
        dataAudioFrame.audioForFrame = audioData
        dataAudioFrame.effectFrame = EffectFrameModel()
        dataAudioFrame.track = track
        
        let sampleRate = audioData.audioSampleRate
        
        // начало фрэйма в связанном аудиофайле
        dataAudioFrame.startSecFrameInAudio = 0
        dataAudioFrame.startFrameInAudio = 0
        
        // длина фрэйма в связанном аудиофайле
        
        dataAudioFrame.lengthSecFrame = audioData.audioLengthSeconds
        dataAudioFrame.lengthFrame = audioData.audioLengthSamples
        
        // смещение фрэйма от предыдущего фрейма или начала трэка
        dataAudioFrame.offsetSecFrameToFrame = offset
        dataAudioFrame.offsetFrameToFrame = AVAudioFramePosition(offset * sampleRate)
        
        return dataAudioFrame
    }
    
    //MARK: - change Start point in Track, Length and Offset
    static func settingFrameDate(frame: AudioFrameModel, startInAudio: Double, length: Double, offset: Double ) -> AudioFrameModel {
        
        // прверка если 0 или больше длины аудиофайла то длинна всего аудиофайла
        
        let length = length == 0 || length > audioData.audioLengthSeconds ? audioData.audioLengthSeconds : length
        let startInAudio = startInAudio > audioData.audioLengthSeconds ? 0 : startInAudio
        
        let sampleRate = audioData.audioSampleRate
        var dataAudioFrame = frame
     
        // начало фрэйма в связанном аудиофайле
        dataAudioFrame.startSecFrameInAudio = startInAudio
        dataAudioFrame.startFrameInAudio = AVAudioFramePosition(startInAudio * sampleRate)
        
        // длина фрэйма в связанном аудиофайле
        
        dataAudioFrame.lengthSecFrame = length
        dataAudioFrame.lengthFrame = AVAudioFrameCount(length * sampleRate)
        
        // смещение фрэйма от предыдущего фрейма или начала трэка
        dataAudioFrame.offsetSecFrameToFrame = offset
        dataAudioFrame.offsetFrameToFrame = AVAudioFramePosition(offset * sampleRate)
        
        return dataAudioFrame
    }
    
    static func changeTrackFrame(track: Int, startInAudio: Double, length: Double, offset: Double ) -> AudioFrameModel {
        
        // прверка если 0 или больше длины аудиофайла то длинна всего аудиофайла
        
        let length = length == 0 || length > audioData.audioLengthSeconds ? audioData.audioLengthSeconds : length
        let startInAudio = startInAudio > audioData.audioLengthSeconds ? 0 : startInAudio
        
        var dataAudioFrame = AudioFrameModel()
        dataAudioFrame.audioForFrame = audioData
        dataAudioFrame.effectFrame = EffectFrameModel()
        dataAudioFrame.track = track
        
        let sampleRate = audioData.audioSampleRate
        
        // начало фрэйма в связанном аудиофайле
        dataAudioFrame.startSecFrameInAudio = startInAudio
        dataAudioFrame.startFrameInAudio = AVAudioFramePosition(startInAudio * sampleRate)
        
        // длина фрэйма в связанном аудиофайле
        
        dataAudioFrame.lengthSecFrame = length
        dataAudioFrame.lengthFrame = AVAudioFrameCount(length * sampleRate)
        
        // смещение фрэйма от предыдущего фрейма или начала трэка
        dataAudioFrame.offsetSecFrameToFrame = offset
        dataAudioFrame.offsetFrameToFrame = AVAudioFramePosition(offset * sampleRate)
        
        return dataAudioFrame
    }
    
    static func changeLengthFrame(track: Int, startInAudio: Double, length: Double, offset: Double ) -> AudioFrameModel {
        
        // прверка если 0 или больше длины аудиофайла то длинна всего аудиофайла
        
        let length = length == 0 || length > audioData.audioLengthSeconds ? audioData.audioLengthSeconds : length
        let startInAudio = startInAudio > audioData.audioLengthSeconds ? 0 : startInAudio
        
        var dataAudioFrame = AudioFrameModel()
        dataAudioFrame.audioForFrame = audioData
        dataAudioFrame.effectFrame = EffectFrameModel()
        dataAudioFrame.track = track
        
        let sampleRate = audioData.audioSampleRate
        
        // начало фрэйма в связанном аудиофайле
        dataAudioFrame.startSecFrameInAudio = startInAudio
        dataAudioFrame.startFrameInAudio = AVAudioFramePosition(startInAudio * sampleRate)
        
        // длина фрэйма в связанном аудиофайле
        
        dataAudioFrame.lengthSecFrame = length
        dataAudioFrame.lengthFrame = AVAudioFrameCount(length * sampleRate)
        
        // смещение фрэйма от предыдущего фрейма или начала трэка
        dataAudioFrame.offsetSecFrameToFrame = offset
        dataAudioFrame.offsetFrameToFrame = AVAudioFramePosition(offset * sampleRate)
        
        return dataAudioFrame
    }
}
