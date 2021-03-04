
import Foundation
import Combine
import Alamofire

class RepositoriesResultRepositoryImpl: ResultRepository {
    func fetch<T: Codable>(matching query: String) -> AnyPublisher<Result<T, AFError>, Never> {
        var url = String()
        url.append(Constants.GITHUB_BASE)
        url.append(Constants.SEARCH_REPOSITORIES)
        url.append(query)
        return RestManager.requestObservable(url: url)
    }
}
