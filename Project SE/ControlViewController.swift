//
//  ControlViewController.swift
//  Project SE
//
//  Created by thitiwat on 21/3/60.
//  Copyright © พ.ศ. 2560 thitiwat. All rights reserved.
//

import UIKit
import Firebase

class ControlViewController: UIViewController {

    @IBOutlet weak var unitTxT: UITextField!
    @IBOutlet weak var btnSwitch: UISwitch!
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    @IBOutlet weak var wattTxT: UITextField!
    @IBOutlet weak var currentTXT: UITextField!
    
    @IBOutlet weak var on: UILabel!
    @IBOutlet weak var current: UILabel!

    @IBOutlet weak var Unit: UILabel!
    @IBOutlet weak var watt: UILabel!
    @IBOutlet weak var Off: UILabel!
    
    var ref = FIRDatabase.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeRadius()

        // Do any additional setup after loading the view.
        ref = ref.child("Data1").child("-KeluGw-UrU7447TnKxJ")
        
        
        ref.observe(.value, with: { snapshot in
            
            //if !snapshot.exists() { return }
            
            let unit = snapshot.childSnapshot(forPath: "unit").value as! Float
            let current = snapshot.childSnapshot(forPath: "current").value as! Float
            let watt = snapshot.childSnapshot(forPath: "watt").value as! Float
            
            print(snapshot)
            
            let unitString = "\(unit)"
            let currentString = "\(current)"
            let wattString = "\(watt)"
            
            print("2:\(unitString)")
            
            self.unitTxT.text = unitString 
            self.currentTXT.text = currentString
            self.wattTxT.text = wattString
    
            

        })
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickSwitch(_ sender: UISwitch) {
        
        let ref = FIRDatabase.database().reference()
        //ref = ref.child("ONOFF1")
        
        if sender.isOn {
            
            let ON = ["ONOFF1": "ON1"]
            
            ref.updateChildValues(ON)
            
            
        }
        
        else {
            
            let OFF = ["ONOFF1": "OFF1"]
            
            ref.updateChildValues(OFF)
            
            
        }
    }
    
    @IBAction func back(_ sender: Any) {
        
        let revealViewController:SWRevealViewController = self.revealViewController()
        
        let mainStory: UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
        let desController = mainStory.instantiateViewController(withIdentifier: "DeviceViewController") as! DeviceViewController
        let newFrontViewController = UINavigationController.init(rootViewController:desController)
        
        revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        
        self.dismiss(animated: true, completion: nil)
    }
    func makeRadius() {
        
        on.layer.masksToBounds = true
        Off.layer.masksToBounds = true
        Unit.layer.masksToBounds = true
        current.layer.masksToBounds = true
        watt.layer.masksToBounds = true
        
        on.layer.cornerRadius = 6
        Off.layer.cornerRadius = 6
        Unit.layer.cornerRadius = 6
        current.layer.cornerRadius = 6
        watt.layer.cornerRadius = 6
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
