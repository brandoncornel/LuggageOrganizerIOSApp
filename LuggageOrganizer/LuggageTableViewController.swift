//
//  LuggageTableViewController.swift
//  LuggageOrganizer
//
//  Created by Brandon Cornel on 9/25/17.
//  Copyright © 2017 Brandon Cornel. All rights reserved.
//

import UIKit

class LuggageTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var luggages = [Luggage]()
    
    //MARK: Properties
    
    private func loadSampleLuggage(){
        let photo1 = UIImage(named: "meal1")
        let photo2 = UIImage(named: "meal2")
        let photo3 = UIImage(named: "meal3")
        
        guard let luggage1 = Luggage(name: "Red Samsonite", photo: photo1, description: "ITS REDDDDD")else{
            fatalError("Unable to instantiate luggage1")
        }
        guard let luggage2 = Luggage(name: "Yellow Samsonite", photo: photo2, description: "ITS YELLOWWWW")else{
            fatalError("Unable to instantiate luggage2")
        }
        guard let luggage3 = Luggage(name: "Blue Samsonite", photo: photo1, description: "ITS BLUEEEE")else{
            fatalError("Unable to instantiate luggage3")
        }
        
        luggages+=[luggage1,luggage2,luggage3]

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleLuggage()
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

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return luggages.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "LuggageTableViewCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? LuggageTableViewCell  else {
            fatalError("The dequeued cell is not an instance of LuggageTableViewCell.")
        }
        
        let luggage = luggages[indexPath.row]
        cell.luggageNameLabel.text = luggage.name
        cell.luggagePhotoImageView.image = luggage.photo
        cell.luggageDescriptionTextView.text = luggage.description
        // Configure the cell...

        return cell
    }
    
    //MARK: Actions
    @IBAction func unwindToLuggageList(sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as? LuggageViewController, let luggage = sourceViewController.luggage {
            let newIndexPath = IndexPath(row: luggages.count, section : 0)
            luggages.append(luggage)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
