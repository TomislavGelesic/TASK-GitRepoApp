// MARK: - Mocks generated from file: TASK-GitRepoApp/ResultScene/Coordinators/ResultSceneCoordinator.swift at 2021-03-10 14:40:28 +0000


import Cuckoo
@testable import TASK_GitRepoApp

import UIKit


 class MockResultSceneCoordinator: ResultSceneCoordinator, Cuckoo.ClassMock {
    
     typealias MocksType = ResultSceneCoordinator
    
     typealias Stubbing = __StubbingProxy_ResultSceneCoordinator
     typealias Verification = __VerificationProxy_ResultSceneCoordinator

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: ResultSceneCoordinator?

     func enableDefaultImplementation(_ stub: ResultSceneCoordinator) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var coordinatorDelegate: AppCoordinator? {
        get {
            return cuckoo_manager.getter("coordinatorDelegate",
                superclassCall:
                    
                    super.coordinatorDelegate
                    ,
                defaultCall: __defaultImplStub!.coordinatorDelegate)
        }
        
        set {
            cuckoo_manager.setter("coordinatorDelegate",
                value: newValue,
                superclassCall:
                    
                    super.coordinatorDelegate = newValue
                    ,
                defaultCall: __defaultImplStub!.coordinatorDelegate = newValue)
        }
        
    }
    
    
    
     override var childCoordinators: [Coordinator] {
        get {
            return cuckoo_manager.getter("childCoordinators",
                superclassCall:
                    
                    super.childCoordinators
                    ,
                defaultCall: __defaultImplStub!.childCoordinators)
        }
        
        set {
            cuckoo_manager.setter("childCoordinators",
                value: newValue,
                superclassCall:
                    
                    super.childCoordinators = newValue
                    ,
                defaultCall: __defaultImplStub!.childCoordinators = newValue)
        }
        
    }
    
    
    
     override var navigationController: UINavigationController {
        get {
            return cuckoo_manager.getter("navigationController",
                superclassCall:
                    
                    super.navigationController
                    ,
                defaultCall: __defaultImplStub!.navigationController)
        }
        
        set {
            cuckoo_manager.setter("navigationController",
                value: newValue,
                superclassCall:
                    
                    super.navigationController = newValue
                    ,
                defaultCall: __defaultImplStub!.navigationController = newValue)
        }
        
    }
    

    

    
    
    
     override func start()  {
        
    return cuckoo_manager.call("start()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.start()
                ,
            defaultCall: __defaultImplStub!.start())
        
    }
    
    
    
     override func start(_ option: ResultSceneOption)  {
        
    return cuckoo_manager.call("start(_: ResultSceneOption)",
            parameters: (option),
            escapingParameters: (option),
            superclassCall:
                
                super.start(option)
                ,
            defaultCall: __defaultImplStub!.start(option))
        
    }
    
    
    
     override func goToSearchScene()  {
        
    return cuckoo_manager.call("goToSearchScene()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.goToSearchScene()
                ,
            defaultCall: __defaultImplStub!.goToSearchScene())
        
    }
    
    
    
     override func goToResultScene(_ option: ResultSceneOption)  {
        
    return cuckoo_manager.call("goToResultScene(_: ResultSceneOption)",
            parameters: (option),
            escapingParameters: (option),
            superclassCall:
                
                super.goToResultScene(option)
                ,
            defaultCall: __defaultImplStub!.goToResultScene(option))
        
    }
    
    
    
     override func goToDetailScreen(_ info: DetailsDomainItem)  {
        
    return cuckoo_manager.call("goToDetailScreen(_: DetailsDomainItem)",
            parameters: (info),
            escapingParameters: (info),
            superclassCall:
                
                super.goToDetailScreen(info)
                ,
            defaultCall: __defaultImplStub!.goToDetailScreen(info))
        
    }
    

	 struct __StubbingProxy_ResultSceneCoordinator: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var coordinatorDelegate: Cuckoo.ClassToBeStubbedOptionalProperty<MockResultSceneCoordinator, AppCoordinator> {
	        return .init(manager: cuckoo_manager, name: "coordinatorDelegate")
	    }
	    
	    
	    var childCoordinators: Cuckoo.ClassToBeStubbedProperty<MockResultSceneCoordinator, [Coordinator]> {
	        return .init(manager: cuckoo_manager, name: "childCoordinators")
	    }
	    
	    
	    var navigationController: Cuckoo.ClassToBeStubbedProperty<MockResultSceneCoordinator, UINavigationController> {
	        return .init(manager: cuckoo_manager, name: "navigationController")
	    }
	    
	    
	    func start() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockResultSceneCoordinator.self, method: "start()", parameterMatchers: matchers))
	    }
	    
	    func start<M1: Cuckoo.Matchable>(_ option: M1) -> Cuckoo.ClassStubNoReturnFunction<(ResultSceneOption)> where M1.MatchedType == ResultSceneOption {
	        let matchers: [Cuckoo.ParameterMatcher<(ResultSceneOption)>] = [wrap(matchable: option) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockResultSceneCoordinator.self, method: "start(_: ResultSceneOption)", parameterMatchers: matchers))
	    }
	    
	    func goToSearchScene() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockResultSceneCoordinator.self, method: "goToSearchScene()", parameterMatchers: matchers))
	    }
	    
	    func goToResultScene<M1: Cuckoo.Matchable>(_ option: M1) -> Cuckoo.ClassStubNoReturnFunction<(ResultSceneOption)> where M1.MatchedType == ResultSceneOption {
	        let matchers: [Cuckoo.ParameterMatcher<(ResultSceneOption)>] = [wrap(matchable: option) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockResultSceneCoordinator.self, method: "goToResultScene(_: ResultSceneOption)", parameterMatchers: matchers))
	    }
	    
	    func goToDetailScreen<M1: Cuckoo.Matchable>(_ info: M1) -> Cuckoo.ClassStubNoReturnFunction<(DetailsDomainItem)> where M1.MatchedType == DetailsDomainItem {
	        let matchers: [Cuckoo.ParameterMatcher<(DetailsDomainItem)>] = [wrap(matchable: info) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockResultSceneCoordinator.self, method: "goToDetailScreen(_: DetailsDomainItem)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_ResultSceneCoordinator: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var coordinatorDelegate: Cuckoo.VerifyOptionalProperty<AppCoordinator> {
	        return .init(manager: cuckoo_manager, name: "coordinatorDelegate", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var childCoordinators: Cuckoo.VerifyProperty<[Coordinator]> {
	        return .init(manager: cuckoo_manager, name: "childCoordinators", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var navigationController: Cuckoo.VerifyProperty<UINavigationController> {
	        return .init(manager: cuckoo_manager, name: "navigationController", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func start() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("start()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func start<M1: Cuckoo.Matchable>(_ option: M1) -> Cuckoo.__DoNotUse<(ResultSceneOption), Void> where M1.MatchedType == ResultSceneOption {
	        let matchers: [Cuckoo.ParameterMatcher<(ResultSceneOption)>] = [wrap(matchable: option) { $0 }]
	        return cuckoo_manager.verify("start(_: ResultSceneOption)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func goToSearchScene() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("goToSearchScene()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func goToResultScene<M1: Cuckoo.Matchable>(_ option: M1) -> Cuckoo.__DoNotUse<(ResultSceneOption), Void> where M1.MatchedType == ResultSceneOption {
	        let matchers: [Cuckoo.ParameterMatcher<(ResultSceneOption)>] = [wrap(matchable: option) { $0 }]
	        return cuckoo_manager.verify("goToResultScene(_: ResultSceneOption)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func goToDetailScreen<M1: Cuckoo.Matchable>(_ info: M1) -> Cuckoo.__DoNotUse<(DetailsDomainItem), Void> where M1.MatchedType == DetailsDomainItem {
	        let matchers: [Cuckoo.ParameterMatcher<(DetailsDomainItem)>] = [wrap(matchable: info) { $0 }]
	        return cuckoo_manager.verify("goToDetailScreen(_: DetailsDomainItem)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class ResultSceneCoordinatorStub: ResultSceneCoordinator {
    
    
     override var coordinatorDelegate: AppCoordinator? {
        get {
            return DefaultValueRegistry.defaultValue(for: (AppCoordinator?).self)
        }
        
        set { }
        
    }
    
    
     override var childCoordinators: [Coordinator] {
        get {
            return DefaultValueRegistry.defaultValue(for: ([Coordinator]).self)
        }
        
        set { }
        
    }
    
    
     override var navigationController: UINavigationController {
        get {
            return DefaultValueRegistry.defaultValue(for: (UINavigationController).self)
        }
        
        set { }
        
    }
    

    

    
     override func start()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func start(_ option: ResultSceneOption)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func goToSearchScene()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func goToResultScene(_ option: ResultSceneOption)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func goToDetailScreen(_ info: DetailsDomainItem)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: TASK-GitRepoApp/ResultScene/Model/RepositoriesResultRepositoryImpl.swift at 2021-03-10 14:40:28 +0000


import Cuckoo
@testable import TASK_GitRepoApp

import Combine
import Foundation


 class MockRepositoriesResultRepositoryImpl: RepositoriesResultRepositoryImpl, Cuckoo.ClassMock {
    
     typealias MocksType = RepositoriesResultRepositoryImpl
    
     typealias Stubbing = __StubbingProxy_RepositoriesResultRepositoryImpl
     typealias Verification = __VerificationProxy_RepositoriesResultRepositoryImpl

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: RepositoriesResultRepositoryImpl?

     func enableDefaultImplementation(_ stub: RepositoriesResultRepositoryImpl) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func fetch<T: Codable>(matching query: String) -> AnyPublisher<Result<T, RestManagerError>, Never> {
        
    return cuckoo_manager.call("fetch(matching: String) -> AnyPublisher<Result<T, RestManagerError>, Never>",
            parameters: (query),
            escapingParameters: (query),
            superclassCall:
                
                super.fetch(matching: query)
                ,
            defaultCall: __defaultImplStub!.fetch(matching: query))
        
    }
    

	 struct __StubbingProxy_RepositoriesResultRepositoryImpl: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func fetch<M1: Cuckoo.Matchable, T: Codable>(matching query: M1) -> Cuckoo.ClassStubFunction<(String), AnyPublisher<Result<T, RestManagerError>, Never>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: query) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockRepositoriesResultRepositoryImpl.self, method: "fetch(matching: String) -> AnyPublisher<Result<T, RestManagerError>, Never>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_RepositoriesResultRepositoryImpl: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func fetch<M1: Cuckoo.Matchable, T: Codable>(matching query: M1) -> Cuckoo.__DoNotUse<(String), AnyPublisher<Result<T, RestManagerError>, Never>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: query) { $0 }]
	        return cuckoo_manager.verify("fetch(matching: String) -> AnyPublisher<Result<T, RestManagerError>, Never>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class RepositoriesResultRepositoryImplStub: RepositoriesResultRepositoryImpl {
    

    

    
     override func fetch<T: Codable>(matching query: String) -> AnyPublisher<Result<T, RestManagerError>, Never>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<Result<T, RestManagerError>, Never>).self)
    }
    
}


// MARK: - Mocks generated from file: TASK-GitRepoApp/ResultScene/Model/UserResultRepositoryImpl.swift at 2021-03-10 14:40:28 +0000


import Cuckoo
@testable import TASK_GitRepoApp

import Alamofire
import Combine
import Foundation


 class MockUserResultRepositoryImpl: UserResultRepositoryImpl, Cuckoo.ClassMock {
    
     typealias MocksType = UserResultRepositoryImpl
    
     typealias Stubbing = __StubbingProxy_UserResultRepositoryImpl
     typealias Verification = __VerificationProxy_UserResultRepositoryImpl

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: UserResultRepositoryImpl?

     func enableDefaultImplementation(_ stub: UserResultRepositoryImpl) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func fetch<T: Codable>(matching query: String) -> AnyPublisher<Result<T, RestManagerError>, Never> {
        
    return cuckoo_manager.call("fetch(matching: String) -> AnyPublisher<Result<T, RestManagerError>, Never>",
            parameters: (query),
            escapingParameters: (query),
            superclassCall:
                
                super.fetch(matching: query)
                ,
            defaultCall: __defaultImplStub!.fetch(matching: query))
        
    }
    

	 struct __StubbingProxy_UserResultRepositoryImpl: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func fetch<M1: Cuckoo.Matchable, T: Codable>(matching query: M1) -> Cuckoo.ClassStubFunction<(String), AnyPublisher<Result<T, RestManagerError>, Never>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: query) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockUserResultRepositoryImpl.self, method: "fetch(matching: String) -> AnyPublisher<Result<T, RestManagerError>, Never>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_UserResultRepositoryImpl: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func fetch<M1: Cuckoo.Matchable, T: Codable>(matching query: M1) -> Cuckoo.__DoNotUse<(String), AnyPublisher<Result<T, RestManagerError>, Never>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: query) { $0 }]
	        return cuckoo_manager.verify("fetch(matching: String) -> AnyPublisher<Result<T, RestManagerError>, Never>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class UserResultRepositoryImplStub: UserResultRepositoryImpl {
    

    

    
     override func fetch<T: Codable>(matching query: String) -> AnyPublisher<Result<T, RestManagerError>, Never>  {
        return DefaultValueRegistry.defaultValue(for: (AnyPublisher<Result<T, RestManagerError>, Never>).self)
    }
    
}

