//
//  TabViewController.swift
//  TASK-GitRepoApp
//
//  Created by Tomislav Gelesic on 02.03.2021..
//

import UIKit
import Tabman
import Pageboy

class TabmanAdapter: TabmanViewController {
    
    var viewControllers: [UIViewController]
    
    init(viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers.map({ (vc) -> UINavigationController in
            return UINavigationController(rootViewController: vc)
        })
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    deinit { print("TabmanAdapter deinit called.") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        bar.layout.contentMode = .fit
        bar.buttons.customize { (button) in
            button.tintColor = .black
            button.selectedTintColor = .init(red: 0.0, green: 0.0, blue: 0.8, alpha: 1.0)
        }
        bar.indicator.tintColor = .init(red: 0.0, green: 0.0, blue: 0.8, alpha: 1.0)
        addBar(bar, dataSource: self, at: .bottom)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        dismiss(animated: true, completion: nil)
        navigationController?.navigationBar.isHidden = false
    }
}

extension TabmanAdapter: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        if pageboyViewController is RepositoriesResultsViewController {
            
        }
        return viewControllers[index]
    }
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "Repositories")
        case 1:
            return TMBarItem(title: "Users")
        default:
            return TMBarItem(title: "\(index)")
        }
    }
}
