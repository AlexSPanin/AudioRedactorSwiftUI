//
//  Setting.swift
//  AudioEngine
//
//  Created by Александр Панин on 14.02.2022.
//

import SwiftUI

struct SettingUI {
    // font
    let nameFont: String = "Thonburi"
    let smallSize: CGFloat = 9
    let normalSize: CGFloat = 12
    let largeSize: CGFloat = 20
    // color
    let colorText: Color = .red
    let colorTint: Color = .red
    let colorBgrnd: Color = .white
    let colorLabel: Color =  .gray
    let colorBrgndPlayerButton: Color = .black
    let colorTintPlayerButton: Color = .white
    let colorPressedButtonEffect: Color = .green
    // size
    let sizeButton: CGRect = CGRect(x: 0, y: 0, width: 50, height: 60)
    let sizeImageButton: CGRect = CGRect(x: 0, y: 0, width: 50, height: 50)
}
