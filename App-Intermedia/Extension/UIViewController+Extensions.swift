//
//  UIViewController+Extensions.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 13/05/2021.
//

import UIKit

extension UIViewController {
    
    func embeddedInNavigation() -> BaseNavigationController {
        return BaseNavigationController(rootViewController: self)
    }
    
}
