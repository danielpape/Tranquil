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
    var selectedRowTitle = String()
    var selectedRowImage = String()
    var selectedRowTube = String()
    var selectedRowLocation = String()
    var selectedRowDescription = String()
    var selectedRowCategory = String()
    
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
        cell.placeImage.image = UIImage(named: String(VC.places[indexPath.row].placeImage))
//        
//        selectedRowTitle = String(VC.places[indexPath.row].title!)
//        selectedRowLocation = String(VC.places[indexPath.row].locationName)
//        selectedRowImage = String(VC.places[indexPath.row].placeImage)
//        selectedRowTube = String(VC.places[indexPath.row].tubeName)
//        selectedRowDescription = String(VC.places[indexPath.row].placeDesc)
//        selectedRowCategory = String(VC.places[indexPath.row].placeCat)

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("pushPlaceView", sender: indexPath)
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

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
    // TODO: Fix segue to detail view
        
//        let destinationVC = segue.destinationViewController as! placeViewController
        let indexPath = sender?[1]
        
        print(indexPath)
//
//        destinationVC.placeName = String(VC.places[indexPath.row].title!)
//        destinationVC.placeCategory = selectedRowCategory
//        destinationVC.placeDesc = selectedRowDescription
//        destinationVC.placeTube = selectedRowTube
//        destinationVC.placeLocation = selectedRowLocation
//        destinationVC.placeImage = selectedRowImage
//
    }


}
