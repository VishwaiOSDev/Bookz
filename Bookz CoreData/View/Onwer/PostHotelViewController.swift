//
//  PostHotelViewController.swift
//  Bookz CoreData
//
//  Created by Vishwa  R on 30/01/22.
//

import UIKit

class PostHotelViewController: UIViewController {
    
    private var viewModel = AuthenticationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        viewModel.performLogout()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginNavController = storyboard.instantiateViewController(withIdentifier: "LoginNavigationController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavController)
    }
    
    @IBAction func postButtonPressed(_ sender: UIButton) {
    }
    
}
