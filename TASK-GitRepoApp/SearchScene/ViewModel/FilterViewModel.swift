
import UIKit
import Combine

class FilterViewModel {
    
    var filterOptions: [FilterOption] = [.repositories]
    var optionSubject = CurrentValueSubject<[FilterOption], Never>([.repositories])
    var enableApplyButtonSubject = CurrentValueSubject<Bool, Never>(true)
    
    func optionSelected(_ option: FilterOption) {
        if filterOptions.contains(option) { filterOptions = filterOptions.filter({ (item) -> Bool in item == option ? false : true }) }
        else { filterOptions.append(option) }
        if filterOptions.isEmpty { enableApplyButtonSubject.send(false)}
        else { enableApplyButtonSubject.send(true)}
        optionSubject.send(filterOptions)
    }
}
