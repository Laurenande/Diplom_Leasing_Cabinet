//
//  ProfileVC.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 01.10.2023.
//

import UIKit

class ProfileVC: UIViewController {

    private let fioLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.text = "Куракин Егор Андреевич"
        label.font = .boldSystemFont(ofSize: 20)
        //label.font = .italicSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //Create form element
    private let formStack: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        stack.isLayoutMarginsRelativeArrangement = true;
        return stack
    }()
    //Email element
    private let mailLabel = FormLabel(text: "E-mail")
    private let mailTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "info@tehnoleasing.ru", keyboard: .adc)
        textfield.isEnabled = false
        return textfield
    }()
    //Phone element
    private let phoneLabel = FormLabel(text: "Телефон")
    private let phoneTextfield: CustomTextField = {
       let textfield = CustomTextField(placeholder: "+7 (999) 999-99-99", keyboard: .number)
        textfield.isEnabled = false
        return textfield
    }()
    //Contract element
    private let contractLabel = FormLabel(text: "Агентский договор")
    private let contractTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "№123456", keyboard: .number)
         textfield.isEnabled = false
         return textfield
    }()
    
    private let contractButton: TehnoBlueButton = {
        let button = TehnoBlueButton(title: "Договор")
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.title = "Профиль"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .done, target: nil, action: nil)
        setViews()
        setConstraints()
        // Do any additional setup after loading the view.
    }
    
    func setViews() {
        view.addSubview(fioLabel)
        view.addSubview(formStack)
        view.addSubview(contractButton)
        formStack.addArrangedSubview(mailLabel)
        formStack.addArrangedSubview(mailTextfield)
        formStack.addArrangedSubview(phoneLabel)
        formStack.addArrangedSubview(phoneTextfield)
        formStack.addArrangedSubview(contractLabel)
        formStack.addArrangedSubview(contractTextfield)
        
    }

}
extension ProfileVC{
    func setConstraints() {
        NSLayoutConstraint.activate([
            fioLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            fioLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            fioLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            
            formStack.topAnchor.constraint(equalTo: fioLabel.bottomAnchor, constant: 100),
            formStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            formStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            contractButton.topAnchor.constraint(equalTo: formStack.bottomAnchor, constant: 50),
            contractButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70),
            contractButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70),
            contractButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
