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

    init(authorName: String = "", avatarPath: String = "") {
        self.authorName = authorName
        self.avatarPath = avatarPath
    }
}

