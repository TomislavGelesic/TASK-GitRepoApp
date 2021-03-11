
@testable import TASK_GitRepoApp
import Quick
import Nimble
import Cuckoo
import Combine

class RepositoriesResultSceneInitializationUnitTests: QuickSpec {
    
    func getLocalResource<T: Codable>(_ fileName: String) -> T? {
        let bundle = Bundle.init(for: RepositoriesResultSceneInitializationUnitTests.self)
        guard let resourcePath = bundle.url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: resourcePath),
              let parsedData: T = SerializationManager.parseData(jsonData: data)
        else { return nil }
        return parsedData
    }
    
    override func spec() {
        var disposeBag = Set<AnyCancellable>()
        let mock = MockRepositoriesResultRepositoryImpl()
        var sut: RepositoriesResultViewModel!
        var alertCalled = false
        
        describe("UNIT-TEST RepositoriesRepository") {
            context("Good screen data initialize success screen") {
                beforeEach {
                    sut = RepositoriesResultViewModel(query: "", repository: mock)
                    sut.initializeSearchSubject(subject: sut.searchSubject.eraseToAnyPublisher())
                        .store(in: &disposeBag)
                    stub(mock) { [unowned self] stub in
                        if let data: RepositoryResponse = self.getLocalResource("RepositoriesResponseJSON") {
                            let publisher = Just(Result<RepositoryResponse, RestManagerError>.success(data)).eraseToAnyPublisher()
                            when(stub).fetch(matching: any()).thenReturn(publisher)
                        }
                    }
                }
                it("Success screen initialized.") {
                    
                    sut.searchSubject.send(sut.searchQuery)
                    expect(sut.screenData.count).toEventually(equal(5))
                }
            }
            
            context("Bad screen data initialize fail screen.") {
                beforeEach {
                    sut = RepositoriesResultViewModel(query: "", repository: mock)
                    sut.initializeSearchSubject(subject: sut.searchSubject.eraseToAnyPublisher())
                        .store(in: &disposeBag)
                
                    sut.alertSubject
                        .subscribe(on: DispatchQueue.global(qos: .background))
                        .sink { (_) in alertCalled = true }
                        .store(in: &disposeBag)
                    stub(mock) { stub in
                        let publisher = Just(Result<RepositoryResponse, RestManagerError>.failure(.decodingError)).eraseToAnyPublisher()
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

