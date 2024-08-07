//
//  AgentFromIPVC.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 25.10.2023.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers
class AgentFromIPVC: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll
            .backgroundColor = .systemBackground
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let formStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 9
        stack.isLayoutMarginsRelativeArrangement = true;
        return stack
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //Textfield FIO
    private let fio = ["Упрощённая система налогообложения", "Общая система налогообложения", "Иная система налогообложения"]
    private let fioPicker = UIPickerView()
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
        stack.layer.borderWidth = 0.5
        stack.layer.cornerRadius = 5
        stack.backgroundColor = .secondarySystemBackground
        stack.layer.borderColor = UIColor.placeholderText.cgColor
        stack.isLayoutMarginsRelativeArrangement = true;
        return stack
    }()
    private let nameInnStack: UIStackView = {
        let stack = UIStackView()
        stack.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 0)
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
        stack.layoutMargins = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 5)
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
    
    private var selectTextfieldFile = 0
    private let ogrnipLabel = FormLabel(text: "ОГРНИП")
    private let ogrnipTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "Выберите файл ", keyboard: .adc)
        return textfield
    }()
    private lazy var selectFileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Выбрать файл", for: .normal)
        var configuration = UIButton.Configuration.plain() // there are several options to choose from instead of .plain()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)
        button.configuration = configuration
        button.addTarget(self,action: #selector(selectFile1),for: .touchUpInside)
        return button
    }()
    @objc func selectFile1() {
        //let VCReg = AgentFormPhysical()
        //navigationController?.pushViewController(VCReg, animated: true)
        openDocumentPicker(tag: 1)
    }
    
    //Textfield FIO
    private let serialPassportLabel = FormLabel(text: "Серия паспорта")
    private let serialPassportTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "4545", keyboard: .adc)
        return textfield
    }()
    //Textfield INN
    private let numberPassportLabel = FormLabel(text: "Номер паспорта")
    private let numberPassportTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "469863", keyboard: .number)
        return textfield
    }()
    //Textfield date pasport
    private let datePasportLabel = FormLabel(text: "Дата выдачи")
    private let datePasportTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "12.12.2023", keyboard: .adc)
        return textfield
    }()
    //Textfield by pasport
    private let byPasportLabel = FormLabel(text: "Кем выдан")
    private let byPasportTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "МВД России", keyboard: .adc)
        return textfield
    }()
    //Textfield date birthday
    private let birthdayLabel = FormLabel(text: "Дата рождения")
    private let birthdayTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "17.11.2000", keyboard: .adc)
        return textfield
    }()
    //Textfield place birth
    private let placeBirthLabel = FormLabel(text: "Место рождения")
    private let placeBirthTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "Москва", keyboard: .adc)
        return textfield
    }()
    //Textfield pdfPassport2_3 registartion
    private let stackFile1: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        //stack.spacing = 5
        //stack.isLayoutMarginsRelativeArrangement = true;
        return stack
    }()
    private let pdfPassport2_3Label = FormLabel(text: "Cкан 2-3 стр. паспорта")
    private let pdfPassport2_3Textfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "Выберите файл ", keyboard: .adc)
        return textfield
    }()
    private lazy var selectFileButton3: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Выбрать файл", for: .normal)
        var configuration = UIButton.Configuration.plain() // there are several options to choose from instead of .plain()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)
        button.configuration = configuration
        button.addTarget(self,action: #selector(selectFile3),for: .touchUpInside)
        return button
    }()
    @objc func selectFile3() {
        //let VCReg = AgentFormPhysical()
        //navigationController?.pushViewController(VCReg, animated: true)
        openDocumentPicker(tag: 2)
    }
    //Textfield pdfPassport4_5 registartion
    private let pdfPassport4_5Label = FormLabel(text: "Cкан 4-5 стр. паспорта")
    private let pdfPassport4_5Textfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "Выберите файл", keyboard: .adc)
        return textfield
    }()
    private lazy var selectFileButton2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Выбрать файл", for: .normal)
        var configuration = UIButton.Configuration.plain() // there are several options to choose from instead of .plain()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)
        button.configuration = configuration
        button.addTarget(self,action: #selector(selectFile2),for: .touchUpInside)
        return button
    }()
    @objc func selectFile2() {
        //let VCReg = AgentFormPhysical()
        //navigationController?.pushViewController(VCReg, animated: true)
        openDocumentPicker(tag: 3)
    }
    //Textfield adress registartion
    private let adressLabel = FormLabel(text: "Адрес регистрации")
    private let adressTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "г. Москва, ул. Кременчукская, д. 4", keyboard: .adc)
        return textfield
    }()
    
    //Textfield by pasport
    private let accountLabel = FormLabel(text: "Расчетный стчет получаетяля")
    private let accountTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "134849386940", keyboard: .adc)
        return textfield
    }()
    //Textfield bik bank
    private let bikBankLabel = FormLabel(text: "БИК банка получателя")
    private let bikBankTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "89086374", keyboard: .adc)
        return textfield
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
        view.backgroundColor = .systemBackground
        navigationItem.title = "Договор для ИП"
        innStackLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        innTextfield.delegate = self
        setViews()
        setConstraints()
        // Do any additional setup after loading the view.
    }
    
    func openDocumentPicker(tag: Int) {
        let supportedTypes: [UTType] = [UTType.pdf]
        let pickerViewController = UIDocumentPickerViewController(forOpeningContentTypes: supportedTypes, asCopy: true)
        pickerViewController.delegate = self
        pickerViewController.allowsMultipleSelection = false
        pickerViewController.shouldShowFileExtensions = true
        selectTextfieldFile = tag
        //self.present(pickerViewController, animated: true, completion: nil)
        self.present(pickerViewController, animated: true) {
            //self.pdfPassport2_3Textfield.becomeFirstResponder()
        }
    }
    
    func setViews(){
        fioPicker.delegate = self
        fioPicker.dataSource = self
        fioTextfield.inputView = fioPicker
        fioTextfield.delegate = self
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(formStack)
        contentView.addSubview(confirmButton)
        
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
        
        formStack.addArrangedSubview(ogrnipLabel)
        formStack.addArrangedSubview(ogrnipTextfield)
        ogrnipTextfield.rightView = selectFileButton
        ogrnipTextfield.rightViewMode = .unlessEditing
        formStack.addArrangedSubview(serialPassportLabel)
        formStack.addArrangedSubview(serialPassportTextfield)
        formStack.addArrangedSubview(numberPassportLabel)
        formStack.addArrangedSubview(numberPassportTextfield)
        formStack.addArrangedSubview(datePasportLabel)
        formStack.addArrangedSubview(datePasportTextfield)
        formStack.addArrangedSubview(byPasportLabel)
        formStack.addArrangedSubview(byPasportTextfield)
        formStack.addArrangedSubview(birthdayLabel)
        formStack.addArrangedSubview(birthdayTextfield)
        formStack.addArrangedSubview(placeBirthLabel)
        formStack.addArrangedSubview(placeBirthTextfield)
        
        formStack.addArrangedSubview(pdfPassport2_3Label)
        formStack.addArrangedSubview(pdfPassport2_3Textfield)
        pdfPassport2_3Textfield.rightView = selectFileButton3
        pdfPassport2_3Textfield.rightViewMode = .unlessEditing
        formStack.addArrangedSubview(pdfPassport4_5Label)
        formStack.addArrangedSubview(pdfPassport4_5Textfield)
        pdfPassport4_5Textfield.rightView = selectFileButton2
        pdfPassport4_5Textfield.rightViewMode = .unlessEditing
        
        formStack.addArrangedSubview(accountLabel)
        formStack.addArrangedSubview(accountTextfield)
        formStack.addArrangedSubview(bikBankLabel)
        formStack.addArrangedSubview(bikBankTextfield)
        formStack.addArrangedSubview(selectFileButton)
        
        
    }
    
    func convertDate(date: Int) -> String{
        let timestamp = date
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp) / 1000)
        
        // Шаг 2: Извлечь день, месяц и год
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: date)
        
        if let day = components.day, let month = components.month, let year = components.year {
            // Шаг 3: Сформировать строку в формате "день.месяц.год"
            let formattedDate = String(format: "%02d.%02d.%d", day, month, year)
            return formattedDate
        }
        return ""
    }
}


