//
//  LinksEntity.swift
//  SpaceX
//
//  Created by Zakaria Darwish on 04/11/2022.
//

import Foundation

class LinksEntity {
    
    var wikipedia:String
    var article:String
    var presskit:String
    var patch:PatchEntity
    
    init(wikipedia: String, article: String, presskit: String, patch: PatchEntity) {
        self.wikipedia = wikipedia
        self.article = article
        self.presskit = presskit
        self.patch = patch
    }
    
    
    
    
    
}
