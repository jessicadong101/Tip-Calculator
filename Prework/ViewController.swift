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
    
    let defaults = UserDefaults.standard
    var firstLoad = true
    
    
//    @IBAction func enteredBillAmount(_ sender: Any) {
//        let bill = Double(billAmountTextField.text!) ?? 0
//        let tipPercents = [defaults.double(forKey: "tip1"), defaults.double(forKey: "tip2"), defaults.double(forKey: "tip3")]
//        let tip = bill * tipPercents[tipControl.selectedSegmentIndex]
//        let total = tip + bill
//
//        tipAmountLabel.text = String(format: "$%.2f", tip)
//        totalAmountLabel.text = String(format: "$%.2f", total)
//    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercents = [defaults.double(forKey: "tip1"), defaults.double(forKey: "tip2"), defaults.double(forKey: "tip3")]
        let tip = bill * tipPercents[tipControl.selectedSegmentIndex]
        let total = tip + bill
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalAmountLabel.text = String(format: "$%.2f", total)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        
        //https://www.youtube.com/watch?v=M_fP2i0tl0Q
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
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let tip1 = defaults.double(forKey: "tip1")
        let tip2 = defaults.double(forKey: "tip2")
        let tip3 = defaults.double(forKey: "tip3")
        
        print(tip1*100)
        
        tipControl.setTitle(String(format: "%d%%", Int(tip1*100)), forSegmentAt: 0)
        tipControl.setTitle(String(format: "%d%%", Int(tip2*100)), forSegmentAt: 1)
        tipControl.setTitle(String(format: "%d%%", Int(tip3*100)), forSegmentAt: 2)

        
        print("view did appear")
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

