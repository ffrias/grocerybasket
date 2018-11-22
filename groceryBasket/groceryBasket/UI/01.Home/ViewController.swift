//
//  ViewController.swift
//  groceryBasket
//
//  Created by Federico Frias on 22/11/2018.
//  Copyright © 2018 ffrias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.refreshUI), name: NSNotification.Name(rawValue: DataLoader.getDataFromJsonFileNotification), object: nil)
        DataLoader.sharedInstance.loadFile()
    }
    
    @objc func refreshUI(){
        print("Json data loaded from file. Notification called.")
        tableView.reloadData()
    }
}

//MARK: Table View delegate & datasource extensions

extension ViewController:UITableViewDelegate{
}

extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataLoader.sharedInstance.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as! ProductTableViewCell
        let product = DataLoader.sharedInstance.products[indexPath.row]
       
        cell.loadData(product: product)
        
        return cell
    }
}

