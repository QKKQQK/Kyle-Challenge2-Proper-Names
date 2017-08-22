//
//  SetRowNumberTableViewController.swift
//  SecondTableView
//
//  Created by Qiankang Zhou on 8/1/17.
//  Copyright © 2017 Qiankang Zhou. All rights reserved.
//

import UIKit

class AddNewNameTableViewController: UITableViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    
    var names: Names?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        if textField.text != "" {
            if let name = textField.text {
                names?.names.append(name)
                names?.names.sort()
            }
            self.navigationController?.popViewController(animated: true)
        }
    }

}
