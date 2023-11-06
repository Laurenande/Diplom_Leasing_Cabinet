//
//  BidStep4VC.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 09.10.2023.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers
class BidStep4VC: UIViewController {
    
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
    
    
    private let sposobLable = FormLabel(text: "Способ выплаты агенсткого вознагрождения")
    private lazy var agentUrFaceButoon: RadioButton = {
        let button = RadioButton()
        button.isSelected = true
        button.addTarget(self,action: #selector(selectAgent),for: .touchUpInside)
        button.setImage(UIImage(named: "radio_button_on"), for: .selected)
        return button
    }()
    private let agentUrFaceLabel = AskLabel(text: "Агент в форме Юр. лицо")
    private let radioButton1Stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        stack.distribution = .fillProportionally
        return stack
    }()
    private lazy var agentFisFaceButoon: RadioButton = {
        let button = RadioButton()
        button.addTarget(self,action: #selector(selectAgent),for: .touchUpInside)
        return button
    }()
    private let agentFisFaceLabel = AskLabel(text: "Агент в форме Физ. лицо")
    private let radioButton2Stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        stack.distribution = .fillProportionally
        return stack
    }()
    private lazy var agentIPButoon: RadioButton = {
        let button = RadioButton()
        button.addTarget(self,action: #selector(selectAgent),for: .touchUpInside)
        return button
    }()
    private let agentIPLabel = AskLabel(text: "Агент в форме ИП")
    private let radioButton3Stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        stack.distribution = .fillProportionally
        return stack
    }()
    
