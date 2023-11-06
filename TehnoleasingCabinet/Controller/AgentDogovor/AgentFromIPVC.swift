//
//  AgentFromIPVC.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 25.10.2023.
//

import UIKit
class AgentFromIPVC: UIViewController {

    private let formStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        stack.isLayoutMarginsRelativeArrangement = true;
        return stack
    }()
    
    //Textfield FIO
    private let fioLabel = FormLabel(text: "Выберите систему налогообложения")
    private let fioTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "Простая", keyboard: .adc)
        return textfield
    }()
    //Textfield INN
    private let innLabel = FormLabel(text: "ИНН организации или наименование")
    private let innTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "798635783", keyboard: .number)
        return textfield
    }()

    private let innStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        stack.contentMode = .scaleAspectFit
        stack.isLayoutMarginsRelativeArrangement = true;
        return stack
    }()
    private let nameInnStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        stack.isLayoutMarginsRelativeArrangement = true;
        return stack
    }()
    private let propertyInnStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.contentMode = .left
        stack.spacing = 5
        stack.isLayoutMarginsRelativeArrangement = true;
        return stack
    }()
    
    private let innStackLabel = FormLabel(text: "ИНН:")
    private let dateLabel = FormLabel(text: "Дата регистрации:")
    private let adresLabel = FormLabel(text: "Юр. адрес:")
    
    private let innAPILabel: UILabel = {
        let label = UILabel()
        label.text = "7729977194"
        return label
    }()
    private let dateAPILabel: UILabel = {
        let label = UILabel()
        label.text = "12.12.2000"
        return label
    }()
    private let adressAPILabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.sizeToFit()
        label.text = "142072, Московская область, Г.О. ДОМОДЕДОВО, С БИТЯГОВО, ТЕР С7 ИНВЕСТ, СТР. 1"
        return label
    }()
    
    private lazy var confirmButton: TehnoBlueButton = {
        let button = TehnoBlueButton(title: "Присоединится")
        //button.alpha = 0.5
        //button.isEnabled = false
        button.addTarget(self,action: #selector(buttonAction),for: .touchUpInside)
        return button
    }()
    @objc func buttonAction() {
        let VCReg = AgentFormIP2VC()
        confirmButton.zoomInWithEasing()
        navigationController?.pushViewController(VCReg, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Договор для ИП"
        innStackLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        setViews()
        setConstraints()
        // Do any additional setup after loading the view.
    }
    
    
    
    func setViews(){
        view.addSubview(formStack)
        view.addSubview(confirmButton)
        formStack.addArrangedSubview(fioLabel)
        formStack.addArrangedSubview(fioTextfield)
        formStack.addArrangedSubview(innLabel)
        formStack.addArrangedSubview(innTextfield)
        formStack.addArrangedSubview(innStack)
        innStack.addArrangedSubview(nameInnStack)
        nameInnStack.addArrangedSubview(innStackLabel)
        nameInnStack.addArrangedSubview(dateLabel)
        nameInnStack.addArrangedSubview(adresLabel)
        innStack.addArrangedSubview(propertyInnStack)
        propertyInnStack.addArrangedSubview(innAPILabel)
        propertyInnStack.addArrangedSubview(dateAPILabel)
        propertyInnStack.addArrangedSubview(adressAPILabel)
        
        
    }
    
}


extension AgentFromIPVC {
    func setConstraints() {
        NSLayoutConstraint.activate([
           
            
            formStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            formStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12),
            formStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12),
            
            confirmButton.topAnchor.constraint(equalTo: formStack.bottomAnchor, constant: 50),
            confirmButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70),
            confirmButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70),
            confirmButton.heightAnchor.constraint(equalToConstant: 50),
            innStackLabel.heightAnchor.constraint(equalToConstant: 20),
            innAPILabel.heightAnchor.constraint(equalToConstant: 20),
            dateLabel.heightAnchor.constraint(equalToConstant: 20),
            dateAPILabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    }
}
