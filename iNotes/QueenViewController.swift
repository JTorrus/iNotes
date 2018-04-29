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
    var musicAudioPlayer: AVAudioPlayer?
    let musicFileName = "tsmgo"
    @IBOutlet weak var controlButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if initAVAudioSession() {
            prepareAudioPlayer()
            startPlaying()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func actionPerformed(_ sender: UIBarButtonItem) {
        if sender.tag == 0 {
            if musicAudioPlayer!.isPlaying {
                stopPlaying()
            } else {
                startPlaying()
            }
        } else {
            resetSong()
        }
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
    
    private func prepareAudioPlayer() {
        if let soundMusicUrl = Bundle.main.url(forResource: musicFileName, withExtension: Utils.defaultExtension) {
            musicAudioPlayer = try! AVAudioPlayer(contentsOf: soundMusicUrl)
            musicAudioPlayer!.prepareToPlay()
            musicAudioPlayer!.numberOfLoops = Int(-1)
        }
    }
    
    private func startPlaying() {
        musicAudioPlayer!.play()
        controlButton.image = UIImage(named: "pause")
    }
    
    private func stopPlaying() {
        musicAudioPlayer!.stop()
        controlButton.image = UIImage(named: "play")
    }
    
    private func resetSong() {
        musicAudioPlayer!.currentTime = 0
        startPlaying()
    }
    
}
