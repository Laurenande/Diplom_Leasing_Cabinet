//
//  RegVC.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 03.09.2023.
//

import UIKit
import CryptoKit

class RegVC: UIViewController {
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoText")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 19)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.frame.size = CGSize(width: 100, height: 200)
        label.text = "Регистрация"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sendKod: TehnoBlueButton = {
        let button = TehnoBlueButton(title: "Отправить код")
        button.alpha = 0.5
        button.isEnabled = false
        button.addTarget(self, action: #selector(buttonActionSendSMS), for: .touchUpInside)
        return button
    }()
    //Create form element
    private let formStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        stack.isLayoutMarginsRelativeArrangement = true;
        return stack
    }()
    //FIO element
    private let fioLabel = FormLabel(text: "ФИО:")
    private let fioTextfield = CustomTextField(placeholder: "Куракин Егор Андреевич", keyboard: .adc)
    
    //Email element
    private let mailLabel = FormLabel(text: "E-mail:")
    private let mailTextfield = CustomTextField(placeholder: "info@tehnoleasing.ru", keyboard: .adc)
    
    //Email element
    private let phoneLabel = FormLabel(text: "Телефон:")
    let phoneTextfield = CustomTextField(placeholder: "+7 (999) 999-99-99", keyboard: .number)
    
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
    lazy var agreeLabel: UILabel =  {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .link
        label.textAlignment = .left
        label.numberOfLines = 0
        label.isUserInteractionEnabled = true
        let guestureRecord = UITapGestureRecognizer(target: self, action: #selector(policyTap(_:)))
        label.addGestureRecognizer(guestureRecord)
        let attributes:[NSAttributedString.Key : Any] = [.underlineStyle : NSUnderlineStyle.single.rawValue]
        label.attributedText = NSMutableAttributedString(string: "Ознакомлен с политикой обработки персональных данных и согласен на обработку персональных данных как Юр.Лицо/Физ.Лицо", attributes: attributes)
        return label
    }()
    @objc func policyTap(_ sender: Any){
        let detailViewController = PolicyIpAndFisVC()
        let nav = UINavigationController(rootViewController: detailViewController)
        nav.modalPresentationStyle = .pageSheet
        present(nav, animated: true, completion: nil)
        
    }
    //create ask check
    private let checkBoxStack2: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        stack.distribution = .fillProportionally
        
        //stack.isLayoutMarginsRelativeArrangement = true;
        return stack
    }()
    private let checkBox2 = CheckBoxButton()
    lazy var agreeLabel2: UILabel =  {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .link
        label.textAlignment = .left
        label.numberOfLines = 0
        label.isUserInteractionEnabled = true
        let guestureRecord = UITapGestureRecognizer(target: self, action: #selector(soglashenieTap(_:)))
        label.addGestureRecognizer(guestureRecord)
        let attributes:[NSAttributedString.Key : Any] = [.underlineStyle : NSUnderlineStyle.single.rawValue]
        label.attributedText = NSMutableAttributedString(string: "Ознакомлен с пользовательским соглашением", attributes: attributes)
        return label
    }()
    
    @objc func soglashenieTap(_ sender: Any){
        let detailViewController = PersonPolicyVC()
        let nav = UINavigationController(rootViewController: detailViewController)
        nav.modalPresentationStyle = .pageSheet
        present(nav, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
        initializeHideKeyboard()
        phoneTextfield.delegate = self
        // Do any additional setup after loading the view.
    }
    @objc func buttonActionSendSMS() {
        let VCSendSms = LoginCodeVC()
        sendKod.zoomInWithEasing()
        VCSendSms.modalPresentationStyle = .fullScreen
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        //print(dateFormatter.string(from: NSDate() as Date))
        let new = phoneTextfield.text?.replacingOccurrences(of: " (", with: "")
        let new2 = new?.replacingOccurrences(of: ") ", with: "")
        let new3 = new2?.replacingOccurrences(of: "-", with: "")
        UserDefaults.standard.set(self.fioTextfield.text!, forKey: "surname")
        UserDefaults.standard.set(self.mailTextfield.text!, forKey: "email")
        UserDefaults.standard.set(new3!, forKey: "phone")
        UserDefaults.standard.set(true, forKey: "isReg")
        show(VCSendSms, sender: self)
    }
    
    func regNewAgent(){
        
    }
}


//MARK: - Setting Views
extension RegVC{
    private func setViews(){
        fioTextfield.delegate = self
        mailTextfield.delegate = self
        phoneTextfield.delegate = self
        view.backgroundColor = .white
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(sendKod)
        view.addSubview(formStack)
        view.addSubview(checkBoxStack)
        view.addSubview(checkBoxStack2)
        
        formStack.addArrangedSubview(fioLabel)
        formStack.addArrangedSubview(fioTextfield)
        formStack.addArrangedSubview(mailLabel)
        formStack.addArrangedSubview(mailTextfield)
        formStack.addArrangedSubview(phoneLabel)
        formStack.addArrangedSubview(phoneTextfield)
        checkBoxStack.addArrangedSubview(checkBox1)
        checkBoxStack.addArrangedSubview(agreeLabel)
        checkBoxStack2.addArrangedSubview(checkBox2)
        checkBoxStack2.addArrangedSubview(agreeLabel2)
        
    }
}

//MARK: - Constraints
extension RegVC{
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            logoImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            logoImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            logoImageView.heightAnchor.constraint(equalToConstant: 70),
            
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            sendKod.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70),
            sendKod.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70),
            sendKod.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            sendKod.heightAnchor.constraint(equalToConstant: 50),
            
            formStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            formStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            formStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            checkBoxStack.topAnchor.constraint(equalTo: formStack.bottomAnchor, constant: 50),
            checkBoxStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            checkBoxStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            checkBoxStack2.topAnchor.constraint(equalTo: checkBoxStack.bottomAnchor, constant: 5),
            checkBoxStack2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            checkBoxStack2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            
        ])
    }
    
    func initializeHideKeyboard(){
        //Declare a Tap Gesture Recognizer which will trigger our dismissMyKeyboard() function
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
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
extension RegVC: UITextFieldDelegate{
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if fioTextfield.text?.count ?? 0 > 4 && fioTextfield.text?.count ?? 0 < 60 && phoneTextfield.text?.count ?? 0 > 8 {
            if mailTextfield.text?.count ?? 0 < 128{
                sendKod.alpha = 1
                sendKod.isEnabled = true
            } else {
                let alert = UIAlertController(title: "Ошибка почты", message: "Данная почта слишком длинная, используйте более короткую почту.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
        }else{
            sendKod.alpha = 0.5
            sendKod.isEnabled = false
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
