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
    
}
