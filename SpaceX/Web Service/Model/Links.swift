//
//  links.swift
//  SpaceX
//
//  Created by Zakaria Darwish on 04/11/2022.
//

import Foundation

class links:Decodable {
    
    var wikipedia:String
    var article:String
    var presskit:String
    var patch:patch
    
    init(wikipedia: String, article: String, presskit: String, patch: patch) {
        self.wikipedia = wikipedia
        self.article = article
        self.presskit = presskit
        self.patch = patch
    }

    

}
