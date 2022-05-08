//
//  Customer.swift
//  Bookz CoreData
//
//  Created by Vishwa  R on 01/02/22.
//

import UIKit
import CoreData

struct Customer {
    
    private(set) var hotels : [HotelEntity] = []
    private var users = [UserEntity]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    init() {
        getListHotels()
    }
    
    mutating func getListHotels() {
        let request = HotelEntity.fetchRequest()
        do {
            hotels = try context.fetch(request)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getUserDetails() -> UserEntity? {
        guard let loggedInEmail = UserDefaults.standard.string(forKey: "email") else { return nil }
        let request = UserEntity.fetchRequest()
        let predicate = NSPredicate(format: "email == %@", loggedInEmail)
        request.predicate = predicate
        do {
            let user = try context.fetch(request)
            return user[0]
        } catch {
            print("Failed to fetch date from CoreData.")
            return nil
        }
    }
    
}
