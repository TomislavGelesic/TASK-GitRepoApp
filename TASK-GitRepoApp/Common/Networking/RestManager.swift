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
    
    static func requestObservable<T: Codable>(url: String) -> AnyPublisher<Result<T, RestManagerError>, Never> {
        return Future<Result<T, RestManagerError>, Never> { promise in
            #warning("Whats status code 422 for githubapi.com ?")
            AF.request(url)
                .validate(statusCode: 200..<423)
                .responseData { (response) in
                    if let data = response.data {                        
                        if let parsedData: T = SerializationManager.parseData(jsonData: data) {
                            promise(.success(.success(parsedData)))
                        }
                        promise(.success(.failure(.decodingError)))
                    } else {
                        promise(.success(.failure(.noDataError)))
                    }
                }
        }.eraseToAnyPublisher()
    }
}


