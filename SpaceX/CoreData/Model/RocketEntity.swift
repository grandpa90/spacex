//
//  RocketEntity.swift
//  SpaceX
//
//  Created by Zakaria Darwish on 04/11/2022.
//

import Foundation

class CDRocketEntity {
    
    
    var launchpad:String
    var flight_number:Int64
    var date:Double
    var name:String
    var upcoming:Bool
    var success:Bool
    var details:String
    var wikipedia:String
    var small:String
    var large:String
    
    init(launchpad: String, flight_number: Int64, date: Double, name: String, upcoming: Bool, success: Bool, details: String, wikipedia: String, small: String, large: String) {
        self.launchpad = launchpad
        self.flight_number = flight_number
        self.date = date
        self.name = name
        self.upcoming = upcoming
        self.success = success
        self.details = details
        self.wikipedia = wikipedia
        self.small = small
        self.large = large
    }
    
}
