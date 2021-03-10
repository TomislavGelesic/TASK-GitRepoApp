
@testable import TASK_GitRepoApp
import Quick
import Nimble
import Cuckoo
import Combine

class ResultSceneCoordinatorUnitTests: QuickSpec {
    
    func getLocalResource<T: Codable>(_ fileName: String) -> T? {
        let bundle = Bundle.init(for: ResultSceneCoordinatorUnitTests.self)
        guard let resourcePath = bundle.url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: resourcePath),
              let parsedData: T = SerializationManager.parseData(jsonData: data)
        else { return nil }
        return parsedData
    }
    
    override func spec() {
        var disposeBag = Set<AnyCancellable>()
        let userRepositoryMock = MockUserResultRepositoryImpl()
        var usersViewModel: UsersResultViewModel!
        let coordinator = MockResultSceneCoordinator(navigationController: UINavigationController())
        
        describe("UNIT-TEST Coordinator") {
//            context(" button tap call coordinator delegate.") {
//                it("Coordinator delegate called.") {
//                    stub(coordinator) { (stub) in
//                        when()
//                    }
//                    usersViewModel = UsersResultViewModel(query: "", repository: userRepositoryMock)
//                    usersViewModel.coordinator = coordinator
//                    usersViewModel.buttonTapped(.)
//                    verify(coordinator).viewControllerHasFinished(goTo: any())
//                }
//            }
        }
    }
}

