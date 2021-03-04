
import UIKit
import Combine
import Alamofire

class RepositoriesResultViewModel {
    
    var coordinatorDelegate: CoordinatorDelegate?
    var shouldGetFilteredScreenData: Bool = false
    var filteredScreenData: [RepositoryDomainItem] = .init()
    var screenData = [RepositoryDomainItem]()
    var repository: RepositoriesResultRepositoryImpl
    var searchQuery: String
    let spinnerSubject = PassthroughSubject<Bool, Never>()
    let alertSubject = PassthroughSubject<String, Never>()
    let searchSubject = CurrentValueSubject<String, Never>("")
    let updateUISubject = PassthroughSubject<Void, Never>()
    
    init(query: String, repository: RepositoriesResultRepositoryImpl) {
        self.repository = repository
        self.searchQuery = query
    }    
    deinit { print("RepositoriesResultViewModel deinit called.") }
    
    func showFilteredScreenData(query: String) {
        filteredScreenData = screenData.filter { $0.repositoryName.contains(query) ? true : false }
        updateUISubject.send()
    }
    
    func initializeSearchSubject(subject: AnyPublisher<String, Never>) -> AnyCancellable {
        
        return subject
            .flatMap({ [unowned self] (query) -> AnyPublisher<Result<RepositoryResponse, AFError>, Never> in
                self.spinnerSubject.send(true)
                return repository.fetch(matching: query)
            })
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [unowned self] (result) in
                switch result {
                case .success(let response):
                    let data = response.items.map{RepositoryDomainItem($0)}
                    self.screenData = data
                    self.updateUISubject.send()
                    self.spinnerSubject.send(false)
                case .failure(let error):
                    print(error)
                    self.spinnerSubject.send(false)
                    self.alertSubject.send("Couldn't access server to get data.")
                }
            })
    }
    
    func buttonTapped(_ type: ResultButtonType) {
        switch type {
        case .back:
            coordinatorDelegate?.viewControllerHasFinished(goTo: .searchScene)
        case .openInBrowser(position: let position):
            openUrlInBrowser(screenData[position].webPagePath)
        case .showDetails(position: let position):
            coordinatorDelegate?.viewControllerHasFinished(goTo: .detailScene(info: DetailsDomainItem(screenData[position])))
        }
    }    
    
    func openUrlInBrowser(_ urlString: String) {
        if let url = URL(string: urlString),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        else { print("Couldn't open URL: '' \(urlString) '' in browser") }
    }
}
