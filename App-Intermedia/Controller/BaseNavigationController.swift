//
//  BaseNavigationController.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 13/05/2021.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        styling()
    }
    
    fileprivate func styling(){
        let navBar = self.navigationBar
        navBar.barStyle = .black
        navBar.isTranslucent = false
        navBar.barTintColor = #colorLiteral(red: 0.149002701, green: 0.1490303874, blue: 0.148996681, alpha: 1)
      }
}
