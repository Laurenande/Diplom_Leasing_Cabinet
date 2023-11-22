//
//  AgentFormUR2VC.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 26.10.2023.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers
class AgentFormUR2VC: UIViewController {
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll
            .backgroundColor = .white
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
        stack.spacing = 5
        stack.isLayoutMarginsRelativeArrangement = true;
        return stack
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
    private let ustavLabel = FormLabel(text: "Устав компании")
    private let ustavTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "Выберите файл ", keyboard: .adc)
        return textfield
    }()
    private lazy var selectFileButton4: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Выбрать файл", for: .normal)
        var configuration = UIButton.Configuration.plain() // there are several options to choose from instead of .plain()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)
        button.configuration = configuration
        button.addTarget(self,action: #selector(selectFile4),for: .touchUpInside)
        return button
    }()
    @objc func selectFile4() {
        //let VCReg = AgentFormPhysical()
        //navigationController?.pushViewController(VCReg, animated: true)
        openDocumentPicker(tag: 4)
    }
    private let EIOLabel = FormLabel(text: "Документ, подтверждающий полномочия ЕИО")
    private let EIOTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "Выберите файл ", keyboard: .adc)
        return textfield
    }()
    private lazy var selectFileButton5: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Выбрать файл", for: .normal)
        var configuration = UIButton.Configuration.plain() // there are several options to choose from instead of .plain()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)
        button.configuration = configuration
        button.addTarget(self,action: #selector(selectFile5),for: .touchUpInside)
        return button
    }()
    @objc func selectFile5() {
        //let VCReg = AgentFormPhysical()
        //navigationController?.pushViewController(VCReg, animated: true)
        openDocumentPicker(tag: 5)
    }
    
    //Textfield FIO
    private let doljnostLabel = FormLabel(text: "Должность ЕИО")
    private let doljnostTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "Генеральный директор", keyboard: .adc)
        return textfield
    }()
    //Textfield INN
    private let lastNameLabel = FormLabel(text: "Фамилия")
    private let lastNameTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "Иванов", keyboard: .adc)
        return textfield
    }()
    //Textfield date pasport
    private let firstNameLabel = FormLabel(text: "Имя")
    private let firstNameTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "Иван", keyboard: .adc)
        return textfield
    }()
    //Textfield by pasport
    private let byPasportLabel = FormLabel(text: "Отчество")
    private let byPasportTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "Иванович", keyboard: .adc)
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
        let VCReg = AgentSMSVC()
        confirmButton.zoomInWithEasing()
        navigationController?.pushViewController(VCReg, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Договор для Юр. лиц"
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
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(formStack)
        contentView.addSubview(confirmButton)
        
        formStack.addArrangedSubview(ogrnipLabel)
        formStack.addArrangedSubview(ogrnipTextfield)
        ogrnipTextfield.rightView = selectFileButton
        ogrnipTextfield.rightViewMode = .unlessEditing
        formStack.addArrangedSubview(ustavLabel)
        formStack.addArrangedSubview(ustavTextfield)
        ustavTextfield.rightView = selectFileButton4
        ustavTextfield.rightViewMode = .unlessEditing
        formStack.addArrangedSubview(EIOLabel)
        formStack.addArrangedSubview(EIOTextfield)
        EIOTextfield.rightView = selectFileButton5
        EIOTextfield.rightViewMode = .unlessEditing
        formStack.addArrangedSubview(doljnostLabel)
        formStack.addArrangedSubview(doljnostTextfield)
        formStack.addArrangedSubview(lastNameLabel)
        formStack.addArrangedSubview(lastNameTextfield)
        formStack.addArrangedSubview(firstNameLabel)
        formStack.addArrangedSubview(firstNameTextfield)
        formStack.addArrangedSubview(byPasportLabel)
        formStack.addArrangedSubview(byPasportTextfield)
        
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
    
}


extension AgentFormUR2VC {
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

extension AgentFormUR2VC: UIDocumentPickerDelegate{
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        dismiss(animated: true)
        
    }
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        if let selectedFileURL = urls.first {
            let fileName = selectedFileURL.lastPathComponent
            print("Выбран файл с именем: \(fileName)")
            
            switch selectTextfieldFile {
            case 1:
                ogrnipTextfield.text = fileName
            case 2:
                pdfPassport2_3Textfield.text = fileName
            case 3:
                pdfPassport4_5Textfield.text = fileName
            case 4:
                ustavTextfield.text = fileName
            case 5:
                EIOTextfield.text = fileName
            default:
                ogrnipTextfield.text = fileName
            }
        }
    }
}
