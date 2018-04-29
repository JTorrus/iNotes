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
    let offset: CGFloat = 220
    var keyBoard: [UIView] = [UIView]()
    var notesPlaceHolder: [UIView] = [UIView]()
    var keysWidth: CGFloat?
    var keysHeight: CGFloat?
    var noteSoundIds: [Key] = [Key]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keysHeight = self.view.frame.size.height
        keysWidth = self.view.frame.size.width / keysNumber
        
        noteSoundIds = Utils.generateSoundIds()
        generateKeys(&keyBoard)
        generatePlaceHolder(&notesPlaceHolder)
        drawLayout()
        
        let swipeGestureRecognizer = UISwipeGestureRecognizer()
        swipeGestureRecognizer.addTarget(self, action: #selector(glissando(gesture:)))
        swipeGestureRecognizer.direction = .right
        
        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func generateKeys(_ keyBoard: inout [UIView]) {
        for i in 0 ..< Int(keysNumber) {
            let newKey = UIView(frame: CGRect(x: CGFloat(i) * keysWidth!, y: offset, width: keysWidth!, height: keysHeight!))
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(gesture:)))
            
            newKey.accessibilityIdentifier = Utils.notes[i]
            newKey.backgroundColor = UIColor.white
            newKey.layer.borderColor = UIColor.black.cgColor
            newKey.layer.borderWidth = 1.0
            newKey.addGestureRecognizer(tapGestureRecognizer)
            
            keyBoard.append(newKey)
        }
    }
    
    private func generatePlaceHolder(_ notesPlaceHolder: inout [UIView]) {
        let totalHeight = self.view.frame.height - offset
        let labelWidth = keysWidth! - 30
        
        for i in 0 ..< Int(keysNumber) {
            let newPlaceHolder = UIView(frame: CGRect(x: CGFloat(i) * keysWidth!, y: 0, width: keysWidth!, height: totalHeight))
            let placeHolderLabel = UILabel(frame: CGRect(x: 15, y: 75, width: labelWidth, height: 30))
            
            placeHolderLabel.textAlignment = .center
            placeHolderLabel.text = Utils.notes[i]
            placeHolderLabel.alpha = 0
            
            newPlaceHolder.addSubview(placeHolderLabel)
            newPlaceHolder.accessibilityIdentifier = Utils.notes[i]
            newPlaceHolder.backgroundColor = UIColor.white
            
            notesPlaceHolder.append(newPlaceHolder)
        }
    }
    
    private func drawLayout() {
        for key in keyBoard {
            self.view.addSubview(key)
        }
        
        for noteLabel in notesPlaceHolder {
            self.view.addSubview(noteLabel)
        }
    }
    
    @objc func tap (gesture: UITapGestureRecognizer) {
        Animations.backgroundTransition(view: gesture.view!)
        
        if let identifier = gesture.view?.accessibilityIdentifier {
            switch identifier {
            case Utils.notes.first!:
                // DO
                AudioServicesPlaySystemSound(noteSoundIds[0].noteId)
                Animations.alphaManipulation(view: notesPlaceHolder[0])
            case Utils.notes[1]:
                // RE
                AudioServicesPlaySystemSound(noteSoundIds[1].noteId)
                Animations.alphaManipulation(view: notesPlaceHolder[1])
            case Utils.notes[2]:
                // MI
                AudioServicesPlaySystemSound(noteSoundIds[2].noteId)
                Animations.alphaManipulation(view: notesPlaceHolder[2])
            case Utils.notes[3]:
                // FA
                AudioServicesPlaySystemSound(noteSoundIds[3].noteId)
                Animations.alphaManipulation(view: notesPlaceHolder[3])
            case Utils.notes[4]:
                // SOL
                AudioServicesPlaySystemSound(noteSoundIds[4].noteId)
                Animations.alphaManipulation(view: notesPlaceHolder[4])
            case Utils.notes[5]:
                // LA
                AudioServicesPlaySystemSound(noteSoundIds[5].noteId)
                Animations.alphaManipulation(view: notesPlaceHolder[5])
            case Utils.notes[6]:
                // SI
                AudioServicesPlaySystemSound(noteSoundIds[6].noteId)
                Animations.alphaManipulation(view: notesPlaceHolder[6])
            case Utils.notes[7]:
                // DO#
                AudioServicesPlaySystemSound(noteSoundIds[7].noteId)
                Animations.alphaManipulation(view: notesPlaceHolder[7])
            default:
                break
            }
        }
    }
    
    @objc func glissando (gesture: UISwipeGestureRecognizer) {
        AudioServicesPlaySystemSound(noteSoundIds.last!.noteId)
        Animations.scaleTransformation(views: keyBoard)
    }
}
