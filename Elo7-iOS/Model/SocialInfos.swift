//
//  SocialInfos.swift
//  Elo7-iOS
//
//  Created by lugia on 21/09/18.
//  Copyright © 2018 MicFaifer. All rights reserved.
//

import Foundation

struct SocialInfos: Codable {
    let title, description: String
    let socialItems: [SocialItem]
}

struct SocialItem: Codable {
    let name, iconName, link: String
}
