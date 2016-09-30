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
    
    @IBOutlet weak var swithTheme: UISwitch!
    
    // MARK: Actions
    @IBAction func onSaveBtnTap(_ sender: AnyObject) {
        
        let defaultTip = Double(txtDefaultTip.text!) ?? 0
        
        let defaults = UserDefaults.standard
        
        defaults.set(defaultTip, forKey: "defaultTip")
        
        defaults.synchronize()
        view.endEditing(true)
        
    }
    
    @IBAction func changeTheme(_ sender: AnyObject) {
        if swithTheme.isOn {
            self.navigationController?.navigationBar.barTintColor = UIColor.orange
            self.view.backgroundColor = UIColor.orange
            let defaults = UserDefaults.standard
            
            defaults.set(true, forKey: "shouldApplyTheme")
            
            defaults.synchronize()
            
        } else {
        self.navigationController?.navigationBar.barTintColor = UIColor.groupTableViewBackground
            self.view.backgroundColor = UIColor.white
            let defaults = UserDefaults.standard
            
            defaults.set(false, forKey: "shouldApplyTheme")
            
            defaults.synchronize()
        }
    }
    
    // MARK: View Life Cycle methods
    override func viewWillAppear(_ animated: Bool) {
        txtDefaultTip.becomeFirstResponder()
        let defaults = UserDefaults.standard
        
        let defaultTip = defaults.double(forKey: "defaultTip")
        
        txtDefaultTip.text = String(format: "%.2f", defaultTip)
        
        if defaults.bool(forKey: "shouldApplyTheme") {
            swithTheme.setOn(true, animated: false)
            self.view.backgroundColor = UIColor.orange
            self.navigationController?.navigationBar.barTintColor = UIColor.orange
        } else {
            self.navigationController?.navigationBar.barTintColor = UIColor.groupTableViewBackground
            self.view.backgroundColor = UIColor.white
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
