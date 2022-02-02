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
    var hotelDetails : HotelEntity? = HotelEntity()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = hotelDetails?.hotelName!
        DispatchQueue.main.async {
            self.hotelDescriptionLabel.text = self.hotelDetails?.hotelDescription!
            self.hotelPriceLabel.text = "₹\((self.hotelDetails?.hotelPrice)!)"
        }
    }
    
    @IBAction func bookNowPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showBookModal", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let bookModelViewController = segue.destination as! BookModalViewController
        bookModelViewController.hotelDetails = hotelDetails
    }
    
}
