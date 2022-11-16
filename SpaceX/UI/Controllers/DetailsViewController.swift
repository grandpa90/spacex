//
//  DetailsViewController.swift
//  SpaceX
//
//  Created by Zakaria Darwish on 14/11/2022.
//

import UIKit
import RxSwift
import RxCocoa

class DetailsViewController: UIViewController {

// MARK: IBOUTLET
    
    @IBOutlet weak var backgroundImage:UIImageView!
    @IBOutlet weak var rocketNameLable:UILabel!
    @IBOutlet weak var rocketDescriptionLabel:UILabel!
    @IBOutlet weak var wikipediaButton:UIButton!
    @IBOutlet weak var designView:UIView!
    
    
    let dispose = DisposeBag()

    
    var rocketViewModel:RocketViewModel?
    var id:String?
    
    
    
    
    
    
    func getData() {
        
        self.rocketNameLable.text = self.rocketViewModel?.name
        self.rocketDescriptionLabel.text = self.rocketViewModel?.description
        

    }
    
    
    func setup() {
        
        self.id? = UserDefaults.standard.string(forKey: "id") ?? ""
        let stringUrl = String(format:"%@","https://api.spacexdata.com/v4/rockets/",self.id!)
        let url = URL(string: stringUrl)
        WebService().getRockets(url: url!)
            .subscribeOn(SerialDispatchQueueScheduler.init(qos: .background))
            .observeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: {rocket in
                self.rocketViewModel? = RocketViewModel(rocket)
                backgroundImage.downloaded(from: rocketViewModel?.image,contentMode: .scaleAspectFill)

            },onError: {error in
                
            },onCompleted: {
                self.getData()
            },onDisposed: {
                
            }
            ).disposed(by: self.dispose)
//            .subscribe(onNext: { rocket in
//                self.rocketViewModel? = RocketViewModel(rocket)
//
//            },onError: { error in
//
//            },onCompleted: {
//                self.background.downloaded(from: rocketViewModel?.image,contentMode: .scaleAspectFill)
//
//            }).disposed(by: self.dispose)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
