
import Foundation
import Combine

class RepositoriesResultRepositoryImpl: ResultRepository {
    func fetch<T: Codable>(matching query: String) -> AnyPublisher<Result<T, RestManagerError>, Never> {
        var url = String()
        url.append(Constants.GITHUB_BASE)
        url.append(Constants.SEARCH_REPOSITORIES)
        url.append(query)
        return RestManager.requestObservable(url: url)
    }
}
