//
//  Hotel.swift
//  Bookz CoreData
//
//  Created by Vishwa  R on 01/02/22.
//

import UIKit
import CoreData

protocol HotelData {
    var hotelName : String { get set }
    var description : String { get set }
    var price : String { get set }
}

struct Owner : HotelData {
    var hotelName: String = ""
    var description: String = ""
    var price: String = ""
    private(set) var hotels : [HotelEntity] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func postNewHotel(with details : HotelData) -> Bool {
        let hotelEntity = HotelEntity(context: context)
        hotelEntity.hotelName = details.hotelName
        hotelEntity.hotelDescription = details.description
        hotelEntity.hotelPrice = details.price
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
}
