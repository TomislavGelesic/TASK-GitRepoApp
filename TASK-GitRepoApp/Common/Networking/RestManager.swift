import Foundation
import Alamofire
import Combine

public class RestManager {
    
    private static let manager: Alamofire.Session = {
        var configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 100
        configuration.timeoutIntervalForResource = 100
        let sessionManager = Session(configuration: configuration)
        
        return sessionManager
    }()
    
    static func requestObservable<T: Codable>(url: String) -> AnyPublisher<Result<T, AFError>, Never> {
        return RestManager.manager
            .request(url)
            .validate(statusCode: 200..<423)
            .publishDecodable(type: T.self)
            .result()
            .eraseToAnyPublisher()
    }
}
