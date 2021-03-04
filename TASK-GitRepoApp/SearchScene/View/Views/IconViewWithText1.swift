//
//  IconWithText.swift
//  TASK-GitRepoApp
//
//  Created by Tomislav Gelesic on 02.03.2021..
//

import UIKit
import SnapKit

class IconViewWithText1: UIView {

    let icon: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "slider.horizontal.3")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .black
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 30.0), forImageIn: .normal)
        return button
    }()
    
    let iconText: UILabel = {
        let label = UILabel()
        label.backgroundColor = .init(red: 0.0, green: 0.8, blue: 0.0, alpha: 1.0)
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    init(iconImage: UIImage?, iconSize: CGFloat, text: String) {
        super.init(frame: CGRect.init(x: 0.0, y: 0.0, width: iconSize, height: iconSize))
        icon.setImage(iconImage?.withRenderingMode(.alwaysTemplate), for: .normal)
        icon.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: iconSize), forImageIn: .normal)
        iconText.text = text
        iconText.layer.cornerRadius = iconSize/2/2
        addSubviews([icon, iconText])
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        icon.snp.makeConstraints { (make) in
            make.edges.equalTo(self.snp.edges).inset(UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5))
        }
        
        iconText.snp.makeConstraints { (make) in
            make.width.height.equalTo(self.frame.height/2)
            make.top.leading.equalTo(self)
        }
    }

}
