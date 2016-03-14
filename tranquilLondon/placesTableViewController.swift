//
//  placesTableViewController.swift
//  tranquilLondon
//
//  Created by Daniel Pape on 07/03/2016.
//  Copyright © 2016 Daniel Pape. All rights reserved.
//

import UIKit
import MapKit

//struct place {
//    var name:String
//    var lat:CLLocationDegrees
//    var long:CLLocationDegrees
//    var tube:String
//    var category:String
//    var desc:String
//    
//    func getDistancetoPlace() -> Float{
//        return 2.5
//    }
//}

class placesTableViewController: UITableViewController {
    
    let VC = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        VC.loadInitialData()
        
        tableView.estimatedRowHeight = 96
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return VC.places.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:placeTableViewCell = (tableView.dequeueReusableCellWithIdentifier("cell") as? placeTableViewCell)!
        
        cell.placeNameLabel.text = String(VC.places[indexPath.row].title!)
        cell.placeDistanceLabel.text = String(VC.places[indexPath.row].locationName)

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destinationVC = segue.destinationViewController as! placeViewController
        
//        destinationVC.placeName = String(VC.places[indexPath.row].title!)
//        destinationVC.placeCategory = String(VC.places[indexPath.row].)
//        destinationVC.placeDesc = cellPlaceStruct.desc
//        destinationVC.placeTube = String(VC.places[indexPath.row].tube)
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
