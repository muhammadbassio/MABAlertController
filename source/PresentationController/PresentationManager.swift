//
//  PresentationManager.swift
//  MABAlertController
//
//  Created by Mohamed Ahmed on 4/17/18.
//  Copyright © 2018 Muhammad Bassio. All rights reserved.
//

import UIKit

enum PresentationDirection {
  case left
  case top
  case right
  case bottom
  case center
}

final class PresentationManager: NSObject {
  // MARK: - Properties
  var direction = PresentationDirection.bottom
}

// MARK: - UIViewControllerTransitioningDelegate
extension PresentationManager: UIViewControllerTransitioningDelegate {
  
  func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
    let presentationController = PresentationController(presentedViewController: presented, presenting: presenting, direction: direction)
    return presentationController
  }
  
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return PresentationAnimator(direction: direction, isPresentation: true)
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return PresentationAnimator(direction: direction, isPresentation: false)
  }
}
