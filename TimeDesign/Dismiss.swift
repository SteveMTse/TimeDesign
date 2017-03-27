//
//  Dismiss.swift
//  The New Project
//
//  Created by WENBO XIE on 1/27/17.
//  Copyright © 2017 WENBO XIE. All rights reserved.
//

import Foundation
import UIKit
import ComponentKit

class Dismiss : NSObject, UIViewControllerAnimatedTransitioning {
    
    let homeWindow = UIApplication.shared.keyWindow;
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionTimeInterval_Double;
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
    }
    
}

/*
 Comment #1: The first step is to get a handle of this snapshot view. Luckily, you tagged the snapshot in an earlier step, so you can retrieve it using viewWithTag().
 Comment #2: The animation moves the snapshot back to the center of the screen.
 Comment #3: If the animation finishes, replace the snapshot with the real thing.
 */

//extension Dismiss :  {
//    
//}
