//
//  DepartmentInfos.swift
//  Elo7-iOS
//
//  Created by lugia on 20/09/18.
//  Copyright © 2018 MicFaifer. All rights reserved.
//

import Foundation


struct DepartmentsInfos: Codable {
    let title: String
    let departments: [Department]
}

struct Department: Codable {
    let name, iconName, description, videoLink: String
}
