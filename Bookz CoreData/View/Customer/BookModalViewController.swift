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
    private var bookingViewModel = BookingViewModel()
    var hotelDetails : HotelEntity? = HotelEntity()
    var calucatedPrice : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        priceLabel.text = "₹\((self.hotelDetails?.hotelPrice)!)"
        checkInDatePicker.minimumDate = Date()
    }
    
    @IBAction func checkInChanged(_ sender: UIDatePicker) {
        checkOutDatePicker.minimumDate = checkInDatePicker.date
    }
    
    @IBAction func checkOutChanged(_ sender: UIDatePicker) {
        calucatedPrice = viewModel.calucatePrice(fromDate: checkInDatePicker.date, toDate: checkOutDatePicker.date, price: (self.hotelDetails?.hotelPrice)!)
        DispatchQueue.main.async {
            self.priceLabel.text = "₹\(self.calucatedPrice)"
        }
    }
    
    @IBAction func bookButtonPressed(_ sender: UIButton) {
        guard let hotel = hotelDetails else { return }
        bookingViewModel.bookHotel(fromDate: checkInDatePicker.date, toDate: checkOutDatePicker.date, totalCost: calucatedPrice, in: hotel)
    }
    
}
