//
//  TeamCollectionViewController.swift
//  CMBMeetTheTeam
//
//  Created by Forrest Zhao on 2/12/17.
//  Copyright © 2017 Forrest Zhao. All rights reserved.
//

import UIKit

private let reuseIdentifier = "memberCell"

class TeamCollectionViewController: UICollectionViewController {

    fileprivate let teamCollectionViewModel = TeamCollectionViewModel()
    fileprivate let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
    fileprivate let itemsPerRow: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "MEET THE TEAM"
        teamCollectionViewModel.populateViewModels()
        collectionView?.backgroundColor = UIColor(red:0.34, green:0.62, blue:0.93, alpha:1.0)
        collectionView?.register(MemberCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    // - MARK: collectionview delegate methods
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamCollectionViewModel.memberCellViewModels.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MemberCollectionViewCell
        cell.memberCellViewModel = teamCollectionViewModel.memberCellViewModels[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let member = teamCollectionViewModel.memberCellViewModels[indexPath.row]
        let destVC = MemberDetailViewController()
        let memberDetailViewModel = MemberDetailViewModel(avatarUrl: member.avatarUrl, fullName: member.fullName, title: member.title, bio: member.bio)
        destVC.memberDetailViewModel = memberDetailViewModel
        navigationController?.pushViewController(destVC, animated: true)
    }

}

// - MARK: - collectionviewflow delegate methods

extension TeamCollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem * 1.25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
}
