//
//  TehnoBlueButton.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 03.09.2023.
//


import UIKit

class TehnoBlueButton: UIButton {
    init(title:String){
        super.init(frame: .zero)
        setupButton(title: title)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton(title: String) {
        setTitle(title,for: .normal)
        setTitleColor(.white,for: .normal)
        backgroundColor = #colorLiteral(red: 0.1129455492, green: 0.2492182851, blue: 0.3852708042, alpha: 1)
        layer.cornerRadius = 14
        translatesAutoresizingMaskIntoConstraints = false
    }
}
