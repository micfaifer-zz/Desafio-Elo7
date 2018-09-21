//
//  SocialTableViewCell.swift
//  Elo7-iOS
//
//  Created by lugia on 20/09/18.
//  Copyright © 2018 MicFaifer. All rights reserved.
//

import UIKit

class SocialTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet private weak var socialCollectionView: UICollectionView!

    @IBOutlet private weak var socialCollectionHeightConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()

        socialCollectionView.isScrollEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {

        socialCollectionView.delegate = dataSourceDelegate
        socialCollectionView.dataSource = dataSourceDelegate
        socialCollectionView.tag = row

        socialCollectionView.reloadData()
        self.layoutIfNeeded()
        self.socialCollectionHeightConstraint.constant = self.socialCollectionView.contentSize.height
    }
}
