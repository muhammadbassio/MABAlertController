//
//  ViewController.swift
//  MABAlertController
//
//  Created by Mohamed Ahmed on 4/17/18.
//  Copyright © 2018 Muhammad Bassio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  lazy var slideInTransitioningDelegate = PresentationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let controller = segue.destination
    if segue.identifier == "b" {
      slideInTransitioningDelegate.direction = .bottom
    } else {
      slideInTransitioningDelegate.direction = .center
    }
    controller.transitioningDelegate = slideInTransitioningDelegate
    controller.modalPresentationStyle = .custom
  }
  
}