    private let noteLable = FormLabel(text: "Примечание")
    private let noteTextView: UITextView = {
        let textview = UITextView()
        textview.contentInsetAdjustmentBehavior = .automatic
        textview.textAlignment = NSTextAlignment.justified
        textview.backgroundColor = UIColor.white
        textview.layer.borderColor = UIColor.systemFill.cgColor
        textview.layer.borderWidth = CGFloat(1)
        textview.textColor = UIColor.black
        textview.font = UIFont(name: "Verdana", size: 17)
        textview.isSelectable = true
        textview.isEditable = false
        textview.dataDetectorTypes = UIDataDetectorTypes.link
        textview.layer.cornerRadius = 10
        textview.autocorrectionType = UITextAutocorrectionType.yes
        textview.spellCheckingType = UITextSpellCheckingType.yes
        textview.isEditable = true
        textview.translatesAutoresizingMaskIntoConstraints = false
        return textview
    }()
    var placeholderLabel : UILabel!
    private let balanceLabel = FormLabel(text: "Баланс клиента за последний отчетный период")
    private let balanceTextfield: CustomTextField = {
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
    private var selectTextfieldFile = 0
    @objc func selectFile1() {
        //let VCReg = AgentFormPhysical()
        //navigationController?.pushViewController(VCReg, animated: true)
        openDocumentPicker(tag: 1)
    }
    
    private let KPLabel = FormLabel(text: "КП по предмету лизинга")
    private let KPTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "Выберите файл ", keyboard: .adc)
        return textfield
    }()
    private lazy var selectFileButton1: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Выбрать файл", for: .normal)
        var configuration = UIButton.Configuration.plain() // there are several options to choose from instead of .plain()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)
        button.configuration = configuration
        button.addTarget(self ,action: #selector(selectFile2),for: .touchUpInside)
        return button
    }()
    @objc func selectFile2() {
        //let VCReg = AgentFormPhysical()
        //navigationController?.pushViewController(VCReg, animated: true)
        openDocumentPicker(tag: 2)
    }
    
    private let managerLabel = FormLabel(text: "Ваш менеджер")
    private let managerTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "Денис", keyboard: .number)
        return textfield
    }()
    
    private let managerDownLabel: UILabel = {
        let label = UILabel()
        label.text = "Отставив поле пустым, Вы будите закреплены за нашим лучшем специалистом"
        label.font = UIFont.systemFont(ofSize: 10)
        label.sizeToFit()
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nextButton: TehnoBlueButton = {
        let button = TehnoBlueButton(title: "Отправить")
        button.addTarget(self,action: #selector(buttonAction),for: .touchUpInside)
        return button
    }()
    @objc func buttonAction() {
        let VCReg = AgentContractVC()
        nextButton.zoomInWithEasing()
        navigationController?.pushViewController(VCReg, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Новая заявка"
        addPlaceholderTextView()
        setViews()
        setConstraints()
        
        // Do any additional setup after loading the view.
    }
    
    func setViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(formStack)
        contentView.addSubview(nextButton)
        
        formStack.addArrangedSubview(sposobLable)
        formStack.addArrangedSubview(radioButton1Stack)
        radioButton1Stack.addArrangedSubview(agentUrFaceButoon)
        radioButton1Stack.addArrangedSubview(agentUrFaceLabel)
        formStack.addArrangedSubview(radioButton2Stack)
        radioButton2Stack.addArrangedSubview(agentFisFaceButoon)
        radioButton2Stack.addArrangedSubview(agentFisFaceLabel)
        formStack.addArrangedSubview(radioButton3Stack)
        radioButton3Stack.addArrangedSubview(agentIPButoon)
        radioButton3Stack.addArrangedSubview(agentIPLabel)
        formStack.addArrangedSubview(noteLable)
        formStack.addArrangedSubview(noteTextView)
        formStack.addArrangedSubview(balanceLabel)
        formStack.addArrangedSubview(balanceTextfield)
        balanceTextfield.rightView = selectFileButton
        balanceTextfield.rightViewMode = .unlessEditing
        formStack.addArrangedSubview(KPLabel)
        formStack.addArrangedSubview(KPTextfield)
        KPTextfield.rightView = selectFileButton1
        KPTextfield.rightViewMode = .unlessEditing
        formStack.addArrangedSubview(managerLabel)
        formStack.addArrangedSubview(managerTextfield)
        formStack.addArrangedSubview(managerDownLabel)
    }
    func addPlaceholderTextView() {
        noteTextView.delegate = self
        placeholderLabel = UILabel()
        placeholderLabel.text = "Дополнительная информация"
        placeholderLabel.font = .systemFont(ofSize: (noteTextView.font?.pointSize)!)
        placeholderLabel.sizeToFit()
        noteTextView.addSubview(placeholderLabel)
        placeholderLabel.frame.origin = CGPoint(x: 5, y: (noteTextView.font?.pointSize)! / 2)
        placeholderLabel.textColor = .tertiaryLabel
        placeholderLabel.isHidden = !noteTextView.text.isEmpty
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
    @objc func selectAgent(_ sender: UIButton) {
        if sender == agentUrFaceButoon{
            agentUrFaceButoon.isSelected = true
            agentFisFaceButoon.isSelected = false
            agentIPButoon.isSelected = false
        }else if sender == agentFisFaceButoon{
            agentUrFaceButoon.isSelected = false
            agentFisFaceButoon.isSelected = true
            agentIPButoon.isSelected = false
        }else{
            agentUrFaceButoon.isSelected = false
            agentFisFaceButoon.isSelected = false
            agentIPButoon.isSelected = true
        }
        
    }
    
}
extension BidStep4VC{
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
            contentView.heightAnchor.constraint(equalToConstant: 700),
            
            formStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            formStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            formStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
            
            nextButton.topAnchor.constraint(equalTo: formStack.bottomAnchor, constant: 50),
            nextButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70),
            nextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            
            noteTextView.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
}
extension BidStep4VC: UIDocumentPickerDelegate{
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        dismiss(animated: true)
        
    }
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        if let selectedFileURL = urls.first {
            let fileName = selectedFileURL.lastPathComponent
            print("Выбран файл с именем: \(selectedFileURL.absoluteURL)")
            if selectTextfieldFile == 1{
                //balanceTextfield.isSelected = true
                balanceTextfield.text = fileName
            } else  {
                //KPTextfield.isSelected = true
                KPTextfield.text = fileName
            }
        }
    }
}
extension BidStep4VC: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel?.isHidden = !textView.text.isEmpty
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        placeholderLabel?.isHidden = !textView.text.isEmpty
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        placeholderLabel?.isHidden = true
    }
}

