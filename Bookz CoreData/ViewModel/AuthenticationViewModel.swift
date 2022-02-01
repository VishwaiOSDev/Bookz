//
//  AuthenticationViewModel.swift
//  Bookz CoreData
//
//  Created by Vishwa  R on 29/01/22.
//

import Foundation

protocol AuthenticationDelegate {
    func updateView()
}

final class AuthenticationViewModel {
    
    private var model = Authentication()
    var delegate : AuthenticationDelegate?
    
    var isLoggedIn : Bool {
        didSet {
            Storage.saveDataInUserDefaults(data: isLoggedIn, forKey: "isLoggedIn")
        }
    }
    var isOwner : Bool {
        didSet {
            Storage.saveDataInUserDefaults(data: isOwner, forKey: "owner")
        }
    }
    
    init() {
        isLoggedIn = false
        isOwner = false
    }
    
    func doSignUp(with details : Authentication.User) {
        self.isLoggedIn = model.performSignUp(for: details)
        self.isOwner = model.checkUserOrOwner(for: details)
        Storage.saveDataInUserDefaults(data: details.email, forKey: "email")
        delegate?.updateView()
    }
    
    func doLogin(with details : Authentication.User) {
        self.isLoggedIn = model.performLogin(for: details)
        if isLoggedIn {
            self.isOwner = model.checkUserOrOwner(for: details)
            Storage.saveDataInUserDefaults(data: details.email, forKey: "email")
            delegate?.updateView()
        }
    }
    
    func performLogout() {
        Storage.saveDataInUserDefaults(data: false, forKey: "isLoggedIn")
        Storage.saveDataInUserDefaults(data: false, forKey: "owner")
    }
    
}

