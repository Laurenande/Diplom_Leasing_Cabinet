//
//  AgentContractVC.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 29.09.2023.
//

import UIKit
/**
 The class creates a screen for joining the Agency Agreement with the choice: Individual Entrepreneur, Individual and Legal Entity
 */
class AgentContractVC: UIViewController {
    
    ///All objects are added to this scroll
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll
            .backgroundColor = .white
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    ///All objects are added to this UIView so that they all fit on the screen. And after this UIView is added to UIScrollView
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let formStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        stack.isLayoutMarginsRelativeArrangement = true;
        return stack
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        //label.font = .italicSystemFont(ofSize: 14)
        label.textAlignment = .justified
        label.sizeToFit()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = NSMutableAttributedString()
                                .bold("Присоединение к агентскому договору — обязательное условие для получения агентского вознаграждения.\n\n")
                                .normal("Необходимо присоединиться к договору до момента реализации первой сделки. Для рассмотрения заявок и предварительного общения с клиентами, присоединяться к договору необязательно.\nЧтобы присоединиться к договору, необходимо заполнить все данные, приведенные в форме ниже и согласиться к присоединению с помощью смс. Отправка смс будет приравнена к простой электронной подписи.")
                                
        
        return label
    }()
    
    private let propertyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .link
        label.font = .systemFont(ofSize: 15)
        //label.font = .italicSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.sizeToFit()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = NSMutableAttributedString().underlined("Ознакомиться с условиями договора")
        return label
    }()
    
    private let property2Label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 15)
        label.text = "Договор может быть заключен с резидентом Российской Федерации в любом статусе: физическое лицо, юридической лицо, индивидуальный предприниматель.\n(Наиболее предпочтительной формой является договор с ИП.)\n\nДля присоединения к договору, необходимо выбрать свой статус, указать систему налогообложения и далее заполнять данные согласно форме. После отправки вами смс, подтверждающей ваше присоединение, договор уйдет на модерацию и форма не будет доступна для редактирования. Скорректировать данные можно будет через запрос в службу поддержки.\nДоговоры проходят модерацию в рабочие дни, с 9 до 18 часов по мск. По факту прохождения проверки, в интерфейсе вашего кабинета появится соответствующее уведомление.\n"
        //label.font = .italicSystemFont(ofSize: 14)
        label.textAlignment = .justified
        label.sizeToFit()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    //Contract element
    private let face = ["Физ. Лицо", "Юр. Лицо", "ИП"]
    private let contractLabel = FormLabel(text: "Выберите Ваш статус*")
    private let contractTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "Физ. Лицо", keyboard: .adc)
        return textfield
    }()
    private let facePicker = UIPickerView()
    
    //Next button
    private lazy var confirmButton: TehnoBlueButton = {
        let button = TehnoBlueButton(title: "Присоединится")
        button.alpha = 0.5
        button.isEnabled = false
        button.addTarget(self,action: #selector(buttonAction),for: .touchUpInside)
        return button
    }()
    @objc func buttonAction() {
        var VCReg = UIViewController()
        switch contractTextfield.text {
        case "Физ. Лицо":
            VCReg = AgentFormPhysical()
        case "ИП":
            VCReg = AgentFromIPVC()
        case "Юр. Лицо":
            VCReg = AgentFromURVC()
        default:
            VCReg = AgentFromIPVC()
        }
        confirmButton.zoomInWithEasing()
        navigationController?.pushViewController(VCReg, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Агенсткий договор"
        view.backgroundColor = .white
        facePicker.delegate = self
        facePicker.dataSource = self
        contractTextfield.inputView = facePicker
        contractTextfield.delegate = self
        setViews()
        setConstraints()
        // Do any additional setup after loading the view.
    }
    
    func setViews(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(formStack)
        contentView.addSubview(confirmButton)
        
        formStack.addArrangedSubview(titleLabel)
        formStack.addArrangedSubview(propertyLabel)
        formStack.addArrangedSubview(property2Label)
        formStack.addArrangedSubview(contractLabel)
        formStack.addArrangedSubview(contractTextfield)
    }
}

extension AgentContractVC {
    func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 850),
            
            formStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            formStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            formStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
            
            confirmButton.topAnchor.constraint(equalTo: formStack.bottomAnchor, constant: 50),
            confirmButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70),
            confirmButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70),
            confirmButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
//MARK: - UIPickerViewDelegate  UIPickerViewDataSource
extension AgentContractVC: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return face.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return face[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        contractTextfield.text = face[row]
        contractTextfield.resignFirstResponder()
    }
}

//MARK: UITextFieldDelegate
extension AgentContractVC: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentTextCount = textField.text?.count ?? 0
        
        if range.length + range.location > currentTextCount{
             return false
        }
        let newLength = currentTextCount + string.count - range.length
        return newLength <= 6
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text != ""{
            confirmButton.alpha = 1
            confirmButton.isEnabled = true
        }else{
            confirmButton.alpha = 0.5
            confirmButton.isEnabled = false
        }
    }
}
