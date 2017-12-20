//
//  MainNavigationController.swift
//  Teal Coding Challenge
//
//  Created by Kyle Stewart on 12/18/17.
//  Copyright © 2017 Kyle Stewart. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    static var shared: MainNavigationController!
    
    override func viewDidLoad() {
        MainNavigationController.shared = self

        setBarAttributes()
    }
    
    func setBarAttributes() {
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.barTintColor = Constants.mainColor
        self.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
    }
    
    func push(_ viewController: ViewControllers, animated: Bool) {
        let vc: UIViewController = viewController.getInstance
        switch viewController {
        case .summary(let data):
            let viewModel = SummaryViewModel(data: data)
            (vc as! SummaryViewController).viewModel = viewModel
        default:
            break
        }
        
        pushViewController(vc, animated: true)
    }
    
    func popToRankings() {
        guard let rankingsViewController = viewControllers.first(where: { $0.isKind(of: RankingsViewController.self) }) else {
            push(.rankings, animated: true)
            return
        }
        popToViewController(rankingsViewController, animated: true)
    }
}
