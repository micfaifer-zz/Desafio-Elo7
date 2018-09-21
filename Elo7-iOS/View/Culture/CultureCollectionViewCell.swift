//
//  CultureCollectionViewCell.swift
//  Elo7-iOS
//
//  Created by lugia on 20/09/18.
//  Copyright © 2018 MicFaifer. All rights reserved.
//

import UIKit

class CultureCollectionViewCell: UICollectionViewCell {
    static let cultureItemCellIdentifier = "cultureItemCell"
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
}
