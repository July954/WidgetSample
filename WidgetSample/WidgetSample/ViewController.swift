//
//  ViewController.swift
//  WidgetSample
//
//  Created by adcapsule on 2020/04/03.
//  Copyright © 2020 shAhn. All rights reserved.
//

import UIKit

/*
 You Must Use GroupDefault To Share With Today Extenstion
 To Use GroupDefault, Please Check The Capailities On "App Groups"
 And Confirm Right Group ID Checked To Use
 
 Must All Target Use App Groups Capailities Which Use GroupDefault
 
 In Common Group ID will "group.(YOUR_BUNDLEID)"
 */
let GROUPDEFAULT                = UserDefaults.init(suiteName: "group.com.shTest.WidgetSample")

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var tfInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func saveBtnPressed(_ sender: UIButton) {
        
        let text = tfInput.text
       
        if text == "" || text == nil {
            CommonAlert.showAlertType1(vc: self ,message: "Please Type Anything")
            return
        } else {
            GROUPDEFAULT?.set(text, forKey: "DATA")
            CommonAlert.showAlertType1(vc: self ,message: "Saved! Please Check The Widget")
        }
        
    }
    
    // Done Button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    
}

