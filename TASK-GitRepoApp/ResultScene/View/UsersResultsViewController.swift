
import UIKit
import Combine

class UsersResultsViewController: UIViewController {
    
    var disposeBag = Set<AnyCancellable>()
    var viewModel: UsersResultViewModel
    let tableView: UITableView = {
        let backgroundView = UILabel()
        backgroundView.text = "No result.."
        backgroundView.textColor = .white
        backgroundView.textAlignment = .center
        let tableView = UITableView()
        tableView.backgroundView = backgroundView
        tableView.separatorStyle = .none
        tableView.backgroundColor = .gray
        tableView.register(UsersResultTableViewCell.self,
                           forCellReuseIdentifier: UsersResultTableViewCell.reuseIdentifier)
        return tableView
    }()
    
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
        textField.layer.borderWidth = 1
        textField.layer.borderColor = CGColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1)
        return textField
    }()
    
    init(viewModel: UsersResultViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }    
    deinit { print("UsersResultsViewController deinit called.") }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
        setConstraintsTableView()
        setupSubscribers()
        viewModel.searchSubject.send(viewModel.searchQuery)
    }

}

extension UsersResultsViewController {
    
    func setupNavigationBar() {
        let backButton: UIBarButtonItem = {
        let buttonImage = UIImage(systemName: "arrow.left")
        let button = UIBarButtonItem(image: buttonImage, style: .plain, target: self, action: #selector(backTapped))
        button.tintColor = .black
        return button
    }()
        navigationController?.navigationBar.isHidden = false
        searchTextField.delegate = self
        searchTextField.addTarget(self, action: #selector(searchDidChange), for: .allEditingEvents)
        navigationItem.setLeftBarButton(backButton, animated: true)
        navigationItem.titleView = searchTextField
        navigationController?.navigationBar.tintColor = .init(red: 0.0, green: 0.0, blue: 0.8, alpha: 1.0)
    }
    
    @objc func backTapped() { viewModel.buttonTapped(.back) }
    
    @objc func searchDidChange() {
        if let validText = searchTextField.text {
            if validText.isEmpty {
                viewModel.shouldGetFilteredScreenData = false
                viewModel.updateUISubject.send()
            }
            else if validText.count >= 2 {
                viewModel.shouldGetFilteredScreenData = true
                viewModel.showFilteredScreenData(query: validText)
            }
        }
    }
    
    func setupViews() {
        view.backgroundColor = .gray
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    func setupSubscribers() {
        viewModel.updateUISubject
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: RunLoop.main)
            .sink { [unowned self] (_) in
                self.tableView.reloadData()
            }
            .store(in: &disposeBag)       
    
    viewModel.initializeSearchSubject(subject: viewModel.searchSubject.eraseToAnyPublisher())
        .store(in: &disposeBag)
    
    viewModel.spinnerSubject
        .subscribe(on: DispatchQueue.global(qos: .background))
        .receive(on: RunLoop.main)
        .sink { [unowned self] (value) in value ? self.showSpinner() : self.hideSpinner() }
        .store(in: &disposeBag)
    
    viewModel.alertSubject
        .subscribe(on: DispatchQueue.global(qos: .background))
        .receive(on: RunLoop.main)
        .sink { [unowned self] (message) in self.showAlert(text: message) { } }
        .store(in: &disposeBag)
    }
}

extension UsersResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.shouldGetFilteredScreenData {
            return viewModel.filteredScreenData.count
        } else {
            return viewModel.screenData.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UsersResultTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        if viewModel.shouldGetFilteredScreenData { cell.configure(with: viewModel.filteredScreenData[indexPath.row]) }
        else { cell.configure(with: viewModel.screenData[indexPath.row]) }
        cell.openProfileTapped = { [unowned self] () in self.viewModel.buttonTapped(.showDetails(position: indexPath.row)) }
        cell.openInBrowserTapped = { [unowned self] () in self.viewModel.buttonTapped(.openInBrowser(position: indexPath.row)) }
        return cell
    }
}

extension UsersResultsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.buttonTapped(.showDetails(position: indexPath.row))
    }
}

extension UsersResultsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = searchTextField.text, text.isEmpty {
            viewModel.shouldGetFilteredScreenData = false
            viewModel.updateUISubject.send()
        }
        textField.resignFirstResponder()
        return true
    }
}

extension UsersResultsViewController {
    //MARK: CONSTRAINTS BELOW
    
    func setConstraintsTableView() { tableView.snp.makeConstraints { (make) in make.edges.equalTo(view.safeAreaLayoutGuide) }}
}
