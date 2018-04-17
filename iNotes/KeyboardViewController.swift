//
//  KeyboardViewController.swift
//  iNotes
//
//  Created by Alumne on 17/4/18.
//  Copyright © 2018 Alumne. All rights reserved.
//

import UIKit

class KeyboardViewController: UIViewController {
    let keysNumber: CGFloat = 8
    var keyBoard: [UIView] = [UIView]()
    var keysWidth: CGFloat?
    var keysHeight: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keysHeight = self.view.frame.size.height
        keysWidth = self.view.frame.size.width / keysNumber
        
        generateKeys(&keyBoard)
        drawKeys()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateKeys(_ keyBoard: inout [UIView]) {
        let offset: CGFloat = 128
        
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
    
    @objc func tap (gesture: UITapGestureRecognizer) {
        if let identifier = gesture.view?.accessibilityIdentifier {
            switch identifier {
            case Utils.notes.first!:
                // DO
                print("")
            case Utils.notes[1]:
                // RE
                print("")
            case Utils.notes[2]:
                // MI
                print("")
            case Utils.notes[3]:
                // FA
                print("")
            case Utils.notes[4]:
                // SOL
                print("")
            case Utils.notes[5]:
                // LA
                print("")
            case Utils.notes[6]:
                // SI
                print("")
            case Utils.notes.last!:
                // DO#
                print("")
            default:
                break
            }
        }
    }
    
}
