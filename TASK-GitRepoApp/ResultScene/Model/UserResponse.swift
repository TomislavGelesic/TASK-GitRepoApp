// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let user = try? newJSONDecoder().decode(UserResponse.self, from: jsonData)

import Foundation

struct UserResponse: Codable {
    var totalCount: Int
    var incompleteResults: Bool
    var items: [UserResponseItem]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

struct UserResponseItem: Codable {
    var login: String
    var id: Int
    var nodeId: String
    var avatarUrl: String
    var gravatarId: String
    var url, htmlUrl, followersUrl: String
    var followingUrl, gistsUrl, starredUrl: String
    var subscriptionsUrl, organizationsUrl, reposUrl: String
    var eventsUrl: String
    var receivedEventsUrl: String
    var siteAdmin: Bool
    var score: Int

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeId = "node_id"
        case avatarUrl = "avatar_url"
        case gravatarId = "gravatar_id"
        case url
        case htmlUrl = "html_url"
        case followersUrl = "followers_url"
        case followingUrl = "following_url"
        case gistsUrl = "gists_url"
        case starredUrl = "starred_url"
        case subscriptionsUrl = "subscriptions_url"
        case organizationsUrl = "organizations_url"
        case reposUrl = "repos_url"
        case eventsUrl = "events_url"
        case receivedEventsUrl = "received_events_url"
        case siteAdmin = "site_admin"
        case score
    }
}
