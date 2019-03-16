//
//  CandyDetailViewController.swift
//  mini-shop
//
//  Created by Carlos Daniel Hernandez Chauteco on 3/12/19.
//  Copyright © 2019 equipo. All rights reserved.
//

import UIKit

protocol CandyDetailViewControllerDelegate: class {
    func theItemAddedToCar(_ candy: [Candy])
}

class CandyDetailViewController: UIViewController {
    
    //MARK: oulets
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var stepperCounter: UIStepper!
    var selectedCandy: Candy?
    
    @IBOutlet weak var totalProducts: UILabel!
    @IBOutlet weak var candyImage: UIImageView!
    @IBOutlet weak var detailText: UITextView!
    //make a delegate for controller
    weak var delegate: CandyDetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        setupInfo()
    }
    
    func setupInfo(){
        guard let imageName = selectedCandy?.name else { return }
        candyImage.image = UIImage(named: imageName)
        detailText.isSelectable = false
        detailText.isScrollEnabled = false
        detailText.text = selectedCandy?.detail
    }
    
    func setupUI(){
        //edit the button
        buyButton.layer.cornerRadius = 10
        //label
        totalProducts.text = "1"
        
        detailText.backgroundColor = .clear
        
    }
    //MARK: Actions
    @IBAction func buyButtonHasPressed(_ sender: Any) {
        let range = Int(stepperCounter.value) - 1
        guard let passCandy = selectedCandy else { return }
        var candyDelegate = [Candy]()
        for _ in 0...range{
            candyDelegate.append(passCandy)
        }
        delegate?.theItemAddedToCar(candyDelegate)
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func sumCounter(_ sender: UIStepper) {
        let valueInt: Int = Int(stepperCounter.value)
        totalProducts.text = "\(valueInt)"
    }
    
}
