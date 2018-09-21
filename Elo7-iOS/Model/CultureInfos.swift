//
//  CultureInfos.swift
//  Elo7-iOS
//
//  Created by lugia on 20/09/18.
//  Copyright © 2018 MicFaifer. All rights reserved.
//

import Foundation

struct CultureInfos: Codable {
    let title, description: String
    let cultureItems: [CultureItem]
}

struct CultureItem: Codable {
    let name, iconName, description: String
    let videoLink: String?
}
