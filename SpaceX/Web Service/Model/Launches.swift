//
//  Rocket.swift
//  SpaceX
//
//  Created by Zakaria Darwish on 03/11/2022.
//

import Foundation





class Launches:Decodable {
    var id:String
    var launchpad:String
    var flight_number:Int
    var date_unix:Double
    var name:String
    var upcoming:Bool
    var success:Bool
    var details:String
    var small:String

    init(id: String, launchpad: String, flight_number: Int, date_unix: Double, name: String, upcoming: Bool, success: Bool, details: String, small: String) {
        self.id = id
        self.launchpad = launchpad
        self.flight_number = flight_number
        self.date_unix = date_unix
        self.name = name
        self.upcoming = upcoming
        self.success = success
        self.details = details
        self.small = small
    }
    
    
}
