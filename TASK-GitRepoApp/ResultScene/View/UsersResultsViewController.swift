
import UIKit
import Combine

class UsersResultsViewController: UIViewController {
    
    var disposeBag = Set<AnyCancellable>()
    var viewModel: UsersResultViewModel
    let tableView: UITableView = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Search match not found.."
        label.textColor = .init(red: 0.0, green: 0.0, blue: 0.8, alpha: 1.0)
        let tableView = UITableView()
        tableView.backgroundView = label
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.register(UsersResultTableViewCell.self, forCellReuseIdentifier: UsersResultTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    init(viewModel: UsersResultViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    deinit { print("UsersResultsViewController deinit called.") }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraintsTableView()
        setupSubscribers()
        showSpinner()
        viewModel.searchSubject.send(viewModel.searchQuery)
    }

}

extension UsersResultsViewController {
    
    func setupViews() {
        viewModel.viewControllerDelegate = self
        view.backgroundColor = .gray
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func showEmptyTableViewBackgroundLabel(_ shouldShow: Bool) {
        if shouldShow { tableView.backgroundView?.isHidden = false }
        else { tableView.backgroundView?.isHidden = true }
    }
    
    func setupSubscribers() {
        viewModel.updateUISubject
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: RunLoop.main)
            .sink { [unowned self] (_) in
                self.tableView.reloadData()
                self.hideSpinner()
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
        viewModel.screenData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UsersResultTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: viewModel.screenData[indexPath.row])
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

extension UsersResultsViewController {
    //MARK: CONSTRAINTS BELOW
    
    func setConstraintsTableView() { tableView.snp.makeConstraints { (make) in make.edges.equalTo(view.safeAreaLayoutGuide) }}
}
