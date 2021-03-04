
import UIKit
import Combine

class RepositoriesResultViewModel {
    
    var updateUISubject = CurrentValueSubject<Bool, Never>(true)
    var coordinatorDelegate: CoordinatorDelegate?
    var shouldGetFilteredScreenData: Bool = false
    var filteredScreenData: [RepositoryDomainItem] = .init()
    var screenData: [RepositoryDomainItem] = [
        RepositoryDomainItem(repositoryName: "repository 1",
                             authorName: "author 1",
                             description: "blalbablablablablablablbablablablbalbbalblablalbalblalbalblablblbaalbalblalbalblblablbalbalblalbalblalblabl",
                             isRepositoryPrivate: false,
                             watchAmount: 10,
                             starAmount: 10,
                             issueAmount: 10),
        RepositoryDomainItem(repositoryName: "repository 2",
                             authorName: "author 2",
                             description: "blalbablablablablablablbablablablbalbbalblablalbalblalbalblablblbaalbalblalbalblblablbalbalblalbalblalblabl",
                             isRepositoryPrivate: true,
                             watchAmount: 100,
                             starAmount: 10000,
                             issueAmount: 100),
        RepositoryDomainItem(repositoryName: "repository 3",
                             authorName: "author 3",
                             description: "blalbablablablablablablbablablablbalbbalblablalbalblalbalblablblbaalbalblalbalblblablbalbalblalbalblalblabl",
                             isRepositoryPrivate: false,
                             watchAmount: 1,
                             starAmount: 1,
                             issueAmount: 1),
        RepositoryDomainItem(repositoryName: "repository 4",
                             authorName: "author 4",
                             description: "blalbablablablablablablbablablablbalbbalblablalbalblalbalblablblbaalbalblalbalblblablbalbalblalbalblalblabl",
                             isRepositoryPrivate: false,
                             watchAmount: 10,
                             starAmount: 10,
                             issueAmount: 10),
        RepositoryDomainItem(repositoryName: "repository 5",
                             authorName: "author 5",
                             description: "blalbablablablablablablbablablablbalbbalblablalbalblalbalblablblbaalbalblalbalblblablbalbalblalbalblalblabl",
                             isRepositoryPrivate: true,
                             watchAmount: 100,
                             starAmount: 10000,
                             issueAmount: 100),
        RepositoryDomainItem(repositoryName: "repository 6",
                             authorName: "author 6",
                             description: "blalbablablablablablablbablablablbalbbalblablalbalblalbalblablblbaalbalblalbalblblablbalbalblalbalblalblabl",
                             isRepositoryPrivate: false,
                             watchAmount: 1,
                             starAmount: 1,
                             issueAmount: 1)
    ]   
    
    deinit { print("RepositoriesResultViewModel deinit called.") }
    
    func showFilteredScreenData(query: String) {
        filteredScreenData = screenData.filter { $0.repositoryName.contains(query) ? true : false }
        updateUISubject.send(true)
    }
    
    func backButtonTapped() {
        coordinatorDelegate?.viewControllerHasFinished(goTo: .searchScene)
    }
}
