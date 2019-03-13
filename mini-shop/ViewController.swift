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
    //convenient variables
    var totalPrice: Double = 0.0
    var candy: Candy?
    //Data for table and candys
    let data: [Candy] = [   Candy(name: "Cocolate",price: 21.2),
                            Candy(name: "Paleta", price: 10.0)]
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
        self.totalLabel.text = "\(totalPrice)$"
    }
    
    func setupTableView(){
        self.tableView.backgroundColor = .clear
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func refreshPriceLabel(){
        self.totalLabel.text = "\(totalPrice)$"
    }
    
    //MARK: Table view protocols
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let candyCell = tableView.dequeueReusableCell(withIdentifier: "candyCell", for: indexPath)
        candyCell.textLabel?.text = data[indexPath.row].name
        candyCell.backgroundColor = .clear
        candyCell.layer.cornerRadius = 10
        return candyCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        candy = data[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    //MARK: pass information
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCandyDetail"{
            guard let nextView = segue.destination as? CandyDetailViewController else { return }
            nextView.delegate = self
            guard let insCandy = candy else{ return }
            nextView.selectedCandy = insCandy
        }
    }
    //MARK: delegate protocols candy view
    func theItemAddedToCar() {
        totalPrice += 1
    }
}

