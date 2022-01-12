//
//  ViewController.swift
//  Prework
//
//  Created by Jessica Dong on 12/27/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var partySize: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var perPerson: UILabel!
    
    let defaults = UserDefaults.standard
    var firstLoad = true
    var total = 0.0
    
    
    @IBAction func changePartySize(_ sender: Any) {
        if (stepper.value > 0) {
            partySize.text = String(Int(stepper.value))
        } else {
            stepper.value = 1
        }
        let indiv = total / stepper.value
        perPerson.text = String(format: "$%.2f", indiv)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercents = [defaults.double(forKey: "tip1"), defaults.double(forKey: "tip2"), defaults.double(forKey: "tip3")]
        let tip = bill * tipPercents[tipControl.selectedSegmentIndex]
        total = tip + bill
        let indiv = total / stepper.value
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalAmountLabel.text = String(format: "$%.2f", total)
        perPerson.text = String(format: "$%.2f", indiv)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        
        if (firstLoad) {
            defaults.set(0.15, forKey: "tip1")
            defaults.set(0.18, forKey: "tip2")
            defaults.set(0.20, forKey: "tip3")
            defaults.synchronize()
            firstLoad = false
        }
        
        if (stepper.value < 1) {
            stepper.value = 1
        }
        partySize.text = String(Int(stepper.value))
        
        billAmountTextField.becomeFirstResponder()
        billAmountTextField.keyboardType = .numberPad
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let tip1 = defaults.double(forKey: "tip1")
        let tip2 = defaults.double(forKey: "tip2")
        let tip3 = defaults.double(forKey: "tip3")
                
        tipControl.setTitle(String(format: "%d%%", Int(tip1*100)), forSegmentAt: 0)
        tipControl.setTitle(String(format: "%d%%", Int(tip2*100)), forSegmentAt: 1)
        tipControl.setTitle(String(format: "%d%%", Int(tip3*100)), forSegmentAt: 2)

//        billAmountTextField.becomeFirstResponder()
        
//        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }


}

