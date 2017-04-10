//
//  Member.swift
//  CMBMeetTheTeam
//
//  Created by Forrest Zhao on 2/11/17.
//  Copyright © 2017 Forrest Zhao. All rights reserved.
//

import SwiftyJSON

struct Member {
    
    let avatarURL: String
    let firstName: String
    let lastName: String
    let id: String
    let title: String
    let bio: String
    
    init(dict: JSON) {
        avatarURL = dict["avatar"].stringValue
        firstName = dict["firstName"].stringValue
        lastName = dict["lastName"].stringValue
        id = dict["id"].stringValue
        title = dict["title"].stringValue
        bio = dict["bio"].stringValue
    }

}
