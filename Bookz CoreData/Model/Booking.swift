//
//  Booking.swift
//  Bookz CoreData
//
//  Created by Vishwa  R on 02/02/22.
//

import UIKit
import CoreData

struct Booking {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    struct BookedData {
        var hotelName : String = ""
        var customer : String = ""
        var totalCost : String = ""
        var fromDate = Date()
        var toDate = Date()
    }
    
    func bookHotel(in hotel : HotelEntity, checkInDate : Date, checkOutDate: Date, totalCost : Int) {
        guard let user = getUserDetails() else { return }
        let bookingEntity = BookingEntity(context: context)
        bookingEntity.addToUser(user)
        bookingEntity.hotel = hotel
        bookingEntity.fromData = checkInDate
        bookingEntity.toDate = checkOutDate
        bookingEntity.totalCost = String(totalCost)
        if saveData() {
            print("Hotel Booked.")
        } else {
            print("Failed to Book Hotel.")
        }
    }
    
    func saveData() -> Bool {
        do {
            try context.save()
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    mutating func getDetailsOfBookedHotels() -> [BookedData]? {
        var data = [BookedData]()
        guard let owner = getUserDetails() else { return nil }
        let request = BookingEntity.fetchRequest()
        do {
            let hotels = try context.fetch(request)
            for bookedHotel in hotels {
                if bookedHotel.hotel?.user?.email == owner.email {
                    var bookedData = BookedData(hotelName: (bookedHotel.hotel?.hotelName)!,totalCost: bookedHotel.totalCost!, fromDate: bookedHotel.fromData!, toDate: bookedHotel.toDate!)
                    for user in bookedHotel.user?.allObjects as! [UserEntity] {
                        bookedData.customer = user.name!
                    }
                    data.append(bookedData)
                }
            }
        } catch {
            print(error.localizedDescription)
            return nil
        }
        return data
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
