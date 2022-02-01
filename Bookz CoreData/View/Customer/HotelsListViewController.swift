//
//  HotelsListViewController.swift
//  Bookz CoreData
//
//  Created by Vishwa  R on 29/01/22.
//

import UIKit

class HotelsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var viewModel = CustomerViewModel()
    private var hotelsList : [HotelEntity] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchHotelsFromDatabase()
    }
    
    override func viewDidLoad() {
        title = "Hotels"
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.delegate = self
        let nib =  UINib(nibName: "HotelListCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "HotelListCell")
    }
    
}

extension HotelsListViewController : CustomerViewModelDelegate {
    func didFetchedDetails(_ hotels: [HotelEntity]) {
        hotelsList = hotels
    }
}

extension HotelsListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "hotelListToDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsViewController = segue.destination as! DetailViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            detailsViewController.hotelTitle = hotelsList[indexPath.row].hotelName!
            detailsViewController.price = hotelsList[indexPath.row].hotelPrice!
            detailsViewController.hotelDescription = hotelsList[indexPath.row].hotelDescription!
        }
    }
    
}

extension HotelsListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotelsList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HotelListCell", for: indexPath) as! HotelListCell
        cell.hotelTitle.text = hotelsList[indexPath.row].hotelName
        cell.hotelDescription.text = hotelsList[indexPath.row].hotelDescription
        return cell
    }
}
