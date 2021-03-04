
import UIKit
import Kingfisher

class UsersResultTableViewCell: UITableViewCell {
    
    var openProfileTapped: (()->())?
    var openInBrowserTapped: (()->())?
    
    let authorNameLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(24)
        return label
    }()
    
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .green
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let contentSubview: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    let openProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Open\nprofile", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = button.titleLabel?.font.withSize(12)
        button.setTitleColor(.init(red: 0.0, green: 0.0, blue: 0.8, alpha: 1.0), for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        return button
    }()
    
    let openRepositoriesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Open\nrepositories", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = button.titleLabel?.font.withSize(12)
        button.setTitleColor(.init(red: 0.0, green: 0.0, blue: 0.8, alpha: 1.0), for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        return button
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

extension UsersResultTableViewCell {
    
    func setupViews() {
        contentView.backgroundColor = .gray
        contentView.addSubview(contentSubview)
        contentSubview.addSubviews([
            authorNameLabel,
            avatarImageView,
            openProfileButton,
            openRepositoriesButton
        ])
        openRepositoriesButton.addTarget(self, action: #selector(openRepositoriesButtonTapped), for: .touchUpInside)
        openProfileButton.addTarget(self, action: #selector(openProfileButtonTapped), for: .touchUpInside)
    }
    @objc func openRepositoriesButtonTapped() { openInBrowserTapped?() }
    @objc func openProfileButtonTapped() { openProfileTapped?() }
    func configure(with data: UserDomainItem) {
        authorNameLabel.text = data.authorName
        avatarImageView.setImage(with: data.avatarPath)
    }
}

extension UsersResultTableViewCell {
    
    //MARK: CONSTRAINTS BELOW
    
    func setConstraints() {
        setConstraintsContentSubview()
        setConstraintsAuthorNameLabel()
        setConstraintsAvatarImageView()
        setConstraintsOpenProfileButton()
        setConstraintsOpenRepositoriesButton()
    }
    
    func setConstraintsContentSubview() {
        contentSubview.snp.makeConstraints { (make) in
            make.edges.equalTo(contentView).inset(UIEdgeInsets(top: 10.0, left: 10.0, bottom: 5.0, right: 10.0))
        }
    }
    
    func setConstraintsAuthorNameLabel() {
        authorNameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(contentSubview).offset(20)
            make.top.equalTo(contentSubview).offset(40)
            make.height.equalTo(50)
            make.trailing.equalTo(avatarImageView)
        }
    }
    
    func setConstraintsAvatarImageView() {
        avatarImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(120)
            make.trailing.equalTo(contentSubview).offset(-15)
            make.top.equalTo(contentSubview).offset(15)
        }
    }
    
    func setConstraintsOpenProfileButton() {
        openProfileButton.snp.makeConstraints { (make) in
            make.top.equalTo(authorNameLabel.snp.bottom).offset(20)
            make.leading.equalTo(contentSubview).offset(10)
            make.width.equalTo(70)
            make.height.equalTo(44)
            make.bottom.equalTo(contentSubview).offset(-5)
        }
    }
    
    func setConstraintsOpenRepositoriesButton() {
        openRepositoriesButton.snp.makeConstraints { (make) in
            make.top.equalTo(openProfileButton)
            make.leading.equalTo(openProfileButton.snp.trailing).offset(5)
            make.width.equalTo(80)
            make.height.equalTo(44)
            make.bottom.equalTo(contentSubview).offset(-5)
        }
    }
}
