
import Foundation


struct DetailsDomainItem {
    var title: String
    var webPagePath: String
    
    init(title: String, webPagePath: String) {
        self.title = title
        self.webPagePath = webPagePath
    }
    
    init(_ item: UserDomainItem) {
        self.title = item.authorName
        self.webPagePath = item.webPagePath
    }
    
    init(_ item: RepositoryDomainItem) {
        self.title = item.repositoryName
        self.webPagePath = item.webPagePath
    }
}


