//
//  RepositoriesResultsViewController.swift
//  TASK-GitRepoApp
//
//  Created by Tomislav Gelesic on 01.03.2021..
//

import UIKit
import Combine

class RepositoriesResultsViewController: UIViewController {
    
    var disposeBag = Set<AnyCancellable>()
    var viewModel: RepositoriesResultViewModel
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .gray
        tableView.register(RepositoriesResultsTableViewCell.self,
                           forCellReuseIdentifier: RepositoriesResultsTableViewCell.reuseIdentifier)
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
    
    init(viewModel: RepositoriesResultViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    deinit { print("RepositoriesResultsViewController deinit called.") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
        setConstraintsTableView()
        setupSubscribers()
    }
}

extension RepositoriesResultsViewController {
    
    func setupNavigationBar() {
        let backButton: UIBarButtonItem = {
            let buttonImage = UIImage(systemName: "arrow.left")
            let button = UIBarButtonItem(image: buttonImage, style: .plain, target: self, action: #selector(backTapped))
            button.tintColor = .black
            return button
        }()
        #warning("print delete")
        navigationController?.navigationBar.isHidden = false
        searchTextField.delegate = self
        searchTextField.addTarget(self, action: #selector(searchDidChange), for: .allEditingEvents)
        navigationItem.setLeftBarButton(backButton, animated: true)
        navigationItem.titleView = searchTextField
        navigationController?.navigationBar.tintColor = .init(red: 0.0, green: 0.0, blue: 0.8, alpha: 1.0)
    }
    
    @objc func backTapped() {
        viewModel.backButtonTapped()
    }
    
    @objc func searchDidChange() {
        if let validText = searchTextField.text,
           validText.count >= 2 {
            viewModel.shouldGetFilteredScreenData = true
            viewModel.showFilteredScreenData(query: validText)
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
    }
}

extension RepositoriesResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.shouldGetFilteredScreenData {
            return viewModel.filteredScreenData.count
        } else {
            return viewModel.screenData.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepositoriesResultsTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        if viewModel.shouldGetFilteredScreenData {
            cell.configure(with: viewModel.filteredScreenData[indexPath.row])
        } else {
            cell.configure(with: viewModel.screenData[indexPath.row])
        }
        return cell
    }
}

extension RepositoriesResultsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension RepositoriesResultsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = searchTextField.text, text.isEmpty {
            viewModel.shouldGetFilteredScreenData = false
            viewModel.updateUISubject.send(true)
        }
        textField.resignFirstResponder()
        return true
    }
}

extension RepositoriesResultsViewController {
    //MARK: CONSTRAINTS BELOW
    func setConstraintsTableView() {
        tableView.snp.makeConstraints { (make) in make.edges.equalTo(view.safeAreaLayoutGuide) }
    }
}
