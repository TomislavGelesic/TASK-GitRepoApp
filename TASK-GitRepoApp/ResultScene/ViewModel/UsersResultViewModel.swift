
import UIKit
import Combine
import Alamofire

class UsersResultViewModel {
    
    var coordinatorDelegate: CoordinatorDelegate?
    var shouldGetFilteredScreenData: Bool = false
    var filteredScreenData: [UserDomainItem] = .init()
    var screenData = [UserDomainItem]()
    var searchQuery: String
    var repository: UserResultRepositoryImpl
    let spinnerSubject = PassthroughSubject<Bool, Never>()
    let alertSubject = PassthroughSubject<String, Never>()
    let searchSubject = PassthroughSubject<String, Never>()
    let updateUISubject = PassthroughSubject<Void, Never>()
    
    init(query: String, repository: UserResultRepositoryImpl) {
        self.repository = repository
        self.searchQuery = query
    }
    deinit { print("UsersResultViewModel deinit called.") }
    
    func showFilteredScreenData(query: String) {
        filteredScreenData = screenData.filter { $0.authorName.contains(query) ? true : false }
        self.updateUISubject.send()
    }
    
    func initializeSearchSubject(subject: AnyPublisher<String, Never>) -> AnyCancellable {
        
        return subject
            .flatMap({ [unowned self] (query) -> AnyPublisher<Result<UserResponse, RestManagerError>, Never> in
                return repository.fetch(matching: query)
            })
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [unowned self] (result) in
                switch result {
                case .success(let response):
                    self.screenData = response.items.map{ UserDomainItem($0)}
                    self.updateUISubject.send()
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
    
    func openUrlInBrowser(_ userWebPagePath: String) {
        if let url = URL(string: "\(userWebPagePath)?tab=repositories"),
           UIApplication.shared.canOpenURL(url) { UIApplication.shared.open(url, options: [:], completionHandler: nil) }
        else { print("Couldn't open URL: '' \(userWebPagePath)?tab=repositories '' in browser") }
    }
}
