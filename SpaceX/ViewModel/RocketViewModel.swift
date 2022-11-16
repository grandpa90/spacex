//
//  RocketViewModel.swift
//  SpaceX
//
//  Created by Zakaria Darwish on 14/11/2022.
//

import Foundation
struct RocketViewModel {
    
    private let rocket:Rocket
    
}



extension RocketViewModel {
    
    
    init(_ rocket:Rocket) {
        self.rocket = rocket
    }
    
    
    
    var name:String {
       return self.rocket.name
    }
    
    var description:String {
        return self.rocket.description
    }
    
    var image:[String] {
        return self.rocket.image
    }
    
    var wikipedia:String {
        return self.rocket.wikipedia
    }
    
    
    
}
