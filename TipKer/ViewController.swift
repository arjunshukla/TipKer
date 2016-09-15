//
//  ViewController.swift
//  TipKer
//
//  Created by Arjun Shukla on 9/14/16.
//  Copyright © 2016 arjunshukla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var txtBillAmount: UITextField!
    
    @IBOutlet weak var lblTipAmount: UILabel!
    
    @IBOutlet weak var lblTotalAmount: UILabel!
    
    @IBOutlet weak var segmentControlTip: UISegmentedControl!

    @IBOutlet weak var lblDefaultTip: UILabel!
    
    // MARK: Variables
    var arrTipPercentages = [10.0, 15.0, 20.0,0.0]
    
    
    // MARK: Actions
    @IBAction func calculateTip(sender: AnyObject) {
        
        
        let bill = Double(txtBillAmount.text!) ?? 0
        let tip:Double = bill * arrTipPercentages[segmentControlTip.selectedSegmentIndex] / 100
        let total = bill + tip
        
        // Optionally initialize the property to a desired starting value
        lblTotalAmount.alpha = 0
        lblTipAmount.alpha = 0
        UIView.animateWithDuration(0.4, animations: {
            self.lblTotalAmount.alpha = 1
            self.lblTipAmount.alpha = 1
        })
        
        lblTipAmount.text = String(format: "$ %.2f", tip)
        lblTotalAmount.text = String(format: "$ %.2f", total)
        
    }
    
    // MARK: Tap Gesture Action
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    // MARK: View Life Cycle methods
    override func viewWillAppear(animated: Bool) {
        
        txtBillAmount.becomeFirstResponder()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let defaultTip = defaults.doubleForKey("defaultTip")
       
        arrTipPercentages[3] = defaultTip
        lblDefaultTip.text = String(format: "Default Tip percentage:      %.2f", defaultTip)
        calculateTip(self)
    }
}

