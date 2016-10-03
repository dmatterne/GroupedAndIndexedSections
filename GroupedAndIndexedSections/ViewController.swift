//
//  ViewController.swift
//  GroupedAndIndexedSections
//
//  Created by Stannis Baratheon on 03/10/16.
//  Copyright © 2016 Training. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var names: NSDictionary!
    var keys: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path: URL? = Bundle.main.url(forResource: "sortedNames", withExtension: "plist")
        
        names = NSDictionary(contentsOf: path!)
        
        let myArray: [String] = names.allKeys as! [String]
        
        keys = myArray.sorted {           $0 < $1        }
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let key = keys[section] as String
        let nameSection = names[key] as! [String]
        
        return nameSection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        let row = indexPath.row
        let key = keys[section] as String
        
        let nameSection = names [key] as! [String]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionsTableIdentifier", for: indexPath)
        
        cell.textLabel?.text = nameSection[row]
        
        return cell
        
        
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let key = keys[section] as String
        return key
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return keys
    }
    
    
}

