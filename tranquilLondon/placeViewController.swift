//
//  placeViewController.swift
//  tranquilLondon
//
//  Created by Daniel Pape on 07/03/2016.
//  Copyright © 2016 Daniel Pape. All rights reserved.
//

import UIKit

class placeViewController: UIViewController {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var tubeLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descTextView: UITextView!
    
    var placeName = String()
    var placeLocation = String()
    var placeTube = String()
    var placeDistance = Float()
    var placeCategory = String()
    var placeDesc = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = placeName
        locationLabel.text = placeLocation
        tubeLabel.text = placeTube
        categoryLabel.text = placeCategory
        descTextView.text = placeDesc

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
