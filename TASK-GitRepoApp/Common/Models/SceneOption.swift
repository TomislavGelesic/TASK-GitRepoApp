import Foundation

enum SceneOption {
    case searchScene
    case resultScene(option: ResultSceneOption)
    case detailScene(info: DetailsDomainItem)
    case back
}
