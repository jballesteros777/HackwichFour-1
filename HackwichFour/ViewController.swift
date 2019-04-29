//
//  ViewController.swift
//  HackwichFour
//
//  Created by Marion Ano on 2/28/19.
//  Copyright © 2019 Marion Ano. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//declare our array

    @IBOutlet var tableView: UITableView!
    
    var myRestaurants = ["Kapolei Kalapawai", "Coco Ichibanya", "Gyu-Kaku Japanese BBQ", "Ton Ton Ramen", "Ohana Ramen"]


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return myRestaurants.count
        //return 4

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Code Block
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")!
        let text = myRestaurants[indexPath.row]
        cell.textLabel?.text=text
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
    }

    var restaurantImageData = [String]()
    
    var restaurantDescriptionData = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        
        let path = Bundle.main.path(forResource: "Property List", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        
        restaurantImageData = dict!.object(forKey: "restaurantImages") as! [String]
        restaurantDescriptionData = dict!.object(forKey: "restaurantDescription") as! [String]
        
        self.navigationItem.title = "Restaurants"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue"
        {
            let s1 = segue.destination as! detailViewController
            let imageIndex = tableView.indexPathForSelectedRow?.row
            s1.imagePass = restaurantImageData[imageIndex!]
            
            let textIndex = tableView.indexPathForSelectedRow?.row
            s1.textPass = restaurantDescriptionData[textIndex!]
        }
        
        
        
    }


}

