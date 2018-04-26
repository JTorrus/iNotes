//
//  QueenViewController.swift
//  iNotes
//
//  Created by Javier Torrus on 26/04/2018.
//  Copyright © 2018 Alumne. All rights reserved.
//

import UIKit
import AVFoundation

class QueenViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let musicSoundPlayer = Utils.generateMusicUrl() {
            if initAVAudioSession() {
                prepareAudioPlayer(musicSoundPlayer)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func initAVAudioSession() -> Bool {
        do {
            try AVAudioSession.sharedInstance().setActive(true)
            return true
        } catch {
            print("Failure while setting active the AVAudioSession")
        }
        
        return false
    }
    
    private func prepareAudioPlayer(_ musicSoundPlayer: AVAudioPlayer) {
        musicSoundPlayer.numberOfLoops = Int(-1)
        musicSoundPlayer.play()
    }
}
