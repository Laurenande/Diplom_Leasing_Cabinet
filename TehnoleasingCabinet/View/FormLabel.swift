//
//  FormLabel.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 03.09.2023.
//

import UIKit

class FormLabel: UILabel {
    
    init(text:String){
        super.init(frame: .zero)
        setupLabel(textInit: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel(textInit: String) {
        text = textInit
        textColor = .black
        textAlignment = .left
        numberOfLines = 1
        frame.size = CGSize(width: 100, height: 200)
        translatesAutoresizingMaskIntoConstraints = false
    }
}