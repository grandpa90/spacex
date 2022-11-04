//
//  patch.swift
//  SpaceX
//
//  Created by Zakaria Darwish on 04/11/2022.
//

import Foundation


class patch:Codable {
    
    var small:String
    var large:String
    

    init(small: String, large: String) {
        self.small = small
        self.large = large
    }
    
    
    
}
