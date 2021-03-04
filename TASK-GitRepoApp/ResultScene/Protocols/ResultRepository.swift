//
//  ResultRepository.swift
//  TASK-GitRepoApp
//
//  Created by Tomislav Gelesic on 04.03.2021..
//

import Foundation
import Combine
import Alamofire

protocol ResultRepository {
    func fetch<T: Codable>(matching query: String) -> AnyPublisher<Result<T, AFError>, Never>
}
