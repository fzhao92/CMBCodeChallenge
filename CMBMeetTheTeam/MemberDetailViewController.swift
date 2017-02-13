//
//  MemberDetailViewController.swift
//  CMBMeetTheTeam
//
//  Created by Forrest Zhao on 2/12/17.
//  Copyright © 2017 Forrest Zhao. All rights reserved.
//

import UIKit

class MemberDetailViewController: UIViewController {
    
    var memberDetailViewModel: MemberDetailViewModel?
    var memberImageView = UIImageView()
    var memberBioTextView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupImageView()
        setupTextView()
    }
    
    func setupImageView() {
        if let memberDetailViewModel = memberDetailViewModel {
            view.addSubview(memberImageView)
            memberDetailViewModel.downloadImage(completion: { (success) in
                if success {
                    DispatchQueue.main.async {
                        self.memberImageView.image = memberDetailViewModel.avatar
                    }
                }
            })
            memberImageView.snp.makeConstraints({ (make) in
                make.top.equalToSuperview().offset(30)
                make.leading.equalToSuperview()
                make.trailing.equalToSuperview()
                make.height.equalToSuperview().multipliedBy(0.5)
            })
            memberImageView.contentMode = .scaleAspectFill
        }
    }
    
    func setupTextView() {
        if let memberDetailViewModel = memberDetailViewModel {
            view.addSubview(memberBioTextView)
            memberBioTextView.snp.makeConstraints({ (make) in
                make.topMargin.equalTo(memberImageView.snp.bottomMargin)
                make.leading.equalToSuperview()
                make.trailing.equalToSuperview()
                make.bottom.equalToSuperview()
            })
            memberBioTextView.backgroundColor = Colors.backgroundColor
            memberBioTextView.font = UIFont(name: "Arial Rounded MT Bold", size: 12)
            memberBioTextView.textColor = UIColor.white
            memberBioTextView.text = memberDetailViewModel.bio
        }
    }
    
    func setupNavBar() {
        if let memberDetailViewModel = memberDetailViewModel {
            navigationItem.title = memberDetailViewModel.fullName
        }
    }

}
