// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let user = try? newJSONDecoder().decode(RepositoryResponse.self, from: jsonData)

import Foundation

struct RepositoryResponse: Codable {
    var items: [RepositoryResponseItem]
}

struct RepositoryResponseItem: Codable {
    var name: String
    var itemPrivate: Bool
    var owner: Owner
    var htmlUrl: String
    var itemDescription: String?
    var stargazersCount: Int
    var watchersCount: Int
    var forksCount: Int
    var openIssuesCount: Int

    enum CodingKeys: String, CodingKey {
        case name
        case itemPrivate = "private"
        case owner
        case htmlUrl = "html_url"
        case itemDescription = "description"
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case forksCount = "forks_count"
        case openIssuesCount = "open_issues_count"
    }
}

struct Owner: Codable {
    var login: String
}
