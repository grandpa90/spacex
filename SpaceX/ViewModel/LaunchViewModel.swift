//
//  RocketViewModel.swift
//  SpaceX
//
//  Created by Zakaria Darwish on 06/11/2022.
//

import Foundation
import UIKit
import CoreData
import RxSwift
import RxCocoa

struct LaunchViewModel {
     let launch:Launches
}


extension LaunchViewModel {
    init(_ launch:Launches) {
        self.launch = launch
    }
    
    var launchpad:String {
        return self.launch.launchpad
    }
    
    var fligh_number:Int {
        return self.launch.flight_number
    }
    
    var date:Double {
        return self.launch.date_unix
    }
    
    var name:String  {
        return self.launch.name
    }
    
    var upcoming:Bool {
        return self.launch.upcoming
    }
    
    var success:Bool {
        return self.launch.success
    }
    
    var details:String {
        return self.launch.details
    }
    
    var small:String {
        return self.launch.small
    }
    
}

struct LaunchListViewModel {
    var launches:[Launches]
}

extension LaunchListViewModel {
    
    var numberOfSections:Int {
        return 1
    }
    
    var numberOfRowsInSection:Int {
        return self.launches.count
    }
    
    func LaunchAtIndexPath (_ index:Int) -> LaunchViewModel {
        let launch  = self.launches[index]
        return LaunchViewModel(launch)
    }
    
}

