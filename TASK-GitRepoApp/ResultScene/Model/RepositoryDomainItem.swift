//
//  RepositoryDomainItem.swift
//  TASK-GitRepoApp
//
//  Created by Tomislav Gelesic on 02.03.2021..
//

import Foundation

struct RepositoryDomainItem {
    
    var repositoryName: String
    var authorName: String
    var description: String
    var isRepositoryPrivate: Bool
    var watchAmount: Int
    var starAmount: Int
    var issueAmount: Int
    
    
    init(repositoryName: String = "", authorName: String = "", description: String = "", isRepositoryPrivate: Bool = false, watchAmount: Int = 0, starAmount: Int = 0, issueAmount: Int = 0) {
        self.repositoryName = repositoryName
        self.authorName = authorName
        self.description = description
        self.isRepositoryPrivate = isRepositoryPrivate
        self.watchAmount = watchAmount
        self.starAmount = starAmount
        self.issueAmount = issueAmount
    }
}
