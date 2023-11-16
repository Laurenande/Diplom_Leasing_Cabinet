//
//  MyBidVC.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 29.09.2023.
//

import UIKit

class MyBidVC: UIViewController {

    private let formStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        stack.isLayoutMarginsRelativeArrangement = true;
        return stack
    }()
    
    //Textfield INN
    private let innLabel = FormLabel(text: "ИНН")
    private let innTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "798635783", keyboard: .number)
        return textfield
    }()
    //Textfield FIO
    private let fioLabel = FormLabel(text: "ФИО")
    private let fioTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "Иванов Иван Иванович", keyboard: .adc)
        return textfield
    }()
    //Textfield phone
    private let phoneLabel = FormLabel(text: "Телефон контактного лица")
    private let phoneTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "+7 (495) 107-11-76", keyboard: .number)
        return textfield
    }()
    
    //create ask check
    private let checkBoxStack: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        stack.distribution = .fillProportionally
        return stack
    }()
    private let checkBox1 = CheckBoxButton()
    private let agreeLabel = AskLabel(text: "У клиента есть поручитель?")
    
    private lazy var nextButton: TehnoBlueButton = {
        let button = TehnoBlueButton(title: "Далее")
        button.addTarget(self,action: #selector(buttonAction),for: .touchUpInside)
        button.alpha = 0.5
        button.isEnabled = false
        return button
    }()
    @objc func buttonAction() {
        let VCReg = BidStep2VC()
        nextButton.zoomInWithEasing()
        navigationController?.pushViewController(VCReg, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        navigationItem.title = "Новая заявка на лизинг"
        setViews()
        setConstraints()
        innTextfield.delegate = self
        fioTextfield.delegate = self
        phoneTextfield.delegate = self
    }
    
    func setViews() {
        view.addSubview(formStack)
        view.addSubview(nextButton)
        formStack.addArrangedSubview(innLabel)
        formStack.addArrangedSubview(innTextfield)
        formStack.addArrangedSubview(fioLabel)
        formStack.addArrangedSubview(fioTextfield)
        formStack.addArrangedSubview(phoneLabel)
        formStack.addArrangedSubview(phoneTextfield)
        formStack.addArrangedSubview(checkBoxStack)
        checkBoxStack.addArrangedSubview(checkBox1)
        checkBoxStack.addArrangedSubview(agreeLabel)
    }

}
extension MyBidVC {
    func setConstraints() {
        NSLayoutConstraint.activate([
            formStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            formStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12),
            formStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12),
            
            nextButton.topAnchor.constraint(equalTo: formStack.bottomAnchor, constant: 50),
            nextButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70),
            nextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


extension MyBidVC: UITextFieldDelegate{
    
    func textFieldDidChangeSelection(_ textField: UITextField) {

        if innTextfield.text?.count ?? 0 > 7 && fioTextfield.text?.count ?? 0 > 10{
            nextButton.alpha = 1
            nextButton.isEnabled = true
        }else{
            nextButton.alpha = 0.5
            nextButton.isEnabled = false
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == phoneTextfield{
            guard let text = phoneTextfield.text else {return false}
            let newString = (text as NSString).replacingCharacters(in: range, with: string)
            phoneTextfield.text = formatter(mask: "+X (XXX) XXX-XX-XX", phoneNumber: newString)
            return false
        }
        return true
        
        
    }
    
    func formatter(mask:String, phoneNumber:String) -> String{
        let number = phoneNumber.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result:String = ""
        var index = number.startIndex
        
        for character in mask where index < number.endIndex{
            if character == "X" {
                result.append(number[index])
                index = number.index(after: index)
            }else{
                result.append(character)
            }
        }
        
        return result
    }
}

