//
//  BookingViewModel.swift
//  Bookz CoreData
//
//  Created by Vishwa  R on 02/02/22.
//

import Foundation

protocol BookingViewModelDelegate {
    func didFetchedBookedHotelDetails(_ hotelDetails : [Booking.BookedData])
}

final class BookingViewModel {
    
    private var model = Booking()
    var delegate : BookingViewModelDelegate?
    
    func bookHotel(fromDate : Date, toDate : Date, totalCost: Int, in hotel : HotelEntity) {
        model.bookHotel(in: hotel, checkInDate: fromDate, checkOutDate: toDate, totalCost: totalCost)
    }
    
    func getBookedHotelDetails() {
        guard let bookedDetails = model.getDetailsOfBookedHotels() else { return }
        delegate?.didFetchedBookedHotelDetails(bookedDetails)
    }
    
}
