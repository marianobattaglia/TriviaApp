//
//  TabBarController.swift
//  Trivia
//
//  Created by Mariano Martin Battaglia on 30/05/2022.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewController()
        
    }
    
    func setupViewController() {
        // 1st Navigation VC
        let firstTabTitle = "Categories"
        let firstTabImage = UIImage(systemName: "list.dash")
        
        let firstTab = CategoriesViewController(nibName: "CategoriesViewController", bundle: nil)
        firstTab.title = firstTabTitle
        
        let firstNavigationViewController = UINavigationController(rootViewController: firstTab)
        firstNavigationViewController.tabBarItem = UITabBarItem(title: firstTabTitle, image: firstTabImage, selectedImage: nil)
        
        //2nd Navigation VC
        let secondTabTitle = "Random"
        let secondTabImage = UIImage(systemName: "shuffle")
        
        let secondTab = QuestionViewController(nibName: "QuestionViewController", bundle: nil)
        secondTab.title = secondTabTitle
        
        let secondNavigationViewController = UINavigationController(rootViewController: secondTab)
        secondNavigationViewController.tabBarItem = UITabBarItem(title: secondTabTitle, image: secondTabImage, selectedImage: nil)

        viewControllers = [secondNavigationViewController, firstNavigationViewController]
    }
}
