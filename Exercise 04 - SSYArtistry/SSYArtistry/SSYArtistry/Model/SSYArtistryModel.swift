//
//  SSYArtistryModel.swift
//  SSYArtistry
//
//  Created by 邵仕宇 on 2017/6/29.
//  Copyright © 2017年 邵仕宇. All rights reserved.
//

import UIKit

class SSYArtistryModel: NSObject {

    var image: UIImage
    var name: String
    var bio: String
    var works: [Work]
    
    init(image: UIImage, name: String, bio: String, works: [Work]) {
        
        self.image = image
        self.name = name
        self.bio = bio
        self.works = works
    }
    
    static func artistsFromBundle() -> [SSYArtistryModel] {
        
        var artistryModel = [SSYArtistryModel]()
        
        guard let url = Bundle.main.url(forResource: "artists", withExtension: "json") else {
            return artistryModel
        }
        
        do {
            
            let data = try Data(contentsOf: url)
            
            guard let rootObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any] else {
                return artistryModel
            }
            
            guard let artistryObjects = rootObject["artists"] as? [[String : AnyObject]] else {
                return artistryModel
            }
            
            for artistryObject in artistryObjects {
                
                if let name = artistryObject["name"] as? String,
                    let bio = artistryObject["bio"] as? String,
                    let imageName = artistryObject["image"] as? String,
                    let image = UIImage(named: imageName),
                    let worksObject = artistryObject["works"] as? [[String : String]] {
                    
                        var works = [Work]()
                    
                        for workObject in worksObject {
                           if let workName = workObject["title"],
                            let workImageName = workObject["image"],
                            let workImage = UIImage(named: workImageName + ".jpg"),
                            let workInfo = workObject["info"] {
                                works.append(Work(name: workName, image: workImage, info: workInfo, isExpanded: false))
                            }
                        }
                    let model = SSYArtistryModel(image: image, name: name, bio: bio, works: works)
                    artistryModel.append(model)
                }
            }
        }
        catch {
            
            return artistryModel
            
        }
        
        return artistryModel
    }
    
}
