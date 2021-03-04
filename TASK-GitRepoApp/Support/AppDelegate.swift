//
//  AppDelegate.swift
//  TASK-GitRepoApp
//
//  Created by Tomislav Gelesic on 01.03.2021..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.backgroundColor = .white
        
//        let iconIssue: IconViewWithText2 = {
//            let view = IconViewWithText2(iconImage: UIImage(systemName: "exclamationmark.circle"), iconSize: 50, text: "0")
//            return view
//        }()
//
//        let rootVC = UIViewController()
//        rootVC.view = iconIssue
        
        
//        let rootVC = SearchViewController(viewModel: SearchViewModel())
        
        let rootVC = RepositoriesResultsViewController(viewModel: RepositoriesResultViewModel())
        
        let navigationController = UINavigationController(rootViewController: rootVC)
        navigationController.navigationBar.isHidden = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }


}

