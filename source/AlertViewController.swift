//
//  AlertViewController.swift
//  MABAlertController
//
//  Created by Mohamed Ahmed on 4/17/18.
//  Copyright © 2018 Muhammad Bassio. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
  
  private var dismissButton = UIButton(frame: .zero)
  
  @IBInspectable var hidesByTouch:Bool = false {
    didSet {
      self.dismissButton.isUserInteractionEnabled = self.hidesByTouch
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.dismissButton.addTarget(self, action: #selector(AlertViewController.dismissPressed), for: .touchDown)
    self.view.insertSubview(self.dismissButton, at: 0)
    self.dismissButton.isUserInteractionEnabled = self.hidesByTouch
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewWillLayoutSubviews() {
    self.dismissButton.frame = self.view.bounds
  }
  
  @objc func dismissPressed() {
    self.presentingViewController?.dismiss(animated: true, completion: nil)
  }
  
  @IBAction func dismiss() {
    self.dismissPressed()
  }
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}

