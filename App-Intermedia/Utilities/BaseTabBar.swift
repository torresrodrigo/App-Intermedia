//
//  MainTabBar.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 13/05/2021.
//

import UIKit
import FirebaseAuth

class BaseTabBar: UITabBarController {
        
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
        
       
       //Characters
        let vc1 = ListCharacterVC()
        vc1.title = "Characters"
        vc1.tabBarItem.image = UIImage(named: "iron-man")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        vc1.tabBarItem.selectedImage = UIImage(named: "iron-man")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        vc1.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        vc1.navigationItem.title = titleNav
        vc1.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logOut))
        vc1.navigationItem.rightBarButtonItem?.tintColor = .white

        //Events
        let vc2 = ListEventsVC()
        vc2.title = "Events"
        vc2.tabBarItem.image = UIImage(named: "calendar")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        vc2.tabBarItem.selectedImage = UIImage(named: "calendar")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        vc2.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        vc2.navigationItem.title = titleNav
        vc2.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logOut))
        vc2.navigationItem.rightBarButtonItem?.tintColor = .white
        
        
        setViewControllers([vc1.embeddedInNavigation(), vc2.embeddedInNavigation()], animated: false)
    }
    
    @objc func logOut() {
            do {
                try Auth.auth().signOut()
                let login = LoginVC(nibName: "LoginVC", bundle: nil)
                login.modalTransitionStyle = .crossDissolve
                login.modalPresentationStyle = .fullScreen
                present(login, animated: true, completion: nil)
            } catch let err {
                print(err)
            }
        }
    }
