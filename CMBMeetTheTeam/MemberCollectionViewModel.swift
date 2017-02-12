//
//  MemberCollectionViewModel.swift
//  CMBMeetTheTeam
//
//  Created by Forrest Zhao on 2/12/17.
//  Copyright © 2017 Forrest Zhao. All rights reserved.
//

import Foundation

class MemberCollectionViewModel {
    
    var members: [Member] = []
    
    func populateMembers() {
        members = APIClient.synthesizeMemberObj()
    }
    
}
