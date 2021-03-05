// MARK: - Mocks generated from file: TASK-GitRepoApp/ResultScene/Coordinators/ResultSceneCoordinator.swift at 2021-03-05 12:24:44 +0000

//
//  ResultSceneCoordinator.swift
//  TASK-GitRepoApp
//
//  Created by Tomislav Gelesic on 02.03.2021..
//

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
    

    
    
    
     override var delegate: AppCoordinator? {
        get {
            return cuckoo_manager.getter("delegate",
                superclassCall:
                    
                    super.delegate
                    ,
                defaultCall: __defaultImplStub!.delegate)
        }
        
        set {
            cuckoo_manager.setter("delegate",
                value: newValue,
                superclassCall:
                    
                    super.delegate = newValue
                    ,
                defaultCall: __defaultImplStub!.delegate = newValue)
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
    
    
    
     override func viewControllerHasFinished(goTo option: SceneOption)  {
        
    return cuckoo_manager.call("viewControllerHasFinished(goTo: SceneOption)",
            parameters: (option),
            escapingParameters: (option),
            superclassCall:
                
                super.viewControllerHasFinished(goTo: option)
                ,
            defaultCall: __defaultImplStub!.viewControllerHasFinished(goTo: option))
        
    }
    

	 struct __StubbingProxy_ResultSceneCoordinator: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var delegate: Cuckoo.ClassToBeStubbedOptionalProperty<MockResultSceneCoordinator, AppCoordinator> {
	        return .init(manager: cuckoo_manager, name: "delegate")
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
	    
	    func viewControllerHasFinished<M1: Cuckoo.Matchable>(goTo option: M1) -> Cuckoo.ClassStubNoReturnFunction<(SceneOption)> where M1.MatchedType == SceneOption {
	        let matchers: [Cuckoo.ParameterMatcher<(SceneOption)>] = [wrap(matchable: option) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockResultSceneCoordinator.self, method: "viewControllerHasFinished(goTo: SceneOption)", parameterMatchers: matchers))
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
	
	    
	    
	    var delegate: Cuckoo.VerifyOptionalProperty<AppCoordinator> {
	        return .init(manager: cuckoo_manager, name: "delegate", callMatcher: callMatcher, sourceLocation: sourceLocation)
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
	    func viewControllerHasFinished<M1: Cuckoo.Matchable>(goTo option: M1) -> Cuckoo.__DoNotUse<(SceneOption), Void> where M1.MatchedType == SceneOption {
	        let matchers: [Cuckoo.ParameterMatcher<(SceneOption)>] = [wrap(matchable: option) { $0 }]
	        return cuckoo_manager.verify("viewControllerHasFinished(goTo: SceneOption)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class ResultSceneCoordinatorStub: ResultSceneCoordinator {
    
    
     override var delegate: AppCoordinator? {
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
    
     override func viewControllerHasFinished(goTo option: SceneOption)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: TASK-GitRepoApp/ResultScene/Model/RepositoriesResultRepositoryImpl.swift at 2021-03-05 12:24:44 +0000


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


// MARK: - Mocks generated from file: TASK-GitRepoApp/ResultScene/Model/UserResultRepositoryImpl.swift at 2021-03-05 12:24:44 +0000


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

