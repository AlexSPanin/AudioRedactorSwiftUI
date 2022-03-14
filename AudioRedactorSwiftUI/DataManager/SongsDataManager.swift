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
    

