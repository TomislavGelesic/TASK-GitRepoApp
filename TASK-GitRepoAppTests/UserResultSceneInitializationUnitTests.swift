

@testable import TASK_GitRepoApp
import Quick
import Nimble
import Cuckoo
import Combine

class UserResultSceneInitializationUnitTests: QuickSpec {
    
    func getLocalResource<T: Codable>(_ fileName: String) -> T? {
        let bundle = Bundle.init(for: UserResultSceneInitializationUnitTests.self)
        guard let resourcePath = bundle.url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: resourcePath),
              let parsedData: T = SerializationManager.parseData(jsonData: data)
        else { return nil }
        return parsedData
    }
    
    override func spec() {
        var disposeBag = Set<AnyCancellable>()
        let mock = MockUserResultRepositoryImpl()
        var sut: UsersResultViewModel!
        var alertCalled = false
        
        describe("UNIT-TEST UserResultSceneInitialization") {
            context("Good screen data initialize success screen") {
                beforeEach {
                    sut = UsersResultViewModel(query: "", repository: mock)
                    sut.initializeSearchSubject(subject: sut.searchSubject.eraseToAnyPublisher())
                        .store(in: &disposeBag)
                    stub(mock) { [unowned self] stub in
                        if let data: UserResponse = self.getLocalResource("UserResponseJSON") {
                            let publisher = Just(Result<UserResponse, RestManagerError>.success(data)).eraseToAnyPublisher()
                            when(stub).fetch(matching: any()).thenReturn(publisher)
                        }
                    }
                }
                it("Success screen initialized.") {
                    
                    sut.searchSubject.send("")
                    expect(sut.screenData.count).toEventually(equal(5))
                }
            }

            context("Bad screen data initialize fail screen.") {
                beforeEach {
                    sut = UsersResultViewModel(query: "", repository: mock)
                    sut.initializeSearchSubject(subject: sut.searchSubject.eraseToAnyPublisher())
                        .store(in: &disposeBag)
                    sut.alertSubject
                        .subscribe(on: DispatchQueue.global(qos: .background))
                        .receive(on: RunLoop.main)
                        .sink { (_) in alertCalled = true }
                        .store(in: &disposeBag)
                    stub(mock) { stub in
                        let publisher = Just(Result<UserResponse, RestManagerError>.failure(.decodingError)).eraseToAnyPublisher()
                        when(stub).fetch(matching: any()).thenReturn(publisher)
                    }
                }
                it("Fail screen initialized.") {
                    let expected = true
                    sut.searchSubject.send("")
                    expect(alertCalled).toEventually(equal(expected))
                }
            }
        }
    }
}
