//
//  SettingsViewController.swift
//  TipKer
//
//  Created by Arjun Shukla on 9/14/16.
//  Copyright © 2016 arjunshukla. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {

    
    
    // MARK: Outlets
    @IBOutlet weak var txtDefaultTip: UITextField!
    
    
    // MARK: Actions
    @IBAction func onSaveBtnTap(sender: AnyObject) {
        
        let defaultTip = Double(txtDefaultTip.text!) ?? 0
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setDouble(defaultTip, forKey: "defaultTip")
        
        defaults.synchronize()
        view.endEditing(true)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        txtDefaultTip.becomeFirstResponder()
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let defaultTip = defaults.doubleForKey("defaultTip")
        
        txtDefaultTip.text = String(format: "%.2f", defaultTip)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
}