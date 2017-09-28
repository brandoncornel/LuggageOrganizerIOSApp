//
//  LuggageTableViewController.swift
//  LuggageOrganizer
//
//  Created by Brandon Cornel on 9/25/17.
//  Copyright © 2017 Brandon Cornel. All rights reserved.
//

import UIKit
import os.log

class LuggageTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var luggages = [Luggage]()
    
    //MARK: Properties
    
    
    private func saveLuggages(){
    let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(luggages, toFile: Luggage.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Luggages successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save luggages...", log: OSLog.default, type: .error)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        
        if let savedLuggages = loadLuagges(){
            luggages+=savedLuggages
        }
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
        cell.luggageDescriptionTextView.text = luggage.detailedDescription

        return cell
    }
    
    //MARK: Actions
    @IBAction func unwindToLuggageList(sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as? LuggageViewController, let luggage = sourceViewController.luggage {
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                luggages[selectedIndexPath.row] = luggage
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }else{
            let newIndexPath = IndexPath(row: luggages.count, section : 0)
            luggages.append(luggage)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            saveLuggages()

        }
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            luggages.remove(at: indexPath.row)
            saveLuggages()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        switch(segue.identifier ?? ""){
            case "AddLuggage":
                os_log("Adding a new luggage", log: OSLog.default, type: .default)
            case "LuggageShowDetail":
                guard let luggageDetailViewController = segue.destination as? LuggageViewController else{
                    fatalError("Unexpected destination: \(segue.destination)")
                }
            
                guard let selectedLuggageCell = sender as? LuggageTableViewCell else{
                    fatalError("Unexpected sender: \(sender)")
                }
                guard let indexPath = tableView.indexPath(for: selectedLuggageCell) else{
                    fatalError("The selected cell is not being displayed by the table")
                }
                let selectedLuggage = luggages[indexPath.row]
            luggageDetailViewController.luggage = selectedLuggage
                
        default:
            fatalError("Unexpected identification: /(segue.identifier)")
        }
    }
    
    private func loadLuagges() -> [Luggage]?{
return NSKeyedUnarchiver.unarchiveObject(withFile: Luggage.ArchiveURL.path) as? [Luggage]    }
 

}
