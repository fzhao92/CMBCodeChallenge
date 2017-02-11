//
//  ViewController.swift
//  CMBMeetTheTeam
//
//  Created by Forrest Zhao on 2/11/17.
//  Copyright © 2017 Forrest Zhao. All rights reserved.
//

import UIKit
import SwiftyJSON


class TeamCollectionViewController: UICollectionViewController {
    let numberOfSections = 2
    let memberCellIdentifier = "memberCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.red
        collectionView?.register(MemberCollectionViewCell.self, forCellWithReuseIdentifier: memberCellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfSections
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: memberCellIdentifier, for: indexPath)
        return cell
    }

}

extension TeamCollectionViewController: UICollectionViewDelegateFlowLayout {
    

}

