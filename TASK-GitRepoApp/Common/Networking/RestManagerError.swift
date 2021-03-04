
import Foundation

enum RestManagerError: Error {
    case noDataError
    case decodingError
    case other(Error)
}
