//
//  CustomTextField.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 03.09.2023.
//
import UIKit
enum typeKey1 {
    case number
    case adc
}
class CustomTextField: UITextField {
    
    init(placeholder:String, keyboard: typeKey1){
        super.init(frame: .zero)
        setupTextFiled(text: placeholder, keyboard: keyboard)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTextFiled(text: String, keyboard: typeKey1) {
        if keyboard == .adc{
            keyboardType = UIKeyboardType.default
        }else{
            keyboardType = UIKeyboardType.asciiCapableNumberPad
        }
        placeholder = text
        font = UIFont.systemFont(ofSize: 13)
        frame.size = CGSize(width: 200, height: 300)
        borderStyle = UITextField.BorderStyle.roundedRect
        autocorrectionType = UITextAutocorrectionType.no
        //returnKeyType = UIReturnKeyType.continue
        clearButtonMode = UITextField.ViewMode.whileEditing
        contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
    }
}
