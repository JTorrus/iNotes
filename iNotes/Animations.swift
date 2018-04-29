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
    
    static func rotationTransformation(views: [UIView]) {
        let scaleTransformation = CGAffineTransform(rotationAngle: 30 * CGFloat.pi / 180)
        let scaleDefault = CGAffineTransform.identity
        
        for i in 0 ..< views.count {
            UIView.animate(withDuration: 0.35, delay: Double(Double(i) * 0.1), options: .autoreverse, animations: {
                views[i].transform = scaleTransformation
                views[i].backgroundColor = UIColor.purple
            }, completion: { finished in
                views[i].transform = scaleDefault
                views[i].backgroundColor = UIColor.white
            })
        }
    }
}
