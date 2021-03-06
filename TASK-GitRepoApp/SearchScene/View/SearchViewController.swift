
import UIKit
import SnapKit
import Combine

class SearchViewController: UIViewController {

    var disposeBag = Set<AnyCancellable>()
    var viewModel: SearchViewModel
    
    let logoImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "octocat"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let searchTextField: UITextField = {
        let img = UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20.0))
        let iconView = UIImageView(image: img?.withRenderingMode(.alwaysTemplate))
        iconView.tintColor = .black
        let placeholderView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0))
        let textField = UITextField()
        textField.rightView = placeholderView
        textField.rightViewMode = .always
        textField.leftView = iconView
        textField.leftViewMode = .always
        textField.placeholder = "Search"
        textField.layer.masksToBounds = false
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    let filterView: IconViewWithText1 = {
       let view = IconViewWithText1(iconImage: UIImage(systemName: "slider.horizontal.3"), iconSize: 36, text: "0")
        view.icon.tintColor = .black
        view.iconText.backgroundColor = .init(red: 0.0, green: 0.0, blue: 0.8, alpha: 1.0)
        view.iconText.font = view.iconText.font.withSize(10)
        view.iconText.textColor = .white
        return view
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("SEARCH", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(12)
        button.setTitleColor(.darkGray, for: .disabled)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
        return button
    }()
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    deinit { print("SearchViewController deinit called.") }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        setSubscribers()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationTitle("GitHub")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        setNavigationTitle("")
    }
}

extension SearchViewController {
    
    func setNavigationTitle(_ title: String) {
        navigationItem.title = title
        navigationController?.navigationBar.tintColor = .black
    }
    func setupViews() {
        view.backgroundColor = .white
        view.addSubviews([logoImage, searchTextField, searchButton, filterView])
        viewModel.viewControllerDelegate = self
        searchTextField.addTarget(self, action: #selector(searchTextFieldDidChange), for: .allEditingEvents)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        filterView.icon.addTarget(self, action: #selector(filterViewTapped), for: .touchUpInside)
    }
    func setSubscribers() {        
        viewModel.updateFilterLabelSubject
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: RunLoop.main)
            .sink { [unowned self] (amount) in self.filterView.iconText.text = "\(amount)" }
            .store(in: &disposeBag)
    }
    @objc func searchTextFieldDidChange() { viewModel.searchTextChanged(searchTextField.text) }
    @objc func searchButtonTapped() { viewModel.searchButtonTapped(for: searchTextField.text) }
    @objc func filterViewTapped() { viewModel.filterButtonTapped(on: self) }
    
    func enableSearch(_ should: Bool) {
        if should {
            searchButton.layer.borderColor = CGColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1)
            searchButton.isEnabled = true
            searchButton.backgroundColor = .white
            searchButton.addShadow(color: .black)
        }
        else {
            searchButton.layer.borderColor = CGColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
            searchButton.isEnabled = false
            searchButton.backgroundColor = .lightGray
            searchButton.removeShadow()
        }
    }
}

extension SearchViewController {
    //MARK: CONSTRAINTS BELOW
    func setConstraints() {
        setConstaraintsFilterView()
        setConstaraintsLogoImage()
        setConstaraintsSearchTextField()
        setConstaraintsSearchButton()
    }
    func setConstaraintsFilterView() {
        filterView.snp.makeConstraints { (make) in
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
    }
    func setConstaraintsLogoImage() {
        logoImage.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.height.width.equalTo(230)
            make.bottom.equalTo(searchTextField.snp.top).offset(-50)
        }
    }
    func setConstaraintsSearchTextField() {
        searchTextField.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width*2/3)
            make.centerX.equalTo(view)
            make.height.equalTo(44)
            make.bottom.equalTo(searchButton.snp.top).offset(-100)
        }
    }
    func setConstaraintsSearchButton() {
        searchButton.snp.makeConstraints { (make) in
            make.width.equalTo(view.frame.width*2/3)
            make.centerX.equalTo(view)
            make.height.equalTo(44)
            make.bottom.equalTo(view.snp.bottom).offset(-100)
        }
    }
}




