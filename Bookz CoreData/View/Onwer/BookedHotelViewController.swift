//
//  BookedHotelViewController.swift
//  Bookz CoreData
//
//  Created by Vishwa  R on 02/02/22.
//

import UIKit

class BookedHotelViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var viewModel = BookingViewModel()
    private var bookedList = [Booking.BookedData]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getBookedHotelDetails()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        viewModel.delegate = self
        let nib = UINib(nibName: "BookedCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "BookedCell")
    }
    
}

extension BookedHotelViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookedList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookedCell") as! BookedCell
        let fromDate = formatDate(date: bookedList[indexPath.row].fromDate)
        let toDate = formatDate(date: bookedList[indexPath.row].toDate)
        cell.customerNameLabel.text = bookedList[indexPath.row].customer
        cell.hotelNameLabel.text = bookedList[indexPath.row].hotelName
        cell.dates.text = "Dates: \(fromDate) to \(toDate)"
        cell.totalCostLabel.text = "₹\(bookedList[indexPath.row].totalCost)"
        return cell
    }
    func formatDate(date : Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd, MMM YYYY"
        return dateFormatter.string(from: date)
    }
}

extension BookedHotelViewController : BookingViewModelDelegate {
    func didFetchedBookedHotelDetails(_ hotelDetails: [Booking.BookedData]) {
        bookedList = hotelDetails
    }
}
