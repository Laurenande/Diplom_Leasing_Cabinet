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
    private let group = ["Лизинг транспорта и техники", "Юр. Лицо", "ИП"]
    private let groupPicker = UIPickerView()
    private let stavkaLabel = FormLabel(text: "Ставка вознагрождения")
    private let stavkaTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "798635783", keyboard: .number)
        return textfield
    }()
    //Textfield type
    private let type = ["Легковые автомобили", "Юр. Лицо", "ИП"]
    private let typePicker = UIPickerView()
    private let avansLabel = FormLabel(text: "Аванс")
    private let avansTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "Иванов Иван Иванович", keyboard: .adc)
        return textfield
    }()
    //Textfield name
    private let summaLabel = FormLabel(text: "Сумма вознагрождения")
    private let summaTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "798635783", keyboard: .number)
        return textfield
    }()
    //Textfield name
    private let dateLabel = FormLabel(text: "Срок лизинга")
    private let dateTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "798635783", keyboard: .number)
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
        view.backgroundColor = .systemBackground
        navigationItem.title = "Новая заявка"
        setViews()
        setConstraints()
        // Do any additional setup after loading the view.
    }
   
    func setViews() {
        groupPicker.delegate = self
        groupPicker.dataSource = self
        stavkaTextfield.inputView = groupPicker
        
        typePicker.delegate = self
        typePicker.dataSource = self
        avansTextfield.inputView = typePicker
        
        
        
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
            stavkaTextfield.text = group[row]
            stavkaTextfield.resignFirstResponder()
        }else{
            avansTextfield.text = type[row]
            avansTextfield.resignFirstResponder()
        }
    }
}
