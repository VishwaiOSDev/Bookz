//
//  ProfileViewController.swift
//  Bookz CoreData
//
//  Created by Vishwa  R on 29/01/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    private var viewModel = AuthenticationViewModel()
    private var customerViewModel = CustomerViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customerViewModel.getDetailsOfUser()
    }
    
    override func viewDidLoad() {
        customerViewModel.customerDelegate = self
    }
    
    @IBAction func signOutPressed(_ sender: UIButton) {
        viewModel.performLogout()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginNavController = storyboard.instantiateViewController(withIdentifier: "LoginNavigationController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavController)
    }
}

extension ProfileViewController : CustomerDetailsDelegate {
    func didFetchedUserDetails(_ user: UserEntity) {
        DispatchQueue.main.async {
            self.nameLabel.text = user.name
            self.emailLabel.text = user.email
            self.phoneLabel.text = user.phone
        }
    }
}
