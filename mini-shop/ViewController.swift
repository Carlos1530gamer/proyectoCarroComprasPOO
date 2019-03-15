//
//  ViewController.swift
//  mini-shop
//
//  Created by Carlos Daniel Hernandez Chauteco on 3/12/19.
//  Copyright © 2019 equipo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CandyDetailViewControllerDelegate{
    
    //MARK: Variables
    var totalProducts = [Candy]()
    //convenient variables
    var totalPrice: Double = 0.0
    //Data for table and candys
    let data: [Candy] = [   Candy(name: "Chocolate",price: 21.2, detail: "Dulce de cacao a base de leche"),
                            Candy(name: "Paleta", price: 10.0, detail: "Caramelo de diferentes sabores queasfasfasfasfasfsafasfasfasfasfasfasfsa comen mucho los niños")]
    //MARK: Oulets
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupUI()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refreshPriceLabel()
    }
    
    //MARK: setup funtions
    func setupUI(){
        //edit the backround
        //self.view.backgroundColor = UIColor.backgroundColor()
        //navigation
        self.navigationItem.title = "Dulces principales"
        //label
        refreshPriceLabel()
    }
    
    func setupTableView(){
        self.tableView.backgroundColor = .clear
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func getTotalPrice(_ array:[Candy]) -> Double{
        var returnValue:Double = 0
        for element in array{
            returnValue += element.price
        }
        
        return returnValue
    }
    
    func refreshPriceLabel(){
        totalLabel.text = "\(getTotalPrice(totalProducts).truncate(places: 2))"
    }
    //MARK: Table view protocols
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let candyCell = tableView.dequeueReusableCell(withIdentifier: "candyCell", for: indexPath)
        candyCell.textLabel?.text = data[indexPath.row].name
        candyCell.detailTextLabel?.text = "\(data[indexPath.row].price)" + "$"
        candyCell.imageView?.image = UIImage(named: data[indexPath.row].name)
        candyCell.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        candyCell.detailTextLabel?.backgroundColor = .clear
        candyCell.textLabel?.backgroundColor = .clear
        candyCell.layer.cornerRadius = 10
        return candyCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //MARK: pass information
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCandyDetail"{
            guard let nextView = segue.destination as? CandyDetailViewController else { return }
            nextView.delegate = self
            guard let selectRow = tableView.indexPathForSelectedRow?.row else { return }
            nextView.selectedCandy = data[selectRow]
        }
    }
    //MARK: delegate protocols candy view
    func theItemAddedToCar(_ candy: [Candy]) {
        for element in candy{
            totalProducts.append(element)
        }
    }
}

