//
//  SecondViewController.swift
//  To Do List
//
//  Created by Matthew Jenks on 9/23/14.
//  Copyright (c) 2014 FiveWest. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    
        
    
    
    
    
    @IBOutlet weak var toDoItem: UITextField!
    
    
    @IBAction func addItem(sender: AnyObject)
    {
        toDoItems.append(toDoItem.text)
        
        let fixedtoDoItems = toDoItems
        
        NSUserDefaults.standardUserDefaults().setObject(fixedtoDoItems, forKey: "toDoItems")
        NSUserDefaults.standardUserDefaults().synchronize()
        

        
        
        self.view.endEditing(true)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

}

