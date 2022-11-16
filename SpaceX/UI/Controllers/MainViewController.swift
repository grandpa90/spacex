//
//  ViewController.swift
//  SpaceX
//
//  Created by Zakaria Darwish on 02/11/2022.
//

import UIKit
import RxSwift

class MainViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource {
    let disposeBag = DisposeBag()
    @IBOutlet weak var launchCollectionView: UICollectionView!
    
    var launchViewModel:LaunchViewModel?
    var launchListViewModel:LaunchListViewModel?
    var id:String = ""
    var launche:Launches?
    
    
    
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.id = self.launchListViewModel?.LaunchAtIndexPath(indexPath.row).launch.id ?? ""
        UserDefaults.setValue(self.id, forKey: "id")
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.launchListViewModel!.numberOfRowsInSection
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "LaunchCell", for: indexPath) as? LaunchCollectionViewCell
                                
        else  {
            fatalError("LaunchCollectionViewCell not found")
        }
        
        let launchesVM = self.launchListViewModel?.LaunchAtIndexPath(indexPath.row)
        cell.configure(launchViewModel: launchesVM!)
        
        
                return cell
    }

//
    func setup() {
        print("hiiii")
        

        
        let url = URL(string: "http://api.spacexdata.com/v4/launches")!
        WebService().getLaunches(url: url)
            .subscribeOn(SerialDispatchQueueScheduler.init(qos: .background))
            .observeOn(MainScheduler.asyncInstance).subscribe(onNext: { launchesList in
                self.launchListViewModel = LaunchListViewModel(launches: launchesList)
                
            
                for launch in launchesList {
                    
                    print(launch.id)
                    
                    
                }
                
            },onError: { error in
               
            },onCompleted: {
                self.launchCollectionView.delegate = self
                self.launchCollectionView.dataSource = self
                self.launchCollectionView.isPagingEnabled = true
                
                self.launchCollectionView.reloadData()
            }).disposed(by: self.disposeBag)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        // Do any additional setup after loading the view.
    }


}

