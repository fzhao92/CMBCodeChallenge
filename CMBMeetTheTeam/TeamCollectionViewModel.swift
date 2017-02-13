//
//  MemberCollectionViewModel.swift
//  CMBMeetTheTeam
//
//  Created by Forrest Zhao on 2/12/17.
//  Copyright © 2017 Forrest Zhao. All rights reserved.
//

import Foundation

class TeamCollectionViewModel {
    
    var memberCellViewModels: [MemberCellViewModel] = []
    
    func populateViewModels() {
        let members = APIClient.synthesizeMemberObj()
        for member in members {
            memberCellViewModels.append(MemberCellViewModel(member: member))
        }
    }
    
}
