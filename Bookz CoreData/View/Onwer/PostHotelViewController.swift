//
//  PostHotelViewController.swift
//  Bookz CoreData
//
//  Created by Vishwa  R on 30/01/22.
//

import UIKit

class PostHotelViewController: UIViewController {
    
    @IBOutlet weak var hotelNameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    private var viewModel = OwnerViewModel()
    private var authenticationViewModel = AuthenticationViewModel()
    
    override func viewDidLoad() {
        viewModel.delegate = self
    }
    
    @IBAction func postButtonPressed(_ sender: UIButton) {
        guard let hotelName = hotelNameTextField.text,
              let description = descriptionTextField.text,
              let price = priceTextField.text else { return }
        let hotel = Owner(hotelName: hotelName, description: description, price: price)
        viewModel.uploadHotel(data: hotel)
    }
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        authenticationViewModel.performLogout()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginNavController = storyboard.instantiateViewController(withIdentifier: "LoginNavigationController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavController)
    }
    
}

extension PostHotelViewController : HotelViewModelDelegate {
    func updateView() {
        DispatchQueue.main.async {
            self.hotelNameTextField.text = ""
            self.descriptionTextField.text = ""
            self.priceTextField.text = ""
        }
    }
    
    func failedToUpdate() {
        print("Show Alreat that it has failed to update in database.")
    }
}
