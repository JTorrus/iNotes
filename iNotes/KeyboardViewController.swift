//
//  KeyboardViewController.swift
//  iNotes
//
//  Created by Alumne on 17/4/18.
//  Copyright © 2018 Alumne. All rights reserved.
//

import UIKit
import AudioToolbox

class KeyboardViewController: UIViewController {
    let keysNumber: CGFloat = 8
    var keyBoard: [UIView] = [UIView]()
    var keysWidth: CGFloat?
    var keysHeight: CGFloat?
    var noteSoundIds: [Key] = [Key]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keysHeight = self.view.frame.size.height
        keysWidth = self.view.frame.size.width / keysNumber
        
        noteSoundIds = Utils.generateSoundIds()
        generateKeys(&keyBoard)
        drawKeys()
        
        let swipeGestureRecognizer = UISwipeGestureRecognizer()
        swipeGestureRecognizer.addTarget(self, action: #selector(glissando(gesture:)))
        swipeGestureRecognizer.direction = .right
        
        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateKeys(_ keyBoard: inout [UIView]) {
        let offset: CGFloat = 185
        
        for i in 0 ..< Int(keysNumber) {
            let newKey = UIView(frame: CGRect(x:CGFloat(i) * keysWidth!, y: offset, width: keysWidth!, height: keysHeight!))
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(gesture:)))
            
            newKey.accessibilityIdentifier = Utils.notes[i]
            newKey.backgroundColor = UIColor.white
            newKey.layer.borderColor = UIColor.black.cgColor
            newKey.layer.borderWidth = 1.0
            newKey.addGestureRecognizer(tapGestureRecognizer)
            
            keyBoard.append(newKey)
        }
    }
    
    func drawKeys() {
        for key in keyBoard {
            self.view.addSubview(key)
        }
    }
    
    func backgroundTransition(view: UIView) {
        UIView.animate(withDuration: 0.15, delay: 0.0, options: .autoreverse, animations: {
            view.backgroundColor = UIColor.gray
        }, completion: { finished in
            view.backgroundColor = UIColor.white
        })
    }
    
    @objc func tap (gesture: UITapGestureRecognizer) {
        backgroundTransition(view: gesture.view!)
        
        if let identifier = gesture.view?.accessibilityIdentifier {
            switch identifier {
            case Utils.notes.first!:
                // DO
                AudioServicesPlaySystemSound(noteSoundIds[0].noteId)
            case Utils.notes[1]:
                // RE
                AudioServicesPlaySystemSound(noteSoundIds[1].noteId)
            case Utils.notes[2]:
                // MI
                AudioServicesPlaySystemSound(noteSoundIds[2].noteId)
            case Utils.notes[3]:
                // FA
                AudioServicesPlaySystemSound(noteSoundIds[3].noteId)
            case Utils.notes[4]:
                // SOL
                AudioServicesPlaySystemSound(noteSoundIds[4].noteId)
            case Utils.notes[5]:
                // LA
                AudioServicesPlaySystemSound(noteSoundIds[5].noteId)
            case Utils.notes[6]:
                // SI
                AudioServicesPlaySystemSound(noteSoundIds[6].noteId)
            case Utils.notes.last!:
                // DO#
                AudioServicesPlaySystemSound(noteSoundIds[7].noteId)
            default:
                
                break
            }
        }
    }
    
    @objc func glissando (gesture: UISwipeGestureRecognizer) {
        print("GLISSANDO")
    }
}
