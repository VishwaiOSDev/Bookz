//
//  DetailViewController.swift
//  Bookz CoreData
//
//  Created by Vishwa  R on 01/02/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var hotelDescriptionLabel: UILabel!
    @IBOutlet weak var hotelPriceLabel: UILabel!
    var hotelTitle : String = ""
    var hotelDescription : String = ""
    var price : String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
        title = hotelTitle
        DispatchQueue.main.async {
            self.hotelDescriptionLabel.text = self.hotelDescription
            self.hotelPriceLabel.text = "₹\(self.price)"
        }
    }
    
    @IBAction func bookNowPressed(_ sender: UIButton) {
    }

}
