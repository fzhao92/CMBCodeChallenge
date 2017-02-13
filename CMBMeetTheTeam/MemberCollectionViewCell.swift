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
    
    fileprivate var avatar: UIImageView = UIImageView()
    fileprivate var nameLabel: UILabel = UILabel()
    fileprivate var titleLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        layer.masksToBounds = true
        layer.cornerRadius = 6
        setupAvatar()
        setupNameLabel()
        setupTitleLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var memberCellViewModel: MemberCellViewModel! {
        didSet {
            memberCellViewModel.downloadImage { (success) in
                if success {
                    DispatchQueue.main.async {
                        self.avatar.image = self.memberCellViewModel.avatar
                    }
                }
            }
            nameLabel.text = memberCellViewModel.fullName
            titleLabel.text = memberCellViewModel.title
        }
    }
    
    func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.topMargin.equalTo(avatar.snp.bottomMargin).offset(30)
            make.centerX.equalTo(contentView.snp.centerX)
        }
        nameLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 16)
        nameLabel.textColor = Colors.nameLabelColor
        nameLabel.textAlignment = .center
        nameLabel.sizeToFit()
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.minimumScaleFactor = 0.5
        nameLabel.numberOfLines = 0
        nameLabel.preferredMaxLayoutWidth = contentView.frame.width * 0.9

    }
    
    func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.topMargin.equalTo(nameLabel.snp.bottomMargin).offset(20)
            make.centerX.equalTo(contentView.snp.centerX)
        }
        titleLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 12)
        titleLabel.textColor = Colors.titleColorLabel
        titleLabel.textAlignment = .center
        titleLabel.sizeToFit()
        titleLabel.preferredMaxLayoutWidth = contentView.frame.width * 0.9
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.minimumScaleFactor = 0.5
    }
    
    func setupAvatar() {
        contentView.addSubview(avatar)
        avatar.snp.makeConstraints { (make) in
            make.topMargin.equalTo(contentView.snp.top).offset(30)
            make.leadingMargin.equalTo(contentView.snp.leadingMargin)
            make.trailingMargin.equalTo(contentView.snp.trailingMargin)
            make.height.equalTo(contentView.snp.height).multipliedBy(0.6)
        }
        avatar.contentMode = .scaleAspectFit
    }
    
}
