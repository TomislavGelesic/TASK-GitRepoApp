//
//  ResultSceneOption.swift
//  TASK-GitRepoApp
//
//  Created by Tomislav Gelesic on 02.03.2021..
//

import Foundation

enum ResultSceneOption {
    case users (search: String)
    case repositories (search: String)
    case usersAndRepositories (search: String)
}
