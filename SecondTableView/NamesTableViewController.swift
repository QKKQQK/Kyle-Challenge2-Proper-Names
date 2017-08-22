//
//  NamesTableTableViewController.swift
//  SecondTableView
//
//  Created by Qiankang Zhou on 8/1/17.
//  Copyright © 2017 Qiankang Zhou. All rights reserved.
//

import UIKit

class NamesTableViewController: UITableViewController, UISearchBarDelegate {
    
    var names :Names?
    var searchResult : [String] = []
    
    @IBOutlet weak var search: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        search.placeholder = "Enter Name"
        search.delegate = self
        search.text = ""
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        updateResult()
        self.tableView.reloadData()
    }
    
    func updateResult() {
        if search.text != "" {
            searchResult = (names?.names.filter({
                $0.range(of: search.text!, options: .caseInsensitive) != nil
            }))!
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if search.text != "" {
            return searchResult.count
        }
        return names?.names.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
        
        if search.text != "" {
            cell.textLabel?.text = searchResult[indexPath.row]
        } else {
            cell.textLabel?.text = names?.names[indexPath.row]
        }
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateResult()
        self.tableView.reloadData()
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showName" {
            let controller = segue.destination as! NameViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                controller.name = names?.names[indexPath.row]
            }
        } else if segue.identifier == "showAddName" {
            let controller = segue.destination as! AddNewNameTableViewController
            controller.names = self.names
        }
    }
}
