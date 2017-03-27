//
//  ShowHelper.swift
//  The New Project
//
//  Created by WENBO XIE on 1/26/17.
//  Copyright © 2017 WENBO XIE. All rights reserved.
//

import Foundation
import Foundation
import UIKit

enum Direction {
    case Up
    case Down
    case Left
    case Right
}

struct dimensionForAccountView {
    
    static let gap:CGFloat = UIScreen.main.bounds.height * 0.07;
    //static let height = UIScreen.main.bounds.height - CGFloat(dimensionForAccountView.gap);
    
}

struct ShowHelper {
    
    static let duration = 0.3;
    static let menuWidth:CGFloat = 0.8 //This constant defines the width of the slide-out menu. For now, it’s hard-coded to 80%.
    static let percentThreshold:CGFloat = 0.3 //This is how far the user must pan before the menu changes state. This is set to 30%.
    static let snapshotNumber = 12345 //This is just a constant used to tag a snapshot view for later retrieval.
    
    /*
     translationInView: The user’s touch coordinates.
     viewBounds: The screen’s dimensions.
     direction: The direction that the slide-out menu is moving.
     */
    
    //This method calculates the progress in a particular direction. For example, if you specify the .Right direction, it only cares about movement along the positive-x direction. Likewise, .Left tracks progress in the negative-x direction.
    
    static func calculateProgress(translationInView:CGPoint, viewBounds:CGRect, direction:Direction) -> CGFloat {
        let pointOnAxis:CGFloat
        let axisLength:CGFloat
        switch direction {
        case .Up, .Down:
            pointOnAxis = translationInView.y
            axisLength = viewBounds.height
        case .Left, .Right:
            pointOnAxis = translationInView.x
            axisLength = viewBounds.width
        }
        let movementOnAxis = pointOnAxis / axisLength
        let positiveMovementOnAxis:Float
        let positiveMovementOnAxisPercent:Float
        switch direction {
        case .Right, .Down: // positive
            positiveMovementOnAxis = fmaxf(Float(movementOnAxis), 0.0)
            positiveMovementOnAxisPercent = fminf(positiveMovementOnAxis, 1.0)
            return CGFloat(positiveMovementOnAxisPercent)
        case .Up, .Left: // negative
            positiveMovementOnAxis = fminf(Float(movementOnAxis), 0.0)
            positiveMovementOnAxisPercent = fmaxf(positiveMovementOnAxis, -1.0)
            return CGFloat(-positiveMovementOnAxisPercent)
        }
    }
    
    /*
     
     gestureState: The state of the pan gesture.
     progress: How far across the screen the user has panned.
     interactor: The UIPercentDrivenInteractiveTransition object that also serves as a state machine.
     triggerSegue: A closure that is called to initiate the transition. The closure will contain something like performSegueWithIdentifier().
     This method maps the pan gesture state to various Interactor method calls.
     .Began: The hasStarted flag indicates that the interactive transition is in progress. Also, triggerSegue() is called to initiate the transition.
     
     Note: Even though you just performed a segue, don’t worry — it won’t get very far before running into the other gesture states.
     
     .Changed: The user’s progress is passed into the updateInteractiveTransition() method. For example, if the user dragged 50% across the screen, the transition animation will scrub to its halfway point.
     .Cancelled: This maps directly to the cancelInteractiveTransition() method.
     .Ended: Depending on how far the user panned, the interactor either finishes or cancels the transition.
     
     */
    
    static func mapGestureStateToInteractor(gestureState:UIGestureRecognizerState, progress:CGFloat, interactor: Interactor?, triggerSegue: () -> Void){
        guard let interactor = interactor else { return }
        switch gestureState {
        case .began:
            interactor.hasStarted = true
            triggerSegue()
        case .changed:
            interactor.shouldFinish = progress > percentThreshold
            interactor.update(progress)
        case .cancelled:
            interactor.hasStarted = false
            interactor.cancel()
        case .ended:
            interactor.hasStarted = false
            interactor.shouldFinish
                ? interactor.finish()
                : interactor.cancel()
        default:
            break
        }
    }
    
    static func stateTest(gesture: UIGestureRecognizer) -> String {
        
        switch gesture.state {
        case .began:
            return "Began";
        case .cancelled:
            return "Cancelled";
        case .changed:
            return "Changed";
        case .ended:
            return "Ended";
        case .failed:
            return "Failed";
        case .possible:
            return "Possible";
        }
        
    }
    
}
