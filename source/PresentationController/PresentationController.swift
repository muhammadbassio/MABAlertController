//
//  PresentationController.swift
//  MABAlertController
//
//  Created by Mohamed Ahmed on 4/17/18.
//  Copyright © 2018 Muhammad Bassio. All rights reserved.
//

import UIKit

final class PresentationController: UIPresentationController {
  
  // MARK: - Properties
  fileprivate var dimmingView: UIView!
  private var direction: PresentationDirection
  
  override var frameOfPresentedViewInContainerView: CGRect {
    var frame: CGRect = .zero
    frame.size = size(forChildContentContainer: presentedViewController, withParentContainerSize: containerView!.bounds.size)
    return frame
  }
  
  // MARK: - Initializers
  init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?, direction: PresentationDirection) {
    self.direction = direction
    super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    self.setupDimmingView()
  }
  
  override func presentationTransitionWillBegin() {
    containerView?.insertSubview(dimmingView, at: 0)
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[dimmingView]|", options: [], metrics: nil, views: ["dimmingView": self.dimmingView]))
    NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[dimmingView]|", options: [], metrics: nil, views: ["dimmingView": self.dimmingView]))
    
    guard let coordinator = presentedViewController.transitionCoordinator else {
      self.dimmingView.alpha = 1.0
      return
    }
    
    coordinator.animate(alongsideTransition: { _ in
      self.dimmingView.alpha = 1.0
    })
  }
  
  override func dismissalTransitionWillBegin() {
    guard let coordinator = presentedViewController.transitionCoordinator else {
      self.dimmingView.alpha = 0.0
      return
    }
    
    coordinator.animate(alongsideTransition: { _ in
      self.dimmingView.alpha = 0.0
    })
  }
  
  override func containerViewWillLayoutSubviews() {
    self.presentedView?.frame = self.frameOfPresentedViewInContainerView
  }
  
  override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
    return parentSize
  }
}

// MARK: - Private
private extension PresentationController {
  
  func setupDimmingView() {
    self.dimmingView = UIView()
    self.dimmingView.translatesAutoresizingMaskIntoConstraints = false
    self.dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    self.dimmingView.alpha = 0.0
  }
}

