//
//  WebService.swift
//  SpaceX
//
//  Created by Zakaria Darwish on 06/11/2022.
//

import Foundation
import RxSwift
import RxCocoa

struct Resource<T> {
    let url:URL
    let parse:(Data) -> T?
}


final class WebService {


    
  
    
    
    func getRockets(url:URL) -> Observable<Rocket> {
        var rocket:Rocket?
        return PublishSubject.create { subject in
            
            
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                
                if let error = error {
                    subject.onCompleted()
                    subject.onError(error)
                }
                
                var parsedResult: [AnyObject]!
                do {
                    parsedResult = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [AnyObject]
                } catch {
                    
                    subject.onError(error)
                }
                
                if let parsedResult = parsedResult {
                    
                    for object in parsedResult {
                     rocket = Rocket(name: object["name"] as? String ?? "", description: object["description"] as? String ?? "" , wikipedia: object["wikipedia"] as? String ?? "", image: object["flicker"] as? [String] ?? [""])
                    }
                    
                    subject.onNext(rocket!)
                    subject.onCompleted()
                }
                
            }
            
            
            return Disposables.create {
                subject.onCompleted()
            }
        }
    }
    
    
    
    
    
    func getLaunches(url:URL) -> Observable<[Launches]>{
        
        var launche:Launches?
        var launches:[Launches]?
        return PublishSubject.create { subject in
        
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) {data,response,error in
                
                
                if let error  = error {
                    subject.onError(error)
                    subject.onCompleted()
                }
                
                var parsedResult: [AnyObject]!
                do {
                    parsedResult = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [AnyObject]
                } catch {
                    
                    subject.onError(error)
                }
                

                if let parsedResult = parsedResult {
                    launches = [Launches]()
                    
         
                    for object in parsedResult {
                        
                        let links = object["links"] as! [String:Any]
                        let patch = links["patch"] as! [String:Any]
                        let small = patch["small"] as? String ?? ""
                        
                        launche = Launches(id: object["id"] as? String ?? "", launchpad: object["launchpad"] as? String ?? "", flight_number: object["flight_number"] as? Int ?? 0, date_unix: object["date_unix"] as? Double ?? 0.0, name: object["name"] as? String ?? "", upcoming: object["upcoming"] as? Bool ?? false, success: object["success"] as? Bool ?? false, details: object["details"] as? String ?? "", small: small)
                        
                        launches!.append(launche!)
                    }
                    
                    subject.onNext(launches!)
                    subject.onCompleted()
                }


            }.resume()
            
            return Disposables.create {
                subject.onCompleted()
                
            }
            
        }
        
        
 
  
    }
    
    
//    func getRockets(url:URL,completion:@escaping (([Rocket]?) -> ())) {
//        var request = URLRequest(url: url)
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//
//            print(data)
//            if let error = error {
//                completion(nil)
//                print("errorrrrrr",error)
//            } else if let data = data {
//
//                print(data)
//                let rokcetList = try? JSONDecoder().decode([Rocket].self, from: data)
//
//                if let rokcetList = rokcetList {
//                    print(rokcetList)
//                    completion(rokcetList)
//                }
//            }
//
//        }.resume()
//    }
//
}


extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

