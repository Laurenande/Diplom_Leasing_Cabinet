//
//  AskLabel.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 03.09.2023.
//
import UIKit

class AskLabel: UILabel {
    
    init(text:String){
        super.init(frame: .zero)
        setupLabel(textInit: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel(textInit: String) {
        font = UIFont.systemFont(ofSize: 13)
        textColor = .black
        textAlignment = .left
        numberOfLines = 0
        text = textInit
    }
}
