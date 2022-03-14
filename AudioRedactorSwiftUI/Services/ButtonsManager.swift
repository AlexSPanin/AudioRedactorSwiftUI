//
//  ButtonsEffect.swift
//  AudioEngine
//
//  Created by Александр Панин on 18.02.2022.
//

import Foundation
import SwiftUI

enum ButtonsPlayer: Int {
    case gobackward, backward, play, forward, goforward
}

enum ButtonsEditor: Int {
    case effect, copy, cut, off, on, trash
}

enum ButtonsEffect: Int {
    case exit, volume, eq, reverb, delay
}

struct PlayerButtons: Hashable {
    
    var id: Int {type.rawValue}
    let type: ButtonsPlayer
    let nameImage: String
    
    static func getPlayerButtons() -> [PlayerButtons] {
        [
            PlayerButtons(type: .gobackward, nameImage: "gobackward"),
            PlayerButtons(type: .backward, nameImage: "backward"),
            PlayerButtons(type: .play, nameImage: "play"),
            PlayerButtons(type: .forward, nameImage: "forward"),
            PlayerButtons(type: .goforward, nameImage: "goforward")
        ]
    }
}

struct EditorButtons: Hashable {
    
    var id: Int {type.rawValue}
    let type: ButtonsEditor
    let nameImage: String

    static func getEditorButtons() -> [EditorButtons] {
        [
            EditorButtons(type: .effect, nameImage: "fx"),
            EditorButtons(type: .copy, nameImage: "square.on.square"),
            EditorButtons(type: .cut, nameImage: "scissors"),
            EditorButtons(type: .off, nameImage: "speaker"),
            EditorButtons(type: .on, nameImage: "speaker.wave.2"),
            EditorButtons(type: .trash, nameImage: "trash")
        ]
    }
}

struct EffectButtons: Hashable {
    
    var id: Int {type.rawValue}
    let type: ButtonsEffect
    let name: String
    let nameImage: String

    static func getEffectButtons() -> [EffectButtons] {
        [
            EffectButtons(type: .exit, name: "Выход", nameImage: "fx"),
            EffectButtons(type: .volume, name: "Громкость", nameImage: "dot.radiowaves.up.forward"),
            EffectButtons(type: .eq, name: "Частоты", nameImage: "slider.vertical.3"),
            EffectButtons(type: .reverb, name: "Реверб", nameImage: "camera.metering.multispot"),
            EffectButtons(type: .delay, name: "Дилэй", nameImage: "antenna.radiowaves.left.and.right")
        ]
    }
}

