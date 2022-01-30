//
//  Authentication.swift
//  Bookz CoreData
//
//  Created by Vishwa  R on 29/01/22.
//

import Foundation

struct Authentication {
    
    @CodableUserDefaults private(set) var users : [User]
    
    struct User : Codable {
        var name : String?
        var phone : String?
        var email : String
        var password : String
        var isOwner : Bool
        
        init(name : String? = nil, phone : String? = nil, email : String, password : String, isOwner : Bool = false) {
            self.name = name
            self.phone = phone
            self.email = email
            self.password = password
            self.isOwner = isOwner
        }
        
    }
    
    mutating func performSignUp(for user : User) -> Bool {
        let accountExists = checkAccountExists(of: user)
        if accountExists {
            print("\(user.email) is already exists")
            return false
        }
        users.append(user)
        Storage.saveDataInUserDefaults(data: user.email, forKey: "email")
        return true
    }
    
    func performLogin(for details : User) -> Bool {
        for user in users {
            if user == details {
                return true
            }
        }
        print("Invaild email or password.")
        return false
    }
    
    func getAllUser() {
        print(users)
    }
    
}

extension Authentication {
    func checkAccountExists(of user : User) -> Bool {
        return users.contains { data in
            data.email == user.email
        }
    }
    func checkUserOrOwner(for details : User) -> Bool {
        users.contains { data in
            if data.email == details.email {
                return data.isOwner
            }
            return false
        }
    }
}

extension Authentication.User : Equatable {
    static func == (lhs : Authentication.User, rhs : Authentication.User) -> Bool {
        if lhs.email == rhs.email {
            return lhs.password == rhs.password
        }
        return false
    }
}
