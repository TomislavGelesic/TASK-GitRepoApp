
import Foundation


struct DetailsDomainItem {
    var title: String
    var webPagePath: URLRequest?
    
    init(title: String, webPagePath: URLRequest) {
        self.title = title
        self.webPagePath = webPagePath
    }
    
    init(_ item: UserDomainItem) {
        self.title = item.authorName
        guard let url = URL(string: item.webPagePath) else { return }
        self.webPagePath = URLRequest(url: url)
    }
    
    init(_ item: RepositoryDomainItem) {
        self.title = item.repositoryName
        guard let url = URL(string: item.webPagePath) else { return }
        self.webPagePath = URLRequest(url: url)
    }
}


