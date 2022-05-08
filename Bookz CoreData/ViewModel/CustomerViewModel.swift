//
//  CustomerViewModel.swift
//  Bookz CoreData
//
//  Created by Vishwa  R on 01/02/22.
//

import Foundation

protocol CustomerViewModelDelegate {
    func didFetchedDetails(_ hotels : [HotelEntity])
}

protocol CustomerDetailsDelegate {
    func didFetchedUserDetails(_ user : UserEntity)
}

final class CustomerViewModel {
    
    private var model = Customer()
    var delegate : CustomerViewModelDelegate?
    var customerDelegate : CustomerDetailsDelegate?
    
    func fetchHotelsFromDatabase() {
        delegate?.didFetchedDetails(model.hotels)
    }
    
    func getDetailsOfUser() {
        guard let user = model.getUserDetails() else { return }
        customerDelegate?.didFetchedUserDetails(user)
    }
    
    func calucatePrice(fromDate : Date, toDate: Date, price : String) -> Int {
        let numberOfDays = getTotalNumberOfDays(fromDate, toDate)
        return numberOfDays * Int(price)!
    }
    
    private func getTotalNumberOfDays(_ fromDate : Date, _ toDate : Date) -> Int {
        return Calendar.current.dateComponents([.day], from: fromDate, to: toDate).day!
    }
    
}
