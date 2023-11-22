//
//  BidStep3VC.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 05.10.2023.
//

import UIKit

class BidStep3VC: UIViewController {

    
    private let formStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        stack.isLayoutMarginsRelativeArrangement = true;
        return stack
    }()
    
    //Textfield group
    private let group = ["1%", "1.25%", "1.5%", "1.75%", "2%", "2.25%", "2.5%", "2.75%", "3%"]
    private let groupPicker = UIPickerView()
    private let stavkaLabel = FormLabel(text: "Ставка вознагрождения")
    private let stavkaTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "2%", keyboard: .number)
        return textfield
    }()
    //Textfield type
    private let type = ["0%", "5%", "10%", "15%", "20%", "25%", "30%", "35%", "40%", "45%", "49%"]
    private let typePicker = UIPickerView()
    private let avansLabel = FormLabel(text: "Аванс")
    private let avansTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "30%", keyboard: .adc)
        return textfield
    }()
    //Textfield name
    private let summaLabel = FormLabel(text: "Сумма вознагрождения")
    private let summaTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "", keyboard: .number)
        return textfield
    }()
    //Textfield name
    private let date = ["12 месяцев", "15 месяцев", "18 месяцев", "21 месяц", "24 месяца", "27 месяцев", "30 месяцев", "33 месяца", "36 месяцев", "39 месяцев", "42 месяца", "45 месяцев", "48 месяцев", "51 месяц", "54 месяца", "57 месяцев", "60 месяцев"]
    private let datePicker = UIPickerView()
    private let dateLabel = FormLabel(text: "Срок лизинга")
    private let dateTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "12 месяцев", keyboard: .number)
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
        let bidVC = BidStep4VC()
        nextButton.zoomInWithEasing()
        navigationController?.pushViewController(bidVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Новая заявка"
        setViews()
        setConstraints()
        // Do any additional setup after loading the view.
    }
   
    func setViews() {
        groupPicker.delegate = self
        groupPicker.dataSource = self
        stavkaTextfield.inputView = groupPicker
        stavkaTextfield.delegate = self
        
        typePicker.delegate = self
        typePicker.dataSource = self
        avansTextfield.inputView = typePicker
        avansTextfield.delegate = self
        
        datePicker.delegate = self
        datePicker.dataSource = self
        dateTextfield.inputView = datePicker
        dateTextfield.delegate = self
        
        summaTextfield.delegate = self
        
        view.addSubview(formStack)
        view.addSubview(nextButton)
        formStack.addArrangedSubview(stavkaLabel)
        formStack.addArrangedSubview(stavkaTextfield)
        formStack.addArrangedSubview(avansLabel)
        formStack.addArrangedSubview(avansTextfield)
        formStack.addArrangedSubview(summaLabel)
        formStack.addArrangedSubview(summaTextfield)
        formStack.addArrangedSubview(dateLabel)
        formStack.addArrangedSubview(dateTextfield)
        formStack.addArrangedSubview(checkBoxStack)
        checkBoxStack.addArrangedSubview(checkBox1)
        checkBoxStack.addArrangedSubview(agreeLabel)
    }

}
extension BidStep3VC{
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
extension BidStep3VC: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == groupPicker{
            return group.count
        }else if pickerView == typePicker{
            return type.count
        } else{
            return date.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == groupPicker{
            return group[row]
        }else if pickerView == typePicker{
            return type[row]
        }else {
            return date[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == groupPicker{
            stavkaTextfield.text = group[row]
            stavkaTextfield.resignFirstResponder()
        }else if pickerView == typePicker{
            avansTextfield.text = type[row]
            avansTextfield.resignFirstResponder()
        }else{
            dateTextfield.text = date[row]
            dateTextfield.resignFirstResponder()
        }
    }
}

//MARK: UITextFieldDelegate
extension BidStep3VC: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if stavkaTextfield.text != "" && avansTextfield.text != "" && dateTextfield.text != "" && summaTextfield.text != ""{
            nextButton.alpha = 1
            nextButton.isEnabled = true
        }else{
            nextButton.alpha = 0.5
            nextButton.isEnabled = false
        }
    }
}
