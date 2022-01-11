//
//  SettingsViewController.swift
//  Prework
//
//  Created by Jessica Dong on 12/27/21.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var tip1TextField: UITextField!
    @IBOutlet weak var tip2TextField: UITextField!
    @IBOutlet weak var tip3TextField: UITextField!
    
    let defaults = UserDefaults.standard
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func changedTip1(_ sender: Any) {
        let tip1 = (Double(tip1TextField.text!) ?? 15) / 100
        defaults.set(tip1, forKey: "tip1")
        print(defaults.double(forKey: "tip1"))
        defaults.synchronize()
    }
    
    
    @IBAction func changedTip2(_ sender: Any) {
        let tip2 = (Double(tip2TextField.text!) ?? 18) / 100
        defaults.set(tip2, forKey: "tip2")
        print(defaults.double(forKey: "tip2"))
        defaults.synchronize()
    }
    
    
    @IBAction func changedTip3(_ sender: Any) {
        let tip3 = (Double(tip3TextField.text!) ?? 20) / 100
        defaults.set(tip3, forKey: "tip3")
        print(defaults.double(forKey: "tip3"))
        defaults.synchronize()
    }
}
