//
//  MemberCellViewModel.swift
//  CMBMeetTheTeam
//
//  Created by Forrest Zhao on 2/11/17.
//  Copyright © 2017 Forrest Zhao. All rights reserved.
//

import Foundation

struct MemberCellViewModel {
    
    var fullName: String
    var title: String
    var avatarUrl: String
    
    init(member: Member) {
        self.fullName = "\(member.firstName) \(member.lastName)"
        self.title = "\(member.title)"
        self.avatarUrl = member.avatarURL
    }
    
}
