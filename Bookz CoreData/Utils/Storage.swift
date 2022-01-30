//
//  StorageModel.swift
//  Bookz CoreData
//
//  Created by Vishwa  R on 29/01/22.
//

import Foundation

struct Storage {
    static func saveDataInUserDefaults<T>(data : T, forKey : String) {
        UserDefaults.standard.set(data, forKey : forKey)
    }
    static func fetchBoolDataFromUserDefaults(key : String) -> Bool {
        return UserDefaults.standard.bool(forKey: key)
    }
}
