//
//  RocketEntity.swift
//  SpaceX
//
//  Created by Zakaria Darwish on 04/11/2022.
//

import Foundation

class RocketEntity {
    
    
    var launchpad:String
    var flight_number:String
    var date:Double
    var name:String
    var upcoming:Bool
    var success:Bool
    var details:String
    var links:LinksEntity
    
    init(launchpad: String, flight_number: String, date: Double, name: String, upcoming: Bool, success: Bool, details: String, links: LinksEntity) {
        self.launchpad = launchpad
        self.flight_number = flight_number
        self.date = date
        self.name = name
        self.upcoming = upcoming
        self.success = success
        self.details = details
        self.links = links
    }
    
}
