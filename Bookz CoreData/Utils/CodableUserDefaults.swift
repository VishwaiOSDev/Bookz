//
//  CodableUserDefaults.swift
//  Bookz CoreData
//
//  Created by Vishwa  R on 29/01/22.
//

import Foundation

@propertyWrapper
struct CodableUserDefaults {
    
    private var users : [Authentication.User] = [Authentication.User]()
    
    var wrappedValue : [Authentication.User] {
        get {
            return users
        }
        set {
            if let user = newValue.last {
                findIndexAndUpdate(for : user)
                encodeToUserDefaults()
            }
        }
    }
    
    init() {
        if let usersDetails = decodeFromUserDefaults() {
            users = usersDetails
        } else {
            users = []
        }
    }
    
}

//MARK: - Codable Function
extension CodableUserDefaults {
    
    mutating func findIndexAndUpdate(for user : Authentication.User) {
        if let index = users.firstIndex(where : { $0.email == user.email }) {
            users[index] = user
        } else {
            users.append(user)
        }
    }
    
    func encodeToUserDefaults() {
        var data : Data?
        let encoder = JSONEncoder()
        do {
            data = try encoder.encode(users)
        }
        catch {
            print(error.localizedDescription)
        }
        UserDefaults.standard.set(data, forKey: "users")
    }
    
    func decodeFromUserDefaults() -> [Authentication.User]? {
        let decoder = JSONDecoder()
        do {
            if let storedData = UserDefaults.standard.data(forKey: "users") {
                let safeData = try decoder.decode([Authentication.User].self, from: storedData)
                return safeData
            }
        }
        catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
}
