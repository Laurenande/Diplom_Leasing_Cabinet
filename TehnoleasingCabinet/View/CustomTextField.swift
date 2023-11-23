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
class CustomTextField: UITextField, UITextFieldDelegate {
    
    init(placeholder:String, keyboard: typeKey1){
        super.init(frame: .zero)
        setupTextFiled(text: placeholder, keyboard: keyboard)
        delegate = self
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
        backgroundColor = .secondarySystemBackground
        //layer.borderWidth = 1.5
        //layer.borderColor = UIColor.lightGray.cgColor
        //layer.cornerRadius = 4
        autocorrectionType = UITextAutocorrectionType.no
        clearButtonMode = UITextField.ViewMode.whileEditing
        addTarget(self, action: #selector(applyActiveStyles), for: UIControl.Event.editingDidBegin)
        addTarget(self, action: #selector(applyDefaultStyles), for: UIControl.Event.editingDidEnd)
        
        
        contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        overrideUserInterfaceStyle = .light
        
        
    }
    
    @objc func applyActiveStyles() {
        layer.borderColor = UIColor.systemBlue.cgColor
        layer.borderWidth = 1.5
        layer.cornerRadius = 5
    }
    
    @objc func applyDefaultStyles() {
        layer.borderColor = .none
        layer.borderWidth = 0
    }

    
}
