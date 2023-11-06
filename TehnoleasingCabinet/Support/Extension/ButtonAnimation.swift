//
//  ButtonAnimation.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 25.10.2023.
//

import Foundation
import UIKit
extension UIView {

/**
 Simply zooming in of a view: set view scale to 0 and zoom to Identity on 'duration' time interval.

 - parameter duration: animation duration
 */
func zoomIn(duration: TimeInterval = 0.2) {
    self.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
    UIView.animate(withDuration: duration, delay: 0.0, options: [.curveLinear], animations: { () -> Void in
        self.transform = .identity
        }) { (animationCompleted: Bool) -> Void in
    }
}

func zoomInWithEasing(duration: TimeInterval = 0.15, easingOffset: CGFloat = 0.05) {
    let easeScale = 1.0 + easingOffset
    let easingDuration = TimeInterval(easingOffset) * duration / TimeInterval(easeScale)
    let scalingDuration = duration - easingDuration
    UIView.animate(withDuration: scalingDuration, delay: 0.0, options: .curveEaseIn, animations: { () -> Void in
        self.transform = CGAffineTransform(scaleX: easeScale, y: easeScale)
        self.alpha = 0.9
        }, completion: { (completed: Bool) -> Void in
            UIView.animate(withDuration: easingDuration, delay: 0.0, options: .curveEaseOut, animations: { () -> Void in
                self.transform = .identity
                self.alpha = 1
                }, completion: { (completed: Bool) -> Void in
            })
    })
}

}
