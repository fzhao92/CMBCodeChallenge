//
//  MemberCellViewModel.swift
//  CMBMeetTheTeam
//
//  Created by Forrest Zhao on 2/11/17.
//  Copyright © 2017 Forrest Zhao. All rights reserved.
//

import UIKit

class MemberCellViewModel {
    
    var fullName: String
    var title: String
    var avatarUrl: String
    var bio: String
    var avatar: UIImage?
    
    init(member: Member) {
        self.fullName = "\(member.firstName) \(member.lastName)"
        self.title = "\(member.title)"
        self.avatarUrl = member.avatarURL
        self.bio = member.bio
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
