//
//  UIViewControllerExtensions.swift
//  Elo7-iOS
//
//  Created by lugia on 21/09/18.
//  Copyright © 2018 MicFaifer. All rights reserved.
//

import Foundation

import UIKit

extension UIViewController {
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
