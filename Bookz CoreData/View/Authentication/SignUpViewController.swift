//
//  SignUpViewController.swift
//  Bookz CoreData
//
//  Created by Vishwa  R on 29/01/22.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var ownerSwitch: UISwitch!
    
    private var viewModel = AuthenticationViewModel()
    
    override func viewDidLoad() {
        viewModel.delegate = self
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        guard let email = emailTextField.text,
              let name = nameTextField.text,
              let phone = phoneTextField.text,
              let password = passwordTextField.text else { return }
        let user = Authentication.User(name: name, phone: phone, email: email, password: password, isOwner: ownerSwitch.isOn)
        viewModel.doSignUp(with: user)
    }
    
}

extension SignUpViewController : AuthenticationDelegate {
    func updateView() {
        if viewModel.isLoggedIn && viewModel.isOwner {
            guard let ownerTabBarController = storyboard?.instantiateViewController(withIdentifier: "OwnerTabBarController") else { return }
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(ownerTabBarController)
        } else if viewModel.isLoggedIn {
            guard let customerTabBarController = storyboard?.instantiateViewController(withIdentifier: "CustomerTabBar") else { return }
            (UIApplication.shared.connectedScenes.first?.delegate as?  SceneDelegate)?.changeRootViewController(customerTabBarController)
        }
    }
}
