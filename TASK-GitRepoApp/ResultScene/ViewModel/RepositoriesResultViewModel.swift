
import UIKit
import Combine

class RepositoriesResultViewModel {
    
    weak var viewControllerDelegate: RepositoriesResultsViewController?
    var coordinator: CoordinatorDelegate?
    var screenData = [RepositoryDomainItem]()
    var repository: RepositoriesResultRepositoryImpl
    let spinnerSubject = PassthroughSubject<Bool, Never>()
    let alertSubject = PassthroughSubject<String, Never>()
    let searchSubject: CurrentValueSubject<String, Never>
    let updateUISubject = PassthroughSubject<Void, Never>()
    
    init(query: String, repository: RepositoriesResultRepositoryImpl) {
        self.repository = repository
        self.searchSubject = CurrentValueSubject<String, Never>(query)
    }
    deinit { print("RepositoriesResultViewModel deinit called.") }
    
    func initializeSearchSubject(subject: AnyPublisher<String, Never>) -> AnyCancellable {
        return subject
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.global())
            .removeDuplicates()
            .flatMap({ [unowned self] (query) -> AnyPublisher<Result<RepositoryResponse, RestManagerError>, Never> in
                return repository.fetch(matching: query)
            })
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [unowned self] (result) in
                switch result {
                case .success(let response):
                    self.screenData = response.items.map{RepositoryDomainItem($0)}
                    if self.screenData.isEmpty { self.viewControllerDelegate?.showEmptyTableViewBackgroundLabel(true) }
                    else { self.viewControllerDelegate?.showEmptyTableViewBackgroundLabel(false) }
                    self.updateUISubject.send()
                case .failure(let error):
                    print(error)
                    self.spinnerSubject.send(false)
                    self.alertSubject.send("Couldn't access server to get data.")
                }
            })
    }
    
    func searchInputChanged(_ query: String?) {
        if let validQuery = query,
           validQuery.count >= 2 {
            viewControllerDelegate?.showSpinner()
            searchSubject.send(validQuery)
        }
    }
    
    func buttonTapped(_ type: ResultButtonType) {
        switch type {
        case .openInBrowser(position: let position):
            openUrlInBrowser(screenData[position].webPagePath)
        case .showDetails(position: let position):
            coordinator?.goToDetailScreen(DetailsDomainItem(screenData[position]))
        }
    }
    
    func openUrlInBrowser(_ urlString: String) {
        if let url = URL(string: urlString),
           UIApplication.shared.canOpenURL(url) { UIApplication.shared.open(url, options: [:], completionHandler: nil) }
        else { print("Couldn't open URL: '' \(urlString) '' in browser") }
    }
}
