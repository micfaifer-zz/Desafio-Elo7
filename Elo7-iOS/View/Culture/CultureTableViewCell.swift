//
//  CultureTableViewCell.swift
//  Elo7-iOS
//
//  Created by lugia on 20/09/18.
//  Copyright © 2018 MicFaifer. All rights reserved.
//

import UIKit

class CultureTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cultureCollectionView: UICollectionView!
    @IBOutlet weak var cultureCollectionHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        cultureCollectionView.isScrollEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {

        cultureCollectionView.delegate = dataSourceDelegate
        cultureCollectionView.dataSource = dataSourceDelegate
        cultureCollectionView.tag = row

        cultureCollectionView.reloadData()
        self.layoutIfNeeded()
        self.cultureCollectionHeightConstraint.constant = self.cultureCollectionView.contentSize.height
    }
}
