//
//  FirstViewController.swift
//  To Do List
//
//  Created by Matthew Jenks on 9/23/14.
//  Copyright (c) 2014 FiveWest. All rights reserved.
//

import UIKit

var toDoItems:[String] = []


class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tasksTable:UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoItems.count
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoItems[indexPath.row]
        
        return cell
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        if var storedtoDoItems : AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("toDoItems") {
            
            toDoItems = []
            
            for var i = 0; i < storedtoDoItems.count; ++i {
                
                toDoItems.append(storedtoDoItems[i] as NSString)
            }
            
        }
        
        tasksTable.reloadData()
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            
            toDoItems.removeAtIndex(indexPath.row)
            
            let fixedtoDoItems = toDoItems
            NSUserDefaults.standardUserDefaults().setObject(fixedtoDoItems, forKey: "toDoItems")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            tasksTable.reloadData()
        }
    }



}