extension AgentFromIPVC {
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
            //contentView.heightAnchor.constraint(equalToConstant: 800),
            
            formStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            formStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            formStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
            formStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -150),
            
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
//MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension AgentFromIPVC: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return fio.count
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fio[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        fioTextfield.text = fio[row]
        fioTextfield.resignFirstResponder()
    }
}


extension AgentFromIPVC: UIDocumentPickerDelegate{
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        dismiss(animated: true)
        
    }
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        if let selectedFileURL = urls.first {
            let fileName = selectedFileURL.lastPathComponent
            print("Выбран файл с именем: \(fileName)")
            if selectTextfieldFile == 1{
                ogrnipTextfield.text = fileName
            } else if selectTextfieldFile == 2{
                pdfPassport2_3Textfield.text = fileName
            }else{
                pdfPassport4_5Textfield.text = fileName
            }
        }
    }
}


extension AgentFromIPVC: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        
        if textField == innTextfield{
            NetworkServideWithAF.shared.fetchData(parapms: innTextfield.text!) { result in
                
                switch result {
                case .success(let data):
                    //for index in 0...data.suggestions.count-1{
                    if !data.suggestions.isEmpty {
                        self.innAPILabel.text = data.suggestions[0].data.inn
                        self.dateAPILabel.text = self.convertDate(date: data.suggestions[0].data.state.registrationDate)
                        self.adressAPILabel.text = data.suggestions[0].data.address.value
                    }
                    //}
                    
                case .failure(let error):
                    print(error)
                }
                
            }
        }
    }
}
