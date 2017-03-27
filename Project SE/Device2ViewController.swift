//
//  Device2ViewController.swift
//  Project SE
//
//  Created by Thitiwat on 3/28/2560 BE.
//  Copyright © 2560 thitiwat. All rights reserved.
//

import UIKit
import Firebase

class Device2ViewController: UIViewController {
    
    @IBOutlet weak var btnswitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

      // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickSwitch(_ sender: UISwitch) {
        
        let ref = FIRDatabase.database().reference()
        //ref = ref.child("ONOFF2")
        
        if sender.isOn {
            
            let ON = ["ONOFF2": "ON2"]
            
            ref.updateChildValues(ON)
            
            
        }
            
        else {
            
            let OFF = ["ONOFF2": "OFF2"]
            
            ref.updateChildValues(OFF)
            
            
        }

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
