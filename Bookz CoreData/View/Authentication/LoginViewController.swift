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
    }
    
}

