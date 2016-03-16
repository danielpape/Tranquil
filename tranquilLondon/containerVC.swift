//
//  containerVC.swift
//  tranquilLondon
//
//  Created by Daniel Pape on 15/03/2016.
//  Copyright © 2016 Daniel Pape. All rights reserved.
//

import UIKit

class containerVC: UIViewController {

    @IBOutlet weak var toolbar: UIToolbar!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.hidden = true
//        toolbar.barTintColor = UIColor(red: 27/255, green: 27/255, blue: 27/255, alpha: 1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapMapButton(sender: AnyObject) {
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func tapListButton(sender: AnyObject) {
        self.tabBarController?.selectedIndex = 1
    }
}
