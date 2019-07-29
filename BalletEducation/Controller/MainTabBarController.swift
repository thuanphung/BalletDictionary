//
//  MainTabBarController.swift
//  BalletEducation
//
//  Created by Thuan Phung on 6/4/19.
//  Copyright © 2019 Thuan Phung. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
            
            setControllers(view: SearchController(), title: "Search", image: "search"),
            setControllers(view: TermSectionController(), title: "Term Categories", image: "all")
        ]
        
        
    }
    
    fileprivate func setControllers(view: UIViewController, title: String, image: String) -> UIViewController{
        let navController = UINavigationController(rootViewController: view)
        view.title = title
        navController.tabBarItem.image = UIImage(named: image)
        return navController
        
    }
}
