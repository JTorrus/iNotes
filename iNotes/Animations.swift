//
//  Animations.swift
//  iNotes
//
//  Created by Javier Torrus on 26/04/2018.
//  Copyright © 2018 Alumne. All rights reserved.
//

import Foundation
import UIKit

class Animations {
    static func backgroundTransition(view: UIView) {
        UIView.animate(withDuration: 0.15, delay: 0.0, options: .autoreverse, animations: {
            view.backgroundColor = UIColor.gray
        }, completion: { finished in
            view.backgroundColor = UIColor.white
        })
    }
    
    static func alphaManipulation(view: UIView) {
        if let correspondingLabel = view.subviews[0] as? UILabel {
            UIView.animate(withDuration: 0.30, delay: 0.0, options: .autoreverse, animations: {
                correspondingLabel.alpha = 1
            }, completion: { finished in
                correspondingLabel.alpha = 0
            })
        }
    }
    
    static func scaleTransformation(views: [UIView]) {
        for view in views {
            
        }
    }
}
