//
//  DeviceViewController.swift
//  
//
//  Created by Thitiwat on 3/27/2560 BE.
//
//

import UIKit

class DeviceViewController: UIViewController {
    
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        btnMenu.target = revealViewController()
        btnMenu.action = #selector(SWRevealViewController.revealToggle(_:))
        //self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func device1(_ sender: Any) {
        
        
        let mainStory: UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
        let desController = mainStory.instantiateViewController(withIdentifier: "ControlViewController") as! ControlViewController
        self.addChildViewController(desController)
        desController.view.frame = self.view.frame
        self.view.addSubview(desController.view)
        desController.didMove(toParentViewController: self)
        

        
    }
    
    @IBAction func device2(_ sender: Any) {
        
        
        
        let mainStory: UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
        let desController = mainStory.instantiateViewController(withIdentifier: "Device2ViewController") as! Device2ViewController
        
        self.addChildViewController(desController)
        desController.view.frame = self.view.frame
        self.view.addSubview(desController.view)
        desController.didMove(toParentViewController: self)
        

        
        
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
