//
//  MemberCollectionViewCell.swift
//  CMBMeetTheTeam
//
//  Created by Forrest Zhao on 2/11/17.
//  Copyright © 2017 Forrest Zhao. All rights reserved.
//

import UIKit
import SnapKit

class MemberCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundView?.backgroundColor = UIColor.blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var memberCellViewModel: MemberCellViewModel! {
        didSet {
            name = memberCellViewModel.fullName
            title = memberCellViewModel.title
            avatarUrl = memberCellViewModel.avatarUrl
            setupNameLabel()
            setupTitleLabel()
            setupAvatar()
        }
    }
    
    var name: String!
    var title: String!
    var avatarUrl: String!
    var avatar: UIImageView!
    
    var nameLabel: UILabel!
    var titleLabel: UILabel!
    
    func setupNameLabel() {
        nameLabel = UILabel()
        nameLabel.text = self.name
        nameLabel.snp.makeConstraints { (make) in
            make.topMargin.equalTo(avatar.snp.bottomMargin)
            make.leadingMargin.equalToSuperview()
            make.trailingMargin.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(CGFloat(1/6))
        }
        nameLabel.minimumScaleFactor = 0.5
    }
    
    func setupTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = self.title
        titleLabel.snp.makeConstraints { (make) in
            make.topMargin.equalTo(nameLabel.snp.bottomMargin)
            make.leadingMargin.equalToSuperview()
            make.trailingMargin.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(CGFloat(1/6))
        }
        titleLabel.minimumScaleFactor = 0.5
    }
    
    func setupAvatar() {
        avatar = UIImageView()
        APIClient.downloadImage(url: memberCellViewModel.avatarUrl) { (image) in
            if let image = image {
                DispatchQueue.main.async {
                    self.avatar.image = image
                }
            } else {
                //image not downloaded properly, use default no image placeholder
            }
        }
        avatar.snp.makeConstraints { (make) in
            make.topMargin.equalToSuperview()
            make.leadingMargin.equalToSuperview()
            make.trailingMargin.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(CGFloat(2/3))
        }
    }
    
}
