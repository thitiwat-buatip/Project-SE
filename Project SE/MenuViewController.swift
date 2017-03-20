//
//  MenuViewController.swift
//  Project SE
//
//  Created by thitiwat on 21/3/60.
//  Copyright © พ.ศ. 2560 thitiwat. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var menu = [String]()
    var menuIcon = [UIImage]()
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        menu = ["Home", "Overview", "Report", "Control"]
        menuIcon = [UIImage(named:"home")!,UIImage(named:"overview")!, UIImage(named:"report")!, UIImage(named:"control")!]
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuTableViewCell
        
        cell.menuIcon.image = menuIcon[indexPath.row]
        cell.menuLabel.text? = menu[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let revealViewController:SWRevealViewController = self.revealViewController()
        
        let cell:MenuTableViewCell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        
        if cell.menuLabel.text! == "Home"
        {
            let mainStory: UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
            let desController = mainStory.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            let newFrontViewController = UINavigationController.init(rootViewController:desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        
        if cell.menuLabel.text! == "Overview"
        {
            let mainStory: UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
            let desController = mainStory.instantiateViewController(withIdentifier: "OverviewViewController") as! OverviewViewController
            let newFrontViewController = UINavigationController.init(rootViewController:desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        
        if cell.menuLabel.text! == "Report"
        {
            let mainStory: UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
            let desController = mainStory.instantiateViewController(withIdentifier: "ReportViewController") as! ReportViewController
            let newFrontViewController = UINavigationController.init(rootViewController:desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
        }
        if cell.menuLabel.text! == "Control"
        {
            let mainStory: UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
            let desController = mainStory.instantiateViewController(withIdentifier: "ControlViewController") as! ControlViewController
            let newFrontViewController = UINavigationController.init(rootViewController:desController)
            
            revealViewController.pushFrontViewController(newFrontViewController, animated: true)
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
