
import UIKit
import Combine

class FilterViewModel {
    
    var viewControllerDelegate: FilterViewController?
    var delegate: FilterViewModelDelegate?
    var filterOptions: [FilterOption]
    var optionSubject: CurrentValueSubject<[FilterOption], Never>
    var enableApplyButtonSubject = CurrentValueSubject<Bool, Never>(true)
    
    init(initFilterOptions: [FilterOption]) {
        filterOptions = initFilterOptions
        optionSubject = CurrentValueSubject<[FilterOption], Never>(initFilterOptions)
    }
    func optionSelected(_ option: FilterOption) {
        if filterOptions.contains(option) { filterOptions = filterOptions.filter({ (item) -> Bool in item == option ? false : true }) }
        else { filterOptions.append(option) }
        if filterOptions.isEmpty { enableApplyButtonSubject.send(false)}
        else { enableApplyButtonSubject.send(true)}
        optionSubject.send(filterOptions)
    }
    
    func applyTapped() {
        delegate?.updateFilterSelection(filterOptions)
    }
}
