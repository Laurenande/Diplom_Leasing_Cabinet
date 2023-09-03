//
//  LoginVC.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 31.08.2023.
//

import UIKit

class LoginVC: UIViewController {

    private let buttonLogin: UIButton = {
        let button = UIButton(type: .system)
        //button.frame.size = CGSize(width: 100, height: 100)
        button.setTitle("Вход",
                        for: .normal)
        button.setTitleColor(.white,
                             for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1129455492, green: 0.2492182851, blue: 0.3852708042, alpha: 1)
        button.layer.cornerRadius = 14
        button.addTarget(self,
                         action: #selector(buttonActionLogin),
                         for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let buttonReg: UIButton = {
        let button = UIButton(type: .system)
        //button.frame.size = CGSize(width: 100, height: 100)
        button.setTitle("Регистрация",
                        for: .normal)
        button.setTitleColor(.white,
                             for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.77, green: 0.0077, blue: 0.020405, alpha: 1)
        button.layer.cornerRadius = 14
        button.addTarget(self,
                         action: #selector(buttonActionLogin),
                         for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoText")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let labelInfo: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Универсальная  лизинговая компания, мы работаем в сегменте малого и среднего бизнеса, преимущественно с автотраспортом"
        //label.font = .boldSystemFont(ofSize: 14)
        label.font = .italicSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        label.frame.size = CGSize(width: 100, height: 200)
        label.text = "Номер телефона"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneTextfield: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.frame.size = CGSize(width: 200, height: 300)
        textField.placeholder = "+7 (999) 999-99-99"
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.asciiCapableNumberPad
        textField.returnKeyType = UIReturnKeyType.go
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    let stack = UIStackView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
        initializeHideKeyboard()
        // Do any additional setup after loading the view.
    }
    
    private func setViews(){
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        stack.isLayoutMarginsRelativeArrangement = true;
        stack.addArrangedSubview(phoneLabel)
        stack.addArrangedSubview(phoneTextfield)
        
        view.backgroundColor = .white
        view.addSubview(buttonLogin)
        view.addSubview(buttonReg)
        view.addSubview(logoImageView)
        view.addSubview(labelInfo)
        view.addSubview(stack)
    }
    @objc func buttonActionLogin() {
           print("lox")
    }
    
    @objc func buttonActionReg() {
           print("lox")
       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension LoginVC{
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            buttonLogin.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70),
            buttonLogin.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70),
            buttonLogin.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            buttonLogin.heightAnchor.constraint(equalToConstant: 50),
            
            buttonReg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70),
            buttonReg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70),
            buttonReg.bottomAnchor.constraint(equalTo: buttonLogin.topAnchor, constant: -10),
            buttonReg.heightAnchor.constraint(equalToConstant: 50),
            
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            logoImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            logoImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            logoImageView.heightAnchor.constraint(equalToConstant: 70),
            
            labelInfo.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 30),
            labelInfo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            labelInfo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            stack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            stack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            stack.topAnchor.constraint(equalTo: labelInfo.bottomAnchor, constant: 150)
            
        ])
    }
    
    func initializeHideKeyboard(){
     //Declare a Tap Gesture Recognizer which will trigger our dismissMyKeyboard() function
     let tap: UITapGestureRecognizer = UITapGestureRecognizer(
     target: self,
     action: #selector(dismissMyKeyboard))
     //Add this tap gesture recognizer to the parent view
     view.addGestureRecognizer(tap)
     }
     @objc func dismissMyKeyboard(){
     //endEditing causes the view (or one of its embedded text fields) to resign the first responder status.
     //In short- Dismiss the active keyboard.
     view.endEditing(true)
     }
}

