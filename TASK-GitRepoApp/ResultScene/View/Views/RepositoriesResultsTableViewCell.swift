
import UIKit
import SnapKit

class RepositoriesResultsTableViewCell: UITableViewCell {
    
    var buttonTapped: (()->())?
    
    let contentSubview: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()

    let repositoryNameLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(24)
        return label
    }()
    
    let authorNameLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(12)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    let authorDetailsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Author\ndetails", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = button.titleLabel?.font.withSize(12)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .init(red: 0.0, green: 0.0, blue: 0.8, alpha: 1.0)
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        return button
    }()
    
    let browserButton: UIButton = {
        let button = UIButton()
        button.setTitle("Open in\n browser", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = button.titleLabel?.font.withSize(12)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = .init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        return button
    }()
    
    let lineSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    let iconContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .init(red: 4/5, green: 4/5, blue: 4/5, alpha: 1.0)
        return view
    }()
    
    let iconPrivacy: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "lock.circle")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 30)), for: .selected)
        button.setImage(UIImage(systemName: "lock.circle.fill")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 30)), for: .normal)
        return button
    }()
    
    let iconIssue: IconViewWithText2 = {
        let view = IconViewWithText2(iconImage: UIImage(systemName: "exclamationmark.circle"), iconSize: 30, text: "0")
        return view
    }()
    
    let iconWatch: IconViewWithText2 = {
        let view = IconViewWithText2(iconImage: UIImage(systemName: "eye"), iconSize: 30, text: "0")
        return view
    }()
    
    let iconStar: IconViewWithText2 = {
        let view = IconViewWithText2(iconImage: UIImage(systemName: "star.fill"), iconSize: 30, text: "0")
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RepositoriesResultsTableViewCell {
    
    func setupViews() {
        contentView.backgroundColor = .darkGray
        contentView.addSubview(contentSubview)
        contentSubview.addSubviews([
            repositoryNameLabel,
            authorNameLabel,
            descriptionLabel,
            authorDetailsButton,
            browserButton,
            iconContainer,
            lineSeparator
        ])
        
        iconContainer.addSubviews([
            iconPrivacy,
            iconIssue,
            iconWatch,
            iconStar
        ])
    }
    
    func configure(with data: RepositoryDomainItem) {
        
        repositoryNameLabel.text = data.repositoryName
        authorNameLabel.text = data.authorName
        descriptionLabel.text = data.description
        if data.isRepositoryPrivate {
            iconPrivacy.isSelected = true
            iconPrivacy.tintColor = .red
        } else {
            iconPrivacy.isSelected = false
            iconPrivacy.tintColor = .green
        }
        
        iconIssue.iconText.text = "\(data.issueAmount)"
        iconWatch.iconText.text = "\(data.watchAmount)"
        iconStar.iconText.text = "\(data.starAmount)"
    }
}

extension RepositoriesResultsTableViewCell {
    
    //MARK: CONSTRAINTS BELOW
    
    func setConstraints() {
        setConstraintsContentSubview()
        setConstraintsRepositoryNameLabel()
        setConstraintsAuthorNameLabel()
        setConstraintsDescriptionLabel()
        setConstraintsLineSeparator()
        setConstraintsAuthorDetailsButton()
        setConstraintsBrowserButton()
        setConstraintsIconContainer()
        setConstraintsIconPrivacy()
        setConstraintsIconIssue()
        setConstraintsIconWatch()
        setConstraintsIconStar()
    }
    
    func setConstraintsContentSubview() {
        contentSubview.snp.makeConstraints { (make) in
            make.edges.equalTo(contentView).inset(UIEdgeInsets(top: 10.0, left: 10.0, bottom: 5.0, right: 10.0))
        }
    }
    
    func setConstraintsRepositoryNameLabel () {
        repositoryNameLabel.snp.makeConstraints { (make) in
            make.top.leading.equalTo(contentSubview).offset(5)
            make.height.equalTo(40)
            make.width.equalTo(contentView.frame.width*8/10)
        }
    }
    
    func setConstraintsAuthorNameLabel() {
        authorNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(repositoryNameLabel.snp.bottom).offset(5)
            make.leading.equalTo(repositoryNameLabel)
            make.width.equalTo(repositoryNameLabel)
            make.height.equalTo(20)
        }
    }
    
    func setConstraintsDescriptionLabel() {
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(authorNameLabel.snp.bottom).offset(10)
            make.leading.equalTo(repositoryNameLabel)
            make.width.equalTo(repositoryNameLabel)
        }
    }
    
    
    func setConstraintsLineSeparator() {
        lineSeparator.snp.makeConstraints { (make) in
            make.width.equalTo(contentSubview)
            make.centerX.equalTo(contentSubview)
            make.height.equalTo(2)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(5)
        }
    }
    
    func setConstraintsAuthorDetailsButton() {
        authorDetailsButton.snp.makeConstraints { (make) in
            make.top.equalTo(lineSeparator.snp.bottom).offset(5)
            make.leading.equalTo(repositoryNameLabel)
            make.width.equalTo(70)
            make.height.equalTo(44)
            make.bottom.equalTo(contentSubview).offset(-5)
        }
    }
    
    func setConstraintsBrowserButton() {
        
        browserButton.snp.makeConstraints { (make) in
            make.top.equalTo(lineSeparator.snp.bottom).offset(5)
            make.leading.equalTo(authorDetailsButton.snp.trailing).offset(5)
            make.width.equalTo(70)
            make.height.equalTo(44)
            make.bottom.equalTo(contentSubview).offset(-5)
        }
    }
    
    func setConstraintsIconContainer() {
        iconContainer.snp.makeConstraints { (make) in
            make.leading.equalTo(repositoryNameLabel.snp.trailing)
            make.trailing.equalTo(contentSubview)
            make.top.bottom.equalTo(contentSubview)
        }
    }
    
    func setConstraintsIconPrivacy() {
        iconPrivacy.snp.makeConstraints { (make) in
            make.top.equalTo(iconContainer).offset(5)
            make.width.height.equalTo(30)
            make.centerX.equalTo(iconContainer)
        }
    }
    
    func setConstraintsIconIssue() {
        iconIssue.snp.makeConstraints { (make) in
            make.top.equalTo(iconPrivacy.snp.bottom).offset(5)
            make.centerX.equalTo(iconContainer)
        }
    }
    func setConstraintsIconWatch() {
        iconWatch.snp.makeConstraints { (make) in
            make.top.equalTo(iconIssue.snp.bottom).offset(5)
            make.centerX.equalTo(iconContainer)
        }
    }
    func setConstraintsIconStar() {
        iconStar.snp.makeConstraints { (make) in
            make.top.equalTo(iconWatch.snp.bottom).offset(5)
            make.centerX.equalTo(iconContainer)
            make.bottom.equalTo(lineSeparator.snp.top).offset(-5)
        }
    }
}
