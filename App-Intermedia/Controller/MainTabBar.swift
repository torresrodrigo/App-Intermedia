//
//  MainTabBar.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 13/05/2021.
//

import UIKit

class MainTabBar: UITabBarController {
        
    let titleNav = "Marvel Challenge"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    
    func setupTabBar() {
        tabBar.barStyle = .black
        tabBar.isTranslucent = false
        tabBar.barTintColor = UIColor(cgColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        tabBar.tintColor = .black

        let vc1 = ListCharacterVC()
        let vc2 = ListEventsVC()
        vc1.title = "Characters"
        vc1.view.backgroundColor = .red
        vc2.title = "Events"
        vc2.view.backgroundColor = .blue
        vc1.navigationItem.title = titleNav
        vc2.navigationItem.title = titleNav
        
        setViewControllers([vc1.embeddedInNavigation(), vc2.embeddedInNavigation()], animated: false)
    }
    
}
