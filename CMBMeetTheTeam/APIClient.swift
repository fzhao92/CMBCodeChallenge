//
//  TeamJSONClient.swift
//  CMBMeetTheTeam
//
//  Created by Forrest Zhao on 2/11/17.
//  Copyright © 2017 Forrest Zhao. All rights reserved.
//

import UIKit
import SwiftyJSON
import AlamofireImage
import Alamofire

class APIClient {
    
    static func synthesizeMemberObj() -> [Member] {
        var members: [Member] = []
        if let path = Bundle.main.path(forResource: "team", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj = JSON(data: data).array
                guard let jsonArray = jsonObj else { fatalError("JSON is malformed") }
                for jsonObj in jsonArray {
                    members.append(Member(dict: jsonObj))
                }
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            print("Invalid filename/path.")
        }
        return members
    }
    
    static func downloadImage(url: String, completion: @escaping (UIImage?) -> Void) {
        Alamofire.request(url).responseImage { (response) in
            if let image = response.result.value {
                return completion(image)
            } else {
                print("Error downloading image!")
            }
        }
    }
    
}
