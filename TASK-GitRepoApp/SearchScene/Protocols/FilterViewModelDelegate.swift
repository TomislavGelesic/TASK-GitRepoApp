//
//  FilterViewModelDelegate.swift
//  TASK-GitRepoApp
//
//  Created by Tomislav Gelesic on 02.03.2021..
//

import Foundation

protocol FilterViewModelDelegate {
    func updateFilterSelection(_ selectedOptions: [FilterOption])
}
