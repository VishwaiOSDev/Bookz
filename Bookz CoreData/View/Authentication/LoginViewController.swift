//
//  ViewController.swift
//  Bookz CoreData
//
//  Created by Vishwa  R on 28/01/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var viewModel = AuthenticationViewModel()
    
    @IBAction func loginPressed(_ sender: UIButton) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        let user = Authentication.User(email : email, password: password)
        viewModel.doLogin(with: user)
        if viewModel.isLoggedIn && viewModel.isOwner {
            guard let ownerTabBarController = storyboard?.instantiateViewController(withIdentifier: "OwnerTabBarController") else { return }
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(ownerTabBarController)
        } else if viewModel.isLoggedIn {
            guard let customerTabBarController = storyboard?.instantiateViewController(withIdentifier: "CustomerTabBar") else { return }
            (UIApplication.shared.connectedScenes.first?.delegate as?  SceneDelegate)?.changeRootViewController(customerTabBarController)
        }
    }
}

