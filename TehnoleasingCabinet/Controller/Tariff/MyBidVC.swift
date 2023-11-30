//
//  MyBidVC.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 29.09.2023.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers
class MyBidVC: UIViewController {

    
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
    
    //Textfield INN
    private let innLabel = FormLabel(text: "ИНН или наименование:")
    private let innTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "798635783", keyboard: .number)
        return textfield
    }()
    //Textfield price
    private let priceLabel = FormLabel(text: "Стоимость предмета лизинга:")
    private let priceTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "1 000 000 Руб.", keyboard: .adc)
        return textfield
    }()
    
    //Textfield FIO
    private let fioLabel = FormLabel(text: "ФИО:")
    private let fioTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "Иванов Иван Иванович", keyboard: .adc)
        return textfield
    }()
    //Textfield phone
    private let phoneLabel = FormLabel(text: "Телефон контактного лица:")
    private let phoneTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "+7 (495) 107-11-76", keyboard: .number)
        return textfield
    }()
    //Textfield group
    private let group = ["1 %", "1.25 %", "1.5 %", "1.75 %", "2 %", "2.25 %", "2.5 %", "2.75 %", "3 %"]
    private let groupPicker = UIPickerView()
    private let stavkaLabel = FormLabel(text: "Ставка вознагрождения:")
    private let stavkaTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "2 %", keyboard: .number)
        return textfield
    }()
    //Textfield name
    private let nameLabel = FormLabel(text: "Наименование предмета лизинга:")
    private let nameTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "Maserati", keyboard: .number)
        return textfield
    }()
    
    //Textfield type
    private let type = ["0 %", "5 %", "10 %", "15 %", "20 %", "25 %", "30 %", "35 %", "40 %", "45 %", "49 %"]
    private let typePicker = UIPickerView()
    private let avansLabel = FormLabel(text: "Аванс:")
    private let avansTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "30 %", keyboard: .adc)
        return textfield
    }()
    
    //Textfield name
    private let date = ["12 месяцев", "15 месяцев", "18 месяцев", "21 месяц", "24 месяца", "27 месяцев", "30 месяцев", "33 месяца", "36 месяцев", "39 месяцев", "42 месяца", "45 месяцев", "48 месяцев", "51 месяц", "54 месяца", "57 месяцев", "60 месяцев"]
    private let datePicker = UIPickerView()
    private let dateLabel = FormLabel(text: "Срок лизинга:")
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
    private let checkBoxStack2: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        stack.distribution = .fillProportionally
        return stack
    }()
    private let checkBoxStack3: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        stack.distribution = .fillProportionally
        return stack
    }()
    private let checkBox1 = CheckBoxButton()
    private let agreeLabel = AskLabel(text: "У клиента есть поручитель?")
    
    private let checkBox2 = CheckBoxButton()
    private let agreeLabe2 = AskLabel(text: "Предмет лизига был в употреблении?")
    
    private let checkBox3 = CheckBoxButton()
    private let agreeLabe3 = AskLabel(text: "Возвратный лизинг?")
    
    private let noteLable = FormLabel(text: "Примечание")
    private let noteTextView: UITextView = {
        let textview = UITextView()
        textview.contentInsetAdjustmentBehavior = .automatic
        textview.textAlignment = NSTextAlignment.justified
        textview.backgroundColor = UIColor.secondarySystemBackground
        textview.layer.borderColor = UIColor.systemFill.cgColor
        textview.layer.borderWidth = CGFloat(1)
        textview.textColor = UIColor.secondaryLabel
        textview.font = UIFont(name: "Verdana", size: 14)
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
        let textfield = CustomTextField(placeholder: "Денис", keyboard: .adc)
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
        button.alpha = 0.5
        button.isEnabled = false
        return button
    }()
    @objc func buttonAction() {
        let VCReg = BidSendSMS()
        nextButton.zoomInWithEasing()
        navigationController?.pushViewController(VCReg, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        navigationItem.title = "Новая заявка на лизинг"
        
        setViews()
        setConstraints()
        addPlaceholderTextView()
        initializeHideKeyboard()
        innTextfield.delegate = self
        fioTextfield.delegate = self
        phoneTextfield.delegate = self
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
    
    func setViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
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
        
        contentView.addSubview(formStack)
        contentView.addSubview(nextButton)
        formStack.addArrangedSubview(innLabel)
        formStack.addArrangedSubview(innTextfield)
        formStack.addArrangedSubview(priceLabel)
        formStack.addArrangedSubview(priceTextfield)
        formStack.addArrangedSubview(fioLabel)
        formStack.addArrangedSubview(fioTextfield)
        formStack.addArrangedSubview(phoneLabel)
        formStack.addArrangedSubview(phoneTextfield)
        formStack.addArrangedSubview(stavkaLabel)
        formStack.addArrangedSubview(stavkaTextfield)
        
        formStack.addArrangedSubview(nameLabel)
        formStack.addArrangedSubview(nameTextfield)
        formStack.addArrangedSubview(avansLabel)
        formStack.addArrangedSubview(avansTextfield)
        formStack.addArrangedSubview(dateLabel)
        formStack.addArrangedSubview(dateTextfield)
        
        
        
        formStack.addArrangedSubview(checkBoxStack)
        formStack.addArrangedSubview(checkBoxStack2)
        formStack.addArrangedSubview(checkBoxStack3)
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
        
        checkBoxStack.addArrangedSubview(checkBox1)
        checkBoxStack.addArrangedSubview(agreeLabel)
        checkBoxStack2.addArrangedSubview(checkBox2)
        checkBoxStack2.addArrangedSubview(agreeLabe2)
        checkBoxStack3.addArrangedSubview(checkBox3)
        checkBoxStack3.addArrangedSubview(agreeLabe3)
    }
    
    func initializeHideKeyboard(){
     //Declare a Tap Gesture Recognizer which will trigger our dismissMyKeyboard() function
     let tap: UITapGestureRecognizer = UITapGestureRecognizer(
     target: self,
     action: #selector(dismissMyKeyboard))
     //Add this tap gesture recognizer to the parent view
     view.addGestureRecognizer(tap)
     }
     @objc func dismissMyKeyboard(){
     //endEditing causes the view (or one of its embedded text fields) to resign the first responder status.
     //In short- Dismiss the active keyboard.
     view.endEditing(true)
     }

}
extension MyBidVC {
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
            //contentView.heightAnchor.constraint(equalToConstant: 1000),
            
            formStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            formStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            formStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
            formStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -200),
            
            noteTextView.heightAnchor.constraint(equalToConstant: 150),
            
            nextButton.topAnchor.constraint(equalTo: formStack.bottomAnchor, constant: 70),
            nextButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70),
            nextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


extension MyBidVC: UITextFieldDelegate{
    
    func textFieldDidChangeSelection(_ textField: UITextField) {

        if innTextfield.text?.count ?? 0 > 7 && fioTextfield.text?.count ?? 0 > 10 && priceTextfield.text?.count ?? 0 > 6 && phoneTextfield.text?.count ?? 0 > 7 && stavkaTextfield.text?.count ?? 0 > 2{
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

extension MyBidVC: UIPickerViewDelegate, UIPickerViewDataSource{
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
extension MyBidVC: UITextViewDelegate{
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
extension MyBidVC: UIDocumentPickerDelegate{
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
