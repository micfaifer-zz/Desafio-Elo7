//
//  Result.swift
//  Elo7-iOS
//
//  Created by lugia on 20/09/18.
//  Copyright © 2018 MicFaifer. All rights reserved.
//

import Foundation

import Foundation

enum Result<T, U> where U: Error  {
    case success(T)
    case failure(U)
}
