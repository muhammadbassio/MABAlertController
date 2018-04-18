//
//  PresentationAnimator.swift
//  MABAlertController
//
//  Created by Mohamed Ahmed on 4/17/18.
//  Copyright © 2018 Muhammad Bassio. All rights reserved.
//

import UIKit

final class PresentationAnimator: NSObject {
  
  // MARK: - Properties
  let direction: PresentationDirection
  let isPresentation: Bool
  
  // MARK: - Initializers
  init(direction: PresentationDirection, isPresentation: Bool) {
    self.direction = direction
    self.isPresentation = isPresentation
    super.init()
  }
}

// MARK: - UIViewControllerAnimatedTransitioning
extension PresentationAnimator: UIViewControllerAnimatedTransitioning {
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.4
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let key = isPresentation ? UITransitionContextViewControllerKey.to : UITransitionContextViewControllerKey.from
    let controller = transitionContext.viewController(forKey: key)!
    
    if self.isPresentation {
      transitionContext.containerView.addSubview(controller.view)
    }
    
    let presentedFrame = transitionContext.finalFrame(for: controller)
    var dismissedFrame = presentedFrame
    switch direction {
    case .left:
      dismissedFrame.origin.x = -presentedFrame.width
    case .right:
      dismissedFrame.origin.x = transitionContext.containerView.frame.size.width
    case .top:
      dismissedFrame.origin.y = -presentedFrame.height
    case .bottom:
      dismissedFrame.origin.y = transitionContext.containerView.frame.size.height
    case .center:
      dismissedFrame.origin.x = 0
    }
    
    
    let initialFrame = self.isPresentation ? dismissedFrame : presentedFrame
    let finalFrame = self.isPresentation ? presentedFrame : dismissedFrame
    
    let animationDuration = transitionDuration(using: transitionContext)
    controller.view.frame = initialFrame
    if self.direction == .center {
      controller.view.frame = finalFrame
      if self.isPresentation {
        controller.view.transform = CGAffineTransform(scaleX: 0.000001, y: 0.000001)
      } else {
        controller.view.alpha = 1
      }
    }
    UIView.animate(withDuration: animationDuration, animations: {
      if self.direction == .center {
        if self.isPresentation {
          controller.view.transform = CGAffineTransform(scaleX: 1, y: 1)
        } else {
          controller.view.transform = CGAffineTransform(scaleX: 0.000001, y: 0.000001)
        }
      } else {
        controller.view.frame = finalFrame
      }
    }) { finished in
      transitionContext.completeTransition(finished)
    }
  }
}

