//
//  Rocket.swift
//  SpaceX
//
//  Created by Zakaria Darwish on 03/11/2022.
//

import Foundation

class Rocket:Codable {
    
    var launchpad:String
    var flight_number:String
    var date:Double
    var name:String
    var upcoming:Bool
    var success:Bool
    var details:String
    var links:links
    
    
    init(launchpad: String, flight_number: String, date: Double, name: String, upcoming: Bool, success: Bool, details: String, links: links) {
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
