//
//  Present.swift
//  The New Project
//
//  Created by WENBO XIE on 1/27/17.
//  Copyright © 2017 WENBO XIE. All rights reserved.
//

import Foundation
import UIKit
import ComponentKit

class Present : NSObject, UIViewControllerAnimatedTransitioning {
    
    let homeWindow = UIApplication.shared.keyWindow;
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionTimeInterval_Double;
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // For Guard Key Words, we can unwrap those optional value safely and assgin the value the varible on the left of equal sign. Or it will return some info to notify us.
        
        
        /*
         tag: Serves as a handle you’ll use to remove the snapshot later on.
         userInteractionEnabled: You set this to false so you can tap objects behind the snapshot. This becomes useful in a later step.
         shadowOpacity: This is a visual cue that the snapshot floats above the green menu.
         */
        
        
        /*
         animateWithDuration: The animation duration is set to 0.6 seconds.
         animations: The snapshot is shifted to the right by 80% of the screen’s width.
         completion: You set he MainViewController hidden state back to normal, so that it’s ready for next time.
         */
        
        
        
    }
    
}
    
