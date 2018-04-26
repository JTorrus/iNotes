//
//  Utils.swift
//  iNotes
//
//  Created by Alumne on 17/4/18.
//  Copyright © 2018 Alumne. All rights reserved.
//

import Foundation
import AudioToolbox
import AVFoundation

class Utils {
    static let notes = ["DO", "RE", "MI", "FA", "SOL", "LA", "SI", "DO#"]
    static let musicFile = "tsmgo"
    static let defaultExtension = "mp3"
    
    static func generateSoundIds() -> [Key] {
        var arrayOfSoundsId = [Key]()
        
        for note in notes {
            if let soundUrl = Bundle.main.url(forResource: note, withExtension: defaultExtension) {
                var pianoKey = Key()
                
                pianoKey.note = note
                AudioServicesCreateSystemSoundID(soundUrl as CFURL, &pianoKey.noteId)
                
                arrayOfSoundsId.append(pianoKey)
            }
        }
        
        return arrayOfSoundsId
    }
    
    static func generateMusicUrl() -> AVAudioPlayer? {
        var musicAudioPlayer: AVAudioPlayer?
        
        if let soundMusicUrl = Bundle.main.url(forResource: musicFile, withExtension: defaultExtension) {
            musicAudioPlayer = try! AVAudioPlayer(contentsOf: soundMusicUrl)
            musicAudioPlayer!.prepareToPlay()
        }
        
        return musicAudioPlayer
    }
}
