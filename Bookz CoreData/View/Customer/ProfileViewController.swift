//
//  ProfileViewController.swift
//  Bookz CoreData
//
//  Created by Vishwa  R on 29/01/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var viewModel = AuthenticationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signOutPressed(_ sender: UIButton) {
        viewModel.performLogout()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginNavController = storyboard.instantiateViewController(withIdentifier: "LoginNavigationController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavController)
    }
}
