//
//  BookModalViewController.swift
//  Bookz CoreData
//
//  Created by Vishwa  R on 01/02/22.
//

import UIKit

class BookModalViewController: UIViewController {
    
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    @IBOutlet weak var priceLabel: UILabel!
    private var viewModel = CustomerViewModel()
    var hotelName = ""
    var hotelPrice = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        priceLabel.text = "₹\(hotelPrice)"
        checkInDatePicker.minimumDate = Date()
    }
    
    @IBAction func checkInChanged(_ sender: UIDatePicker) {
        checkOutDatePicker.minimumDate = checkInDatePicker.date
    }
    
    @IBAction func checkOutChanged(_ sender: UIDatePicker) {
        let calucatedPrice = viewModel.calucatePrice(fromDate: checkInDatePicker.date, toDate: checkOutDatePicker.date, price: hotelPrice)
        DispatchQueue.main.async {
            self.priceLabel.text = "₹\(calucatedPrice)"
        }
    }
    
}
