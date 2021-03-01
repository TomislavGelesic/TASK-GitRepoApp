
import UIKit
import SnapKit
import Combine

class SearchViewController: UIViewController {

    var viewModel: SearchViewModel
    
    let logoImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "github_logo"))
        return imageView
    }()
    
    let searchTextField: UITextField = {
        let img = UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30.0))
        let iconView = UIImageView(image: img?.withRenderingMode(.alwaysTemplate))
        iconView.tintColor = .darkGray
        let leftPlaceholderView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0))
        let textField = UITextField()
        textField.leftView = leftPlaceholderView
        textField.leftViewMode = .always
        textField.rightView = iconView
        textField.rightViewMode = .always
        textField.placeholder = "Search"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = CGColor.init(red: 1/3, green: 1/3, blue: 1/3, alpha: 1)
        return textField
    }()
    
    let filterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "slider.horizontal.3")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .black
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 30.0), forImageIn: .normal)
        return button
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("SEARCH", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(12)
        button.setTitleColor(.darkGray, for: .disabled)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 10
        button.isEnabled = false
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
        return button
    }()
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupViews()
        setConstraints()
    }
}

extension SearchViewController {
    
    func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubviews([logoImage, searchTextField, searchButton, filterButton])
        searchTextField.addTarget(self, action: #selector(searchTextFieldDidChange), for: .allEditingEvents)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        filterButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
    }
    
    @objc func searchTextFieldDidChange() {
        if let text = searchTextField.text,
           text.count >= 2 {
            searchButton.layer.borderColor = CGColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1)
            searchButton.isEnabled = true
            searchButton.backgroundColor = .white
            searchTextField.rightView?.tintColor = .black
            searchTextField.layer.borderColor = CGColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1)
        } else {
            searchButton.layer.borderColor = CGColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
            searchButton.isEnabled = false
            searchButton.backgroundColor = .lightGray
            searchTextField.rightView?.tintColor = .darkGray
            searchTextField.layer.borderColor = CGColor.init(red: 1/3, green: 1/3, blue: 1/3, alpha: 1)
        }
    }
    
    @objc func searchButtonTapped() {
        viewModel.searchButtonTapped()
    }
    
    @objc func filterButtonTapped() {
        viewModel.filterButtonTapped(on: self)
    }
    
    
}

extension SearchViewController {
    //MARK: CONSTRAINTS BELOW
    
    func setConstraints() {
        setConstaraintsFilterButton()
        setConstaraintsLogoImage()
        setConstaraintsSearchTextField()
        setConstaraintsSearchButton()
    }
    
    func setConstaraintsFilterButton() {
        filterButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(44)
            make.trailing.equalTo(view).offset(-10)
            make.top.equalTo(view.snp.top).offset(50)
        }
    }
    
    func setConstaraintsLogoImage() {
        logoImage.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.height.width.equalTo(250)
            make.bottom.equalTo(searchTextField.snp.top).offset(-50)
        }
    }
    
    func setConstaraintsSearchTextField() {
        searchTextField.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width*2/3)
            make.centerX.equalTo(view)
            make.height.equalTo(44)
            make.bottom.equalTo(searchButton.snp.top).offset(-50)
        }
    }
    
    func setConstaraintsSearchButton() {
        searchButton.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width*2/3)
            make.centerX.equalTo(view)
            make.height.equalTo(44)
            make.bottom.equalTo(view.snp.bottom).offset(-150)
        }
    }
}




