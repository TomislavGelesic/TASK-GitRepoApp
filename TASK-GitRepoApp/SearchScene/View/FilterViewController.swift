
import UIKit
import SnapKit
import Combine

class FilterViewController: UIViewController {
    
    var viewModel: FilterViewModel
    var disposeBag = Set<AnyCancellable>()
    
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let dimmerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.7)
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.backgroundColor = .white
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Look for:"
        label.font = label.font.withSize(16)
        return label
    }()
    
    let titleLineSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    let repositoriesButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "squareshape"), for: .normal)
        button.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        button.tintColor = .darkGray
        return button
    }()
    
    let repositoriesLabel: UILabel = {
        let label = UILabel()
        label.text = "Repositories"
        label.font = label.font.withSize(20)
        label.isUserInteractionEnabled = true
        return label
    }()
    
    let usersButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "squareshape"), for: .normal)
        button.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        button.tintColor = .darkGray
        return button
    }()
    
    let userLabel: UILabel = {
        let label = UILabel()
        label.text = "Users"
        label.font = label.font.withSize(20)
        label.isUserInteractionEnabled = true
        return label
    }()
    
    let applyButton: UIButton = {
        let button = UIButton()
        button.setTitle("APPLY", for: .normal)
        button.setTitleColor(.darkGray, for: .disabled)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
        return button
    }()
    
    init(viewModel: FilterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        initializeSubscribers()
    }
    
}

extension FilterViewController {
    
    func setupViews() {
        view.addSubviews([backgroundImage,dimmerView, contentView])
        contentView.addSubviews([titleLabel,
                                 titleLineSeparator,
                                 repositoriesButton,
                                 repositoriesLabel,
                                 usersButton,
                                 userLabel,
                                 applyButton])
        repositoriesButton.addTarget(self, action: #selector(repositoriesOptionTapped), for: .touchUpInside)
        repositoriesLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(repositoriesOptionTapped)))
        usersButton.addTarget(self, action: #selector(usersOptionTapped), for: .touchUpInside)
        userLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(usersOptionTapped)))
        applyButton.addTarget(self, action: #selector(applyButtonTapped), for: .touchUpInside)
    }
    
    func initializeSubscribers() {
        
        viewModel.optionSubject
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: RunLoop.main)
            .sink { [unowned self] (selectedOptions) in self.updateButtons(with: selectedOptions) }
            .store(in: &disposeBag)
        
        viewModel.enableApplyButtonSubject
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: RunLoop.main)
            .sink { [unowned self] (state) in self.updateUserEnabilityForApplyButton(state)}
            .store(in: &disposeBag)
    }
    
    func updateUserEnabilityForApplyButton(_ state: Bool) {
        if state {
            applyButton.layer.borderColor = CGColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1)
            applyButton.isEnabled = true
            applyButton.backgroundColor = .white
            applyButton.isEnabled = true
        }
        else {
            applyButton.layer.borderColor = CGColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
            applyButton.isEnabled = false
            applyButton.backgroundColor = .lightGray
            applyButton.isEnabled = false
        }
    }
    
    func updateButtons(with options: [FilterOption]) {
        repositoriesButton.isSelected = false
        self.repositoriesButton.tintColor = .darkGray
        usersButton.isSelected = false
        self.usersButton.tintColor = .darkGray
        for item in options {
            switch item {
            case .repositories:
                self.repositoriesButton.tintColor = .init(red: 0.0, green: 0.0, blue: 0.8, alpha: 1.0)
                self.repositoriesButton.isSelected = true
            case .users:
                self.usersButton.tintColor = .init(red: 0.0, green: 0.0, blue: 0.8, alpha: 1.0)
                self.usersButton.isSelected = true
            }
        }
    }
    
    @objc func repositoriesOptionTapped() { viewModel.optionSelected(.repositories) }
    @objc func usersOptionTapped() { viewModel.optionSelected(.users) }
    @objc func applyButtonTapped() {
        if applyButton.isEnabled {
            viewModel.applyTapped()
            dismiss(animated: false, completion: nil)
        }
    }
    
}

extension FilterViewController {
    //MARK: CONSTRAINTS BELOW
    
    func setConstraints() {
        setConstraintsBackgroundImage()
        setConstraintsDimmerView()
        setConstraintsContentView()
        setConstraintsTitleLabel()
        setConstraintsTitleLineSeparator()
        setConstraintsRepositoriesButton()
        setConstraintsRepositoriesLabel()
        setConstraintsUserButton()
        setConstraintsUserLabel()
        setConstraintsApplyButton()
    }
    
    func setConstraintsBackgroundImage() {
        backgroundImage.snp.makeConstraints { (make) in make.edges.equalTo(view) }
    }
    
    func setConstraintsDimmerView() {
        dimmerView.snp.makeConstraints { (make) in make.edges.equalTo(view) }
    }
    
    func setConstraintsContentView() {
        contentView.snp.makeConstraints { (make) in
            make.width.equalTo(view)
            make.height.equalTo(view.frame.height/2)
            make.bottom.equalTo(view.snp.bottom)
            make.centerX.equalTo(view)
        }
    }
    
    func setConstraintsTitleLabel() {
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(contentView).offset(15)
            make.trailing.equalTo(contentView)
            make.top.equalTo(contentView).offset(15)
            make.height.equalTo(30)
        }
    }
    
    func setConstraintsTitleLineSeparator() {
        titleLineSeparator.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.leading.trailing.equalTo(contentView)
            make.height.equalTo(2)
        }
    }
    
    func setConstraintsRepositoriesButton() {
        repositoriesButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(20)
            make.centerY.equalTo(repositoriesLabel.snp.centerY)
            make.leading.equalTo(contentView).offset(15)
        }
    }
    
    func setConstraintsRepositoriesLabel() {
        repositoriesLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(repositoriesButton.snp.trailing).offset(15)
            make.height.equalTo(30)
            make.trailing.equalTo(contentView).offset(-15)
            make.top.equalTo(titleLineSeparator.snp.bottom).offset(30)
        }
    }
    
    func setConstraintsUserButton() {
        usersButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(20)
            make.centerY.equalTo(userLabel.snp.centerY)
            make.leading.equalTo(contentView).offset(15)
        }
    }
    
    func setConstraintsUserLabel() {
        userLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(usersButton.snp.trailing).offset(15)
            make.height.equalTo(30)
            make.trailing.equalTo(contentView).offset(-15)
            make.top.equalTo(repositoriesLabel.snp.bottom).offset(30)
        }
    }
    
    func setConstraintsApplyButton() {
        applyButton.snp.makeConstraints { (make) in
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
            make.centerX.equalTo(contentView)
            make.height.equalTo(44)
            make.bottom.equalTo(contentView.snp.bottom).offset(-20)
        }
    }
}
