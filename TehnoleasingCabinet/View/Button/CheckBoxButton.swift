//
//  CheckBoxButton.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 03.09.2023.
//

import UIKit

class CheckBoxButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        setImage(UIImage(named: "off"), for: .normal)
        frame.size = CGSize(width: 20, height: 20)
        bounds.size = CGSize(width: 20, height: 20)
        
        addTarget(self,
                  action: #selector(buttonActionSendSMS),
                  for: .touchUpInside)
    }
    @objc func buttonActionSendSMS() {
        isSelected = !isSelected
        if isSelected{
            setImage(UIImage(named: "on"), for: .selected)
            
        }else{
            setImage(UIImage(named: "off"), for: .normal)
        }
    }
    func setConstraints() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 20),
            heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
