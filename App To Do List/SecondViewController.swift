//
//  SecondViewController.swift
//  App To Do List
//
//  Created by Rambo on 9/17/16.
//  Copyright © 2016 Rambo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var textFieldInput: UITextField!
    
    @IBAction func addItem(_ sender: AnyObject) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        var itemsArray: [String]
        
        if let tempItems = itemsObject as? [String]{
            
            itemsArray = tempItems
            
            itemsArray.append(textFieldInput.text!)
            
        }else{
            
            itemsArray = [textFieldInput.text!]
        }
        
        UserDefaults.standard.set(itemsArray, forKey: "items")
        
        textFieldInput.text = ""
  
        
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}

