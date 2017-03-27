//
//  PresentFilterMenu.swift
//  TimeDesign
//
//  Created by WENBO XIE on 3/26/17.
//  Copyright © 2017 WENBO XIE. All rights reserved.
//

import Foundation
import UIKit
import ComponentKit

class presentFilterMenu: Present {
    
    override func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard
            let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
            else {
                return
        }
        
        let containerView = transitionContext.containerView;
        containerView.insertSubview(toVC.view, aboveSubview: fromVC.view);
        
        let snapshot = fromVC.view.snapshotView();
        snapshot?.tag = ShowHelper.snapshotNumber
        snapshot?.isUserInteractionEnabled = false
        snapshot?.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height);
        toVC.view.alpha = 0;
        fromVC.view.isHidden = true;
        containerView.insertSubview(snapshot!, aboveSubview: fromVC.view)
        
        /*
         animateWithDuration: The animation duration is set to 0.6 seconds.
         animations: The snapshot is shifted to the right by 80% of the screen’s width.
         completion: You set he MainViewController hidden state back to normal, so that it’s ready for next time.
         */
        
        self.homeWindow?.viewWithTag(98765)?.alpha = 0
        
        UIView.animate(withDuration: ShowHelper.duration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            toVC.view.alpha = 1;
            //.backgroundColor = UIColor.clear;
        },
                       completion: { _ in
                        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        });
        
    }
    
}
