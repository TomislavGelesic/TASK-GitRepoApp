
import UIKit

class ResultSceneViewControllerWrapper: UIViewController {
    
    let searchTextField: UITextField = {
        let img = UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20.0))
        let iconView = UIImageView(image: img?.withRenderingMode(.alwaysTemplate))
        iconView.tintColor = .lightGray
        let placeholderView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0))
        let textField = UITextField(frame: .init(x: 0.0, y: 0.0, width: 200, height: 30))
        textField.rightView = placeholderView
        textField.rightViewMode = .always
        textField.leftView = iconView
        textField.leftViewMode = .always
        textField.placeholder = "Search"
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = CGColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1)
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    var rootViewController: UIViewController
    
    init(_ rootViewController: UIViewController) {
        self.rootViewController = rootViewController
        super.init(nibName: nil, bundle: nil)
    }
    deinit { print("ResultSceneViewControllerWrapper deinit called") }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = ""
    }
}

extension ResultSceneViewControllerWrapper {
    func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.left")?.withTintColor(.black)
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.left")?.withTintColor(.black)
        navigationItem.titleView = searchTextField
    }
    
    @objc func searchDidChange() {
        if let repoVC = rootViewController as? RepositoriesResultsViewController {
            repoVC.viewModel.searchInputChanged(searchTextField.text)
        }
        else if let usersVC = rootViewController as? UsersResultsViewController {
            usersVC.viewModel.searchInputChanged(searchTextField.text)
        }
        else if let tabmanVC = rootViewController as? TabmanResultsViewController {
            tabmanVC.searchInputChanged(searchTextField.text)
        }
        else {
            print("ACCESSING INVALID INDEX -- ResultSceneAdapterViewController: @objc func searchDidChange() ")
        }
    }
    
    func setupViews() {
        searchTextField.delegate = self
        searchTextField.addTarget(self, action: #selector(searchDidChange), for: .allEditingEvents)
        view.addSubview(rootViewController.view)
        rootViewController.view.snp.makeConstraints { (make) in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}


extension ResultSceneViewControllerWrapper: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


