//
//  UserViewModelTests.swift
//  TASK-GitRepoAppTests
//
//  Created by Tomislav Gelesic on 05.03.2021..
//

@testable import TASK_GitRepoApp
import Quick
import Nimble
import Cuckoo
import Combine

class ResultSceneTests: QuickSpec {
    
    func getLocalResource<T: Codable>(_ fileName: String) -> T? {
        let bundle = Bundle.init(for: ResultSceneTests.self)
        guard let resourcePath = bundle.url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: resourcePath),
              let parsedData: T = SerializationManager.parseData(jsonData: data)
        else { return nil }
        return parsedData
    }
    
    override func spec() {
        var disposeBag = Set<AnyCancellable>()
        let userRepositoryMock = MockUserResultRepositoryImpl()
        let repositoriesRepositoryMock = MockRepositoriesResultRepositoryImpl()
        var usersViewModel: UsersResultViewModel!
        var repositoriesViewModel: RepositoriesResultViewModel!
        let coordinator = MockResultSceneCoordinator(navigationController: UINavigationController())
        
        describe("UNIT-TEST UserRepository") {
            context("Good screen data initialize success screen") {
                it("Success screen initialized.") {
                    let expected: String = "TechnologyClassroom"
                    stub(userRepositoryMock) { [unowned self] stub in
                        if let data: UserResponse = self.getLocalResource("UserResponseJSON") {
                            let publisher = Just(Result<UserResponse, RestManagerError>.success(data)).eraseToAnyPublisher()
                            when(stub).fetch(matching: any()).thenReturn(publisher)
                        }
                    }
                    usersViewModel = UsersResultViewModel(query: "", repository: userRepositoryMock)
                    usersViewModel.initializeSearchSubject(subject: usersViewModel.searchSubject.eraseToAnyPublisher()).store(in: &disposeBag)
                    usersViewModel.searchSubject.send("")
                    expect(usersViewModel.screenData[1].authorName).toEventually(equal(expected))
                }
            }
            
            context("Bad screen data initialize fail screen.") {
                it("Fail screen initialized.") {
                    let expected = true
                    var alertCalled = false
                    stub(userRepositoryMock) { stub in
                        let publisher = Just(Result<UserResponse, RestManagerError>.failure(.decodingError)).eraseToAnyPublisher()
                        when(stub).fetch(matching: any()).thenReturn(publisher)
                    }
                    usersViewModel.initializeSearchSubject(subject: usersViewModel.searchSubject.eraseToAnyPublisher())
                        .store(in: &disposeBag)
                    usersViewModel.alertSubject
                        .subscribe(on: DispatchQueue.global(qos: .background))
                        .receive(on: RunLoop.main)
                        .sink { (_) in alertCalled = true }
                        .store(in: &disposeBag)
                    usersViewModel.searchSubject.send("")
                    expect(alertCalled).toEventually(equal(expected))
                }
            }
        }
        
        describe("UNIT-TEST RepositoriesRepository") {
            context("Good screen data initialize success screen") {
                it("Success screen initialized.") {
                    let expected: String = "tomcat"
                    stub(repositoriesRepositoryMock) { [unowned self] stub in
                        if let data: RepositoryResponse = self.getLocalResource("RepositoriesResponseJSON") {
                            let publisher = Just(Result<RepositoryResponse, RestManagerError>.success(data)).eraseToAnyPublisher()
                            when(stub).fetch(matching: any()).thenReturn(publisher)
                        }
                    }
                    repositoriesViewModel = RepositoriesResultViewModel(query: "", repository: repositoriesRepositoryMock)
                    repositoriesViewModel.initializeSearchSubject(subject: repositoriesViewModel.searchSubject.eraseToAnyPublisher())
                        .store(in: &disposeBag)
                    repositoriesViewModel.searchSubject.send("")
                    expect(repositoriesViewModel.screenData[1].repositoryName).toEventually(equal(expected))
                }
            }
            
            context("Bad screen data initialize fail screen.") {
                it("Fail screen initialized.") {
                    let expected = true
                    var alertCalled = false
                    stub(repositoriesRepositoryMock) { stub in
                        let publisher = Just(Result<RepositoryResponse, RestManagerError>.failure(.decodingError)).eraseToAnyPublisher()
                        when(stub).fetch(matching: any()).thenReturn(publisher)
                    }
                    repositoriesViewModel.initializeSearchSubject(subject: repositoriesViewModel.searchSubject.eraseToAnyPublisher())
                        .store(in: &disposeBag)
                    repositoriesViewModel.alertSubject
                        .subscribe(on: DispatchQueue.global(qos: .background))
                        .receive(on: RunLoop.main)
                        .sink { (_) in alertCalled = true }
                        .store(in: &disposeBag)
                    repositoriesViewModel.searchSubject.send("")
                    expect(alertCalled).toEventually(equal(expected))
                }
            }
        }
        
        describe("UNIT-TEST Coordinator") {
            context("Back button tap call coordinator delegate.") {
                it("Coordinator delegate called.") {
                    stub(coordinator) { (stub) in
                        when(stub).viewControllerHasFinished(goTo: any()).thenDoNothing()
                    }
                    usersViewModel = UsersResultViewModel(query: "", repository: userRepositoryMock)
                    usersViewModel.coordinatorDelegate = coordinator
                    verify(coordinator).viewControllerHasFinished(goTo: any())
                }
            }
        }
    }
}
