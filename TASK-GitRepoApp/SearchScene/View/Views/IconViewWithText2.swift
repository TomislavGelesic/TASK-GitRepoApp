//
//  IconWithText.swift
//  TASK-GitRepoApp
//
//  Created by Tomislav Gelesic on 02.03.2021..
//

import UIKit
import SnapKit

class IconViewWithText2: UIView {

    let icon: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "slider.horizontal.3")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .black
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 30.0), forImageIn: .normal)
        return button
    }()
    
    let iconText: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.textAlignment = .center
        label.textColor = .black
        label.font = label.font.withSize(12)
        return label
    }()
    
    init(iconImage: UIImage?, iconSize: Int, text: String) {
        super.init(frame: .zero)
        
        icon.setImage(iconImage?.withRenderingMode(.alwaysTemplate), for: .normal)
        icon.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: CGFloat(iconSize)), forImageIn: .normal)
        iconText.text = text
        
        addSubviews([icon, iconText])
        
        icon.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(5)
            make.centerX.equalTo(self)
            make.width.height.equalTo(iconSize)
        }
        
        iconText.snp.makeConstraints { (make) in
            make.top.equalTo(icon.snp.bottom).offset(2)
            make.centerX.equalTo(self)
            make.width.equalTo(icon)
            make.height.equalTo(15)
            make.bottom.equalTo(self)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
