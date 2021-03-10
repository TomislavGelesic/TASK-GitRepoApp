
import UIKit
import Tabman
import Pageboy

class TabmanResultsViewController: TabmanViewController {
    
    var viewControllers: [UIViewController]
    
    init(viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    deinit { print("TabmanResultsViewController deinit called.") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        setupTMBar()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = ""
    }
}

extension TabmanResultsViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func setupTMBar() {
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        bar.layout.contentMode = .fit
        bar.buttons.customize { (button) in
            button.tintColor = .black
            button.selectedTintColor = .init(red: 0.0, green: 0.0, blue: 0.8, alpha: 1.0)
        }
        bar.indicator.tintColor = .init(red: 0.0, green: 0.0, blue: 0.8, alpha: 1.0)
        addBar(bar, dataSource: self, at: .top)
    }
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
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
    func searchInputChanged(_ query: String?) {
        switch self.currentIndex {
        case 0:
            if let repoVC = viewControllers[0] as? RepositoriesResultsViewController {
                repoVC.viewModel.searchInputChanged(query)
            }
        case 1:
            if let usersVC = viewControllers[1] as? UsersResultsViewController {
                usersVC.viewModel.searchInputChanged(query)
            }
        default:
            print("ACCESSING INVALID INDEX -- TabmanAdapterViewController: @objc func searchDidChange()")
            break
        }
    }
}
