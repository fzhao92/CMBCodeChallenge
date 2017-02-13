//
//  MemberDetailViewModel.swift
//  CMBMeetTheTeam
//
//  Created by Forrest Zhao on 2/11/17.
//  Copyright © 2017 Forrest Zhao. All rights reserved.
//

import UIKit

class MemberDetailViewModel {
    
    var avatarUrl: String
    var fullName: String
    var title: String
    var bio: String
    var avatar: UIImage?
    
    init(avatarUrl: String, fullName: String, title: String, bio: String) {
        self.avatarUrl = avatarUrl
        self.title = title
        self.fullName = fullName
        self.bio = bio
    }
    
    func downloadImage(completion: @escaping (Bool) -> Void) {
        APIClient.downloadImage(url: avatarUrl) { (image) in
            if let image = image {
                self.avatar = image
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
}
