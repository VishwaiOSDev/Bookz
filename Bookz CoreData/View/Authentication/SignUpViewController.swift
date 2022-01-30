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
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        let email = emailTextField.text!
        let name = nameTextField.text!
        let phone = phoneTextField.text!
        let password = passwordTextField.text!
        let user = Authentication.User(name: name, phone: phone, email: email, password: password, isOwner: ownerSwitch.isOn)
        viewModel.doSignUp(with: user)
    }
    
}
