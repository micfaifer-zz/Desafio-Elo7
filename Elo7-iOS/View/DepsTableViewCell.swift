//
//  DepsTableViewCell.swift
//  Elo7-iOS
//
//  Created by lugia on 19/09/18.
//  Copyright © 2018 MicFaifer. All rights reserved.
//

import UIKit

protocol UpdateCellTableHeightDelegate: class {
    func updateHeight (at _: IndexPath)
}

class DepsTableViewCell: UITableViewCell {
    var indexPath: IndexPath?

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var depsCollectionView: UICollectionView!
    @IBOutlet weak var depCollectionHeightConstraint: NSLayoutConstraint!

    weak var updateHeightDelegate: UpdateCellTableHeightDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupDepartmentCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setupDepartmentCollectionView() {
        depsCollectionView.isScrollEnabled = false
    }

    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {

        depsCollectionView.delegate = dataSourceDelegate
        depsCollectionView.dataSource = dataSourceDelegate
        depsCollectionView.tag = row
//        depsCollectionView.reloadData()

        depsCollectionView.reloadData()
        depsCollectionView.performBatchUpdates(nil, completion: {
            (result) in
            if self.depsCollectionView.contentSize.height > 100 {
                self.depCollectionHeightConstraint.constant = self.depsCollectionView.contentSize.height
                self.updateHeightDelegate?.updateHeight(at: self.indexPath ?? IndexPath.init())
            }
        })
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        self.depCollectionHeightConstraint.constant = self.depsCollectionView.contentSize.height
        updateHeightDelegate?.updateHeight(at: IndexPath.init(item: self.depsCollectionView.tag, section: 0))
    }
}
