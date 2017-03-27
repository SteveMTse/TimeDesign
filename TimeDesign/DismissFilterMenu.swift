//
//  DismissFilterMenu.swift
//  TimeDesign
//
//  Created by WENBO XIE on 3/26/17.
//  Copyright © 2017 WENBO XIE. All rights reserved.
//

import Foundation
import UIKit
import ComponentKit

class dismissFilterMenu: Dismiss {
    
    override func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard
            let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
            else {
                return
        }
        
        let containerView = transitionContext.containerView
        let snapshot = containerView.viewWithTag(ShowHelper.snapshotNumber)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            fromVC.view.alpha = 0;
            //.backgroundColor = UIColor.themeColor;
            },
                completion: { _ in
                    let didTransitionComplete = !transitionContext.transitionWasCancelled
                    if didTransitionComplete {
                    // 3
                        containerView.insertSubview(toVC.view, aboveSubview: snapshot!);
                        self.homeWindow?.viewWithTag(98765)?.alpha = 1
                        snapshot?.removeFromSuperview()
                    }
                    transitionContext.completeTransition(didTransitionComplete)
                    toVC.view.isHidden = false;
            }
        )
        
    }
    
}
