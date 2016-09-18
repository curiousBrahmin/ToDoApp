//
//  FirstViewController.swift
//  App To Do List
//
//  Created by Rambo on 9/17/16.
//  Copyright © 2016 Rambo. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    
    var itemsArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
       
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        if let tempItems = itemsObject as? [String]{
            
            itemsArray = tempItems
        }
        
        table.reloadData()
        
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return itemsArray.count
    }
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
              cell.textLabel?.text = itemsArray[indexPath.row]
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if  editingStyle == UITableViewCellEditingStyle.delete{
            
            itemsArray.remove(at: indexPath.row)
            
            table.reloadData()
            
            UserDefaults.standard.set(itemsArray, forKey: "items")
            
        }
    }
    
    
}

