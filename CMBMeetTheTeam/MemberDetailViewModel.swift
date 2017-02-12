//
//  MemberDetailViewModel.swift
//  CMBMeetTheTeam
//
//  Created by Forrest Zhao on 2/11/17.
//  Copyright © 2017 Forrest Zhao. All rights reserved.
//

import Foundation

class MemberDetailViewModel {
    
    var fullName: String
    var title: String
    var bio: String
    
    init(member: Member) {
        self.fullName = "\(member.firstName) \(member.lastName)"
        self.title = member.title
        self.bio = member.bio
    }
    
}
