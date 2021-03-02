//
//  UsersResultsViewController.swift
//  TASK-GitRepoApp
//
//  Created by Tomislav Gelesic on 01.03.2021..
//

import UIKit

class UsersResultsViewController: UIViewController {

    var viewModel: UsersResultViewModel
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .gray
        tableView.register(UsersResultTableViewCell.self,
                           forCellReuseIdentifier: UsersResultTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    init(viewModel: UsersResultViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraintsTableView()
    }

}

extension UsersResultsViewController {
    
    func setupViews() {
        view.backgroundColor = .gray
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
}

extension UsersResultsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return viewModel.screenData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UsersResultTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: viewModel.screenData[indexPath.row])
        return cell
    }
    
    
}

extension UsersResultsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


extension UsersResultsViewController {
    //MARK: CONSTRAINTS BELOW
    
    
    func setConstraintsTableView() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
