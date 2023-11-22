//
//  BidStep2VC.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 05.10.2023.
//

import UIKit

class BidStep2VC: UIViewController {

    private let formStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        stack.isLayoutMarginsRelativeArrangement = true;
        return stack
    }()
    
    //Textfield group
    private let group = ["Лизинг транспорта и техники", "Лизинг оборудования", "Лизинг шин", "Лизинг недвижимости"]
    private let groupPicker = UIPickerView()
    private let groupLabel = FormLabel(text: "Выберите группу")
    private let groupTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "Лизинг траспорта и техники", keyboard: .number)
        return textfield
    }()
    //Textfield type
    private let type = ["Легковые автомобили", "Грузовые автомобили", "Спецтехника", "Сельхозтехника (ПСМ)", "Прицепы", "Автобусы и микро-автобусы"]
    private let typePicker = UIPickerView()
    private let typeLabel = FormLabel(text: "Выберите тип имущества")
    private let typeTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "Тип имущества", keyboard: .adc)
        return textfield
    }()
    //Textfield name
    private let nameLabel = FormLabel(text: "Наименование предмета лизинга")
    private let nameTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "Maserati", keyboard: .number)
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
    private let agreeLabel = AskLabel(text: "Предмет лизига был в употреблении?")
    
    private lazy var nextButton: TehnoBlueButton = {
        let button = TehnoBlueButton(title: "Далее")
        button.alpha = 0.5
        button.isEnabled = false
        button.addTarget(self,action: #selector(buttonAction),for: .touchUpInside)
        return button
    }()
    @objc func buttonAction() {
        let VCReg = BidStep3VC()
        nextButton.zoomInWithEasing()
        navigationController?.pushViewController(VCReg, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Новая заявка"
        
        groupTextfield.delegate = self
        typeTextfield.delegate = self
        nameTextfield.delegate = self
        setViews()
        setConstraints()
        // Do any additional setup after loading the view.
    }
    

    func setViews() {
        groupPicker.delegate = self
        groupPicker.dataSource = self
        groupTextfield.inputView = groupPicker
        groupTextfield.delegate = self
        
        typePicker.delegate = self
        typePicker.dataSource = self
        typeTextfield.inputView = typePicker
        typeTextfield.delegate = self
        
        
        view.addSubview(formStack)
        view.addSubview(nextButton)
        formStack.addArrangedSubview(groupLabel)
        formStack.addArrangedSubview(groupTextfield)
        formStack.addArrangedSubview(typeLabel)
        formStack.addArrangedSubview(typeTextfield)
        formStack.addArrangedSubview(nameLabel)
        formStack.addArrangedSubview(nameTextfield)
        formStack.addArrangedSubview(checkBoxStack)
        checkBoxStack.addArrangedSubview(checkBox1)
        checkBoxStack.addArrangedSubview(agreeLabel)
    }

}
extension BidStep2VC{
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

//MARK: - UIPickerViewDelegate  UIPickerViewDataSource
extension BidStep2VC: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == groupPicker{
            return group.count
        }else{
            return type.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == groupPicker{
            return group[row]
        }else {
            return type[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == groupPicker{
            groupTextfield.text = group[row]
            groupTextfield.resignFirstResponder()
        }else{
            typeTextfield.text = type[row]
            typeTextfield.resignFirstResponder()
        }
    }
    
}


//MARK: UITextFieldDelegate
extension BidStep2VC: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if groupTextfield.text != "" && typeTextfield.text != "" && nameTextfield.text != ""{
            nextButton.alpha = 1
            nextButton.isEnabled = true
        }else{
            nextButton.alpha = 0.5
            nextButton.isEnabled = false
        }
    }
}
