//
//  Authentication.swift
//  Bookz CoreData
//
//  Created by Vishwa  R on 29/01/22.
//

import CoreData
import UIKit

struct Authentication {
    
    private(set) var users = [UserEntity]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
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
    
    func performSignUp(for user : User) -> Bool {
        let userEntity = UserEntity(context: context)
        userEntity.email = user.email
        userEntity.name = user.name!
        userEntity.phone = user.phone!
        userEntity.password = user.password
        userEntity.isOwner = user.isOwner
        if saveData() {
            return true
        } else {
            return false
        }
    }
    
    func saveData() -> Bool {
        do {
            try context.save()
            return true
        }
        catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    func performLogin(for user : User) -> Bool {
        do {
            let request = UserEntity.fetchRequest()
            request.predicate = NSPredicate(format: "email == %@", user.email)
            let userInCoreData = try context.fetch(request)
            if userInCoreData.isEmpty {
                print("User Doesn't Exists.")
                return false
            } else if userInCoreData[0] == user {
                return true
            }
        } catch {
            print(error.localizedDescription)
        }
        print("Invaild Email or Password.")
        return false
    }
    
}

extension Authentication {
    func checkAccountExists(of user : User) -> Bool {
        return users.contains { data in
            data.email == user.email
        }
    }
    func checkUserOrOwner(for details : User) -> Bool {
        do {
            let request = UserEntity.fetchRequest()
            request.predicate = NSPredicate(format: "email == %@", details.email)
            let userInCoreData = try context.fetch(request)
            if userInCoreData[0].isOwner {
                return true
            }
        } catch {
            print(error.localizedDescription)
        }
        return false
    }
}

extension Authentication.User : Equatable {
    static func == (lhs : UserEntity, rhs : Authentication.User) -> Bool {
        if lhs.email! == rhs.email {
            return lhs.password! == rhs.password
        }
        return false
    }
}
