//
//  AgentFormPhysical.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 04.10.2023.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers
class AgentFormPhysical: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .systemBackground
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let formStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 9
        stack.isLayoutMarginsRelativeArrangement = true;
        return stack
    }()
    
    //Textfield FIO
    private let fioLabel = FormLabel(text: "ФИО*")
    private let fioTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "Иванов Иван Иванович", keyboard: .adc)
        return textfield
    }()
    //Textfield INN
    private let innLabel = FormLabel(text: "ИНН*")
    private let innTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "798635783", keyboard: .number)
        return textfield
    }()
    //Textfield SNILS
    private let snilsLabel = FormLabel(text: "СНИЛС*")
    private let snilsTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "37090353", keyboard: .number)
        return textfield
    }()
    //Textfield pasport
    private let pasportLabel = FormLabel(text: "Серия, номер паспорта*")
    private let pasportTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "45 12 123123", keyboard: .number)
        return textfield
    }()
    //Textfield date pasport
    private let datePasportLabel = FormLabel(text: "Дата выдачи*")
    private let datePasportTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "12.12.2023", keyboard: .adc)
        return textfield
    }()
    //Textfield by pasport
    private let byPasportLabel = FormLabel(text: "Кем выдан*")
    private let byPasportTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "МВД России", keyboard: .adc)
        return textfield
    }()
    //Textfield date birthday
    private let birthdayLabel = FormLabel(text: "Дата рождения*")
    private let birthdayTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "17.11.2000", keyboard: .adc)
        return textfield
    }()
    //Textfield place birth
    private let placeBirthLabel = FormLabel(text: "Место рождения*")
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
    private var selectTextfieldFile = 0
    private let pdfPassport2_3Label = FormLabel(text: "Cкан 2-3 стр. паспорта*")
    private let pdfPassport2_3Textfield: CustomTextField = {
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
    //Textfield pdfPassport4_5 registartion
    private let pdfPassport4_5Label = FormLabel(text: "Cкан 4-5 стр. паспорта*")
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
        openDocumentPicker(tag: 2)
    }
    //Textfield adress registartion
    private let adressLabel = FormLabel(text: "Адрес регистрации*")
    private let adressTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "г. Москва, ул. Кременчукская, д. 4", keyboard: .adc)
        return textfield
    }()
    
    //Textfield by pasport
    private let accountLabel = FormLabel(text: "Расчетный стчет получаетяля*")
    private let accountTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "134849386940", keyboard: .adc)
        return textfield
    }()
    //Textfield bik bank
    private let bikBankLabel = FormLabel(text: "БИК банка получателя*")
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
        let VCReg = AgentSMSVC()
        confirmButton.zoomInWithEasing()
        navigationController?.pushViewController(VCReg, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Договор для Физ. лиц"
        setViews()
        setConstraints()
        // Do any additional setup after loading the view.
    }
    
    func postContractPe() {
        let phoneCache = UserDefaults.standard.string(forKey: "phone")!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let parameters = [
            "phone": phoneCache,
            "type": "Физическое Лицо",
            "fio": "\(String(describing: fioTextfield.text))",
            "inn": "\(String(describing: innTextfield.text))",
            "snils": "\(String(describing: snilsTextfield.text))",
            "pass_ser_num": "\(String(describing: pasportTextfield.text))",
            "pass_date": "\(String(describing: datePasportTextfield.text))",
            "pass_issue": "\(String(describing: byPasportTextfield.text))",
            "born_date": "\(String(describing: birthdayTextfield.text))",
            "born_addr": "\(String(describing: placeBirthTextfield.text))",
            "reg_addr": "\(String(describing: adressTextfield.text))",
            "pass_2_3": "test",
            "pass_4_5": "test",
            "payment_account": "\(String(describing: accountTextfield.text))",
            "bik_bank": "\(String(describing: bikBankTextfield.text))",
            "notification": "test",
            "contract_status": "test",
            "created_at": "\(dateFormatter.string(from: NSDate() as Date))"
        ]
        NetworkTehnoDB.shared.createAgentsContract(parapms: parameters) { result in
            print("loxbd")
            switch result {
            case .success(_):
                print("Create")
            case .failure(_):
                print("Error")
            }
        }
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
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(formStack)
        contentView.addSubview(confirmButton)
        
        formStack.addArrangedSubview(fioLabel)
        formStack.addArrangedSubview(fioTextfield)
        formStack.addArrangedSubview(innLabel)
        formStack.addArrangedSubview(innTextfield)
        formStack.addArrangedSubview(snilsLabel)
        formStack.addArrangedSubview(snilsTextfield)
        formStack.addArrangedSubview(pasportLabel)
        formStack.addArrangedSubview(pasportTextfield)
        formStack.addArrangedSubview(datePasportLabel)
        formStack.addArrangedSubview(datePasportTextfield)
        formStack.addArrangedSubview(byPasportLabel)
        formStack.addArrangedSubview(byPasportTextfield)
        
        formStack.addArrangedSubview(pdfPassport2_3Label)
        formStack.addArrangedSubview(pdfPassport2_3Textfield)
        pdfPassport2_3Textfield.rightView = selectFileButton
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
    
}


extension AgentFormPhysical {
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
            contentView.heightAnchor.constraint(equalToConstant: 800),
            
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

extension AgentFormPhysical: UIDocumentPickerDelegate{
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        dismiss(animated: true)
        
    }
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        if let selectedFileURL = urls.first {
            let fileName = selectedFileURL.lastPathComponent
            print("Выбран файл с именем: \(fileName)")
            if selectTextfieldFile == 1{
                pdfPassport2_3Textfield.text = fileName
            } else{
                pdfPassport4_5Textfield.text = fileName
            }
        }
    }
}
