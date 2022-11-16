//
//  RocketCollectionViewCell.swift
//  SpaceX
//
//  Created by Zakaria Darwish on 05/11/2022.
//

import UIKit

class LaunchCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var launchImageView: UIImageView!
    @IBOutlet weak var launchNumberLabel: UILabel!
    
    @IBOutlet weak var launchDateLabel: UILabel!
    func configure(launchViewModel:LaunchViewModel) {
        
        self.launchNumberLabel.text = String(describing: launchViewModel.fligh_number)
        
        
        launchImageView.downloaded(from: launchViewModel.small,contentMode: .scaleAspectFill)
    }
}
