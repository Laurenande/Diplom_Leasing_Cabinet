//
//  RadioButton.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 09.10.2023.
//

import UIKit

class RadioButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        setImage(UIImage(named: "radio-button-off"), for: .normal)
        frame.size = CGSize(width: 40, height: 40)
        addTarget(self,
                  action: #selector(buttonAction),
                  for: .touchUpInside)
    }
    @objc func buttonAction() {
        isSelected = !isSelected
        if isSelected{
            setImage(UIImage(named: "radio_button_on"), for: .selected)
        }else{
            setImage(UIImage(named: "radio-button-off"), for: .normal)
        }
    }
}
