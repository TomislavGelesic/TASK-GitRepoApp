
import Foundation
import Combine

protocol ResultRepository {
    func fetch<T: Codable>(matching query: String) -> AnyPublisher<Result<T, RestManagerError>, Never>
}
