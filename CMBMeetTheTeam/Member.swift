//
//  Member.swift
//  CMBMeetTheTeam
//
//  Created by Forrest Zhao on 2/11/17.
//  Copyright © 2017 Forrest Zhao. All rights reserved.
//

import Foundation

import UIKit

typealias JSON = [String: Any]

class Member {
    var avatarURL: String
    var firstName: String
    var lastName: String
    var id: String
    var title: String
    var avatar: UIImage?
    
    init(dict: JSON) {
        guard let title = dict["title"] as? String,
            let firstName = dict["firstName"] as? String,
            let lastName = dict["lastName"] as? String,
            let id = dict["id"] as? String,
            let avatarURL = dict["avatarURL"] as? String
            else { fatalError("Could not create movie object from supplied dictionary") }
        self.title = title
        self.firstName = firstName
        self.lastName = lastName
        self.id = id
        self.avatarURL = avatarURL
    }
    
//    func loadImage(_ completion: @escaping (_ Movie: Movie, _ error: NSError?) -> Void) {
//        guard let url = URL(string: imageUrl) else {
//            print("Image url messed up")
//            completion(self, nil)
//            return
//        }
//        let loadRequest = URLRequest(url: url)
//        
//        URLSession.shared.dataTask(with: loadRequest, completionHandler: { (data, response, error) in
//            if let error = error {
//                print("error downloading image!!!")
//                print("error image url = \(self.imageUrl)")
//                DispatchQueue.main.async {
//                    completion(self, error as NSError?)
//                }
//                return
//            }
//            
//            guard let data = data else {
//                print("image data is nil!!!")
//                DispatchQueue.main.async {
//                    completion(self, nil)
//                }
//                return
//            }
//            
//            let returnedImage = UIImage(data: data)
//            self.image = returnedImage
//            DispatchQueue.main.async {
//                completion(self, nil)
//            }
//        }).resume()
//    }
}
