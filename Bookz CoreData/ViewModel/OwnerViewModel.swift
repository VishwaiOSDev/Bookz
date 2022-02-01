//
//  HotelsViewModel.swift
//  Bookz CoreData
//
//  Created by Vishwa  R on 01/02/22.
//

import Foundation

protocol HotelViewModelDelegate {
    func updateView()
    func failedToUpdate()
}

final class OwnerViewModel {
    
    private var model = Owner()
    var delegate : HotelViewModelDelegate?
        
    func uploadHotel(data : HotelData) {
        let uploadStatus = model.postNewHotel(with: data)
        if uploadStatus {
            delegate?.updateView()
        } else {
            delegate?.failedToUpdate()
        }
    }
        
}
