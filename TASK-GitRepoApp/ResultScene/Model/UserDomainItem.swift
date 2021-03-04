//
//  UserDomainItem.swift
//  TASK-GitRepoApp
//
//  Created by Tomislav Gelesic on 02.03.2021..
//

import Foundation

struct UserDomainItem {

    var authorName: String
    var avatarPath: String
    var webPagePath: String

    init(authorName: String = "", avatarPath: String = "", webPagePath: String = "") {
        self.authorName = authorName
        self.avatarPath = avatarPath
        self.webPagePath = webPagePath
    }
    
    init(_ item: UserResponseItem) {        
        self.authorName = item.login
        self.avatarPath = item.avatarUrl
        self.webPagePath = item.htmlUrl
    }
}

