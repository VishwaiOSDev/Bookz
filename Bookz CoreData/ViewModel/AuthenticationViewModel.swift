//
//  AuthenticationViewModel.swift
//  Bookz CoreData
//
//  Created by Vishwa  R on 29/01/22.
//

import Foundation

final class AuthenticationViewModel {
    
    private var model = Authentication()
    
    func doSignUp(with details : Authentication.User) {
        let isSignedUp = model.performSignUp(for: details)
        let userStatus = model.checkUserOrOwner(for: details)
        Storage.saveDataInUserDefaults(data: userStatus, forKey: "owner")
        Storage.saveDataInUserDefaults(data: isSignedUp, forKey: "isLoggedIn")
    }
    
    func doLogin(with details : Authentication.User) {
        let isLoggedIn = model.performLogin(for: details)
        let userStatus = model.checkUserOrOwner(for: details)
        Storage.saveDataInUserDefaults(data: userStatus, forKey: "owner")
        Storage.saveDataInUserDefaults(data: isLoggedIn, forKey: "isLoggedIn")
        model.getAllUser()
    }
    
    func performLogout() {
        Storage.saveDataInUserDefaults(data: false, forKey: "isLoggedIn")
        Storage.saveDataInUserDefaults(data: false, forKey: "owner")
    }
    
}

