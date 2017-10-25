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
        
    }
    
    @objc func keyboardWillHide() {
        
        
    }
    
    @objc func keyboardWillShow() {
        
        
    }


}

