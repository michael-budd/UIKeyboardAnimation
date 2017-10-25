//
//  ViewController.swift
//  UIKeyboardAnimation
//
//  Created by Michael Budd on 10/25/17.
//  Copyright © 2017 Michael Budd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nc = NotificationCenter.default
        
        nc.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
        
        nc.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardDidShow, object: nil)
        
    }

    @IBAction func postButtonTapped(_ sender: UIButton) {
        self.textField.text = ""
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        
        guard let userInfo = notification.userInfo,
            let animationDuration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? Double,
            let animationCurveRaw = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? Int,
            let animationCurve = UIViewAnimationCurve(rawValue: animationCurveRaw) else { return }
        
        view.layoutIfNeeded()
        bottomConstraint.constant = 0
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(animationDuration)
        UIView.setAnimationCurve(animationCurve)
        UIView.setAnimationBeginsFromCurrentState(true)
        
        view.layoutIfNeeded()
        UIView.commitAnimations()
        
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        
        guard let userInfo = notification.userInfo,
            let animationDuration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? Double,
            let animationCurveRaw = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? Int,
            let animationCurve = UIViewAnimationCurve(rawValue: animationCurveRaw),
            let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        // Identify the end fram of the rectangle of the key
        view.layoutIfNeeded()
        
        bottomConstraint.constant = keyboardFrame.size.height
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(animationDuration)
        UIView.setAnimationCurve(animationCurve)
        UIView.setAnimationBeginsFromCurrentState(true)
        
        view.layoutIfNeeded()
        UIView.commitAnimations()
    }


}


















