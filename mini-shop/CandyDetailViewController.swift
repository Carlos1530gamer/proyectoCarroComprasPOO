//
//  CandyDetailViewController.swift
//  mini-shop
//
//  Created by Carlos Daniel Hernandez Chauteco on 3/12/19.
//  Copyright © 2019 equipo. All rights reserved.
//

import UIKit

protocol CandyDetailViewControllerDelegate: class {
    func theItemAddedToCar()
}

class CandyDetailViewController: UIViewController {
    
    //MARK: oulets
    @IBOutlet weak var buyButton: UIButton!
    var selectedCandy: Candy?
    
    //make a delegate for controller
    weak var delegate: CandyDetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI(){
        //edit the button
        buyButton.layer.cornerRadius = 10
    }
    //MARK: Actions
    @IBAction func buyButtonHasPressed(_ sender: Any) {
        self.delegate?.theItemAddedToCar()
    }
    
}
