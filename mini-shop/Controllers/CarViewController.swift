//
//  CarViewController.swift
//  mini-shop
//
//  Created by Carlos Daniel Hernandez Chauteco on 3/15/19.
//  Copyright © 2019 equipo. All rights reserved.
//

import UIKit

protocol CarViewControllerDelegate: class {
    func passBuyCar()
}

class CarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var listProducts: [Candy]?
    
    //create delegate
    weak var delegate: CarViewControllerDelegate?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI(){
        tableView.backgroundColor = .clear
        
        navigationItem.title = "Carrito de compras"
    }
    
    //MARK: protocols for table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let list = listProducts else { return 0 }
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let list = listProducts else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row].name
        cell.imageView?.image = UIImage(named: list[indexPath.row].name)
        cell.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

}
