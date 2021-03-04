//
//  UserResultViewModel.swift
//  TASK-GitRepoApp
//
//  Created by Tomislav Gelesic on 02.03.2021..
//

import UIKit
import Combine

class UsersResultViewModel {
    
    var updateUISubject = CurrentValueSubject<Bool, Never>(true)
    var coordinatorDelegate: CoordinatorDelegate?
    var shouldGetFilteredScreenData: Bool = false
    var filteredScreenData: [UserDomainItem] = .init()
    var screenData: [UserDomainItem] = [
        UserDomainItem(authorName: "ja", avatarPath: ""),
        UserDomainItem(authorName: "ti", avatarPath: ""),
        UserDomainItem(authorName: "on", avatarPath: ""),        
        UserDomainItem(authorName: "mi", avatarPath: ""),
        UserDomainItem(authorName: "vi", avatarPath: ""),
        UserDomainItem(authorName: "oni", avatarPath: "")
    ]
    
    deinit { print("UsersResultViewModel deinit called.") }
    
    func showFilteredScreenData(query: String) {
        filteredScreenData = screenData.filter { $0.authorName.contains(query) ? true : false }
        updateUISubject.send(true)
    }
    
    func backButtonTapped() {
        coordinatorDelegate?.viewControllerHasFinished(goTo: .searchScene)
    }
}
