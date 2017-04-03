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
    
    @IBOutlet weak var on: UILabel!
    @IBOutlet weak var btnswitch: UISwitch!
    @IBOutlet weak var off: UILabel!
    @IBOutlet weak var unit: UILabel!
    @IBOutlet weak var watt: UILabel!
    @IBOutlet weak var current: UILabel!
    
    @IBOutlet weak var unitText: UITextField!
    @IBOutlet weak var wattText: UITextField!
    @IBOutlet weak var currentText: UITextField!
    
    var ref = FIRDatabase.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showAnimate()
        
        
        makeRadius()

      // Do any additional setup after loading the view.
        
        ref = ref.child("Data1").child("-KeluGw-UrU7447TnKxJ")
        
        
        ref.observe(.value, with: { snapshot in
//
//            //if !snapshot.exists() { return }
//            
            let unit = snapshot.childSnapshot(forPath: "unit").value as! Float
            let current = snapshot.childSnapshot(forPath: "current").value as! Float
            let watt = snapshot.childSnapshot(forPath: "watt").value as! Float
            
            print(snapshot)
            
            let unitString = "\(unit)"
            let currentString = "\(current)"
            let wattString = "\(watt)"
            
            print("2:\(unitString)")
            
            self.unitText.text = unitString
            self.currentText.text = currentString
            self.wattText.text = wattString
            
            
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickSwitch(_ sender: UISwitch) {
        
        let ref = FIRDatabase.database().reference()
        //ref = ref.child("ONOFF2")
        
        if sender.isOn {
            
            let ON = ["ONOFF1": "ON1"]
            
            ref.updateChildValues(ON)
            
            
        }
            
        else {
            
            let OFF = ["ONOFF1": "OFF2"]
            
            ref.updateChildValues(OFF)
            
            
        }

    }

    @IBAction func back(_ sender: Any) {
        self.removeAnimate()
    }
    
    
    func makeRadius() {
        
        on.layer.masksToBounds = true
        off.layer.masksToBounds = true
        unit.layer.masksToBounds = true
        current.layer.masksToBounds = true
        watt.layer.masksToBounds = true
        
        on.layer.cornerRadius = 6
        off.layer.cornerRadius = 6
        unit.layer.cornerRadius = 6
        current.layer.cornerRadius = 6
        watt.layer.cornerRadius = 6
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
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
