//
//  LoginVC.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 31.08.2023.
//

import UIKit

class LoginVC: UIViewController {
    
    private lazy var buttonLogin: TehnoBlueButton = {
        let button = TehnoBlueButton(title: "Вход")
        button.alpha = 0.5
        button.isEnabled = false
        button.addTarget(self, action: #selector(buttonActionLogin), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonReg: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Регистрация", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.77, green: 0.0077, blue: 0.020405, alpha: 1)
        button.layer.cornerRadius = 14
        button.addTarget(self,
                         action: #selector(buttonActionReg),
                         for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoText")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let labelInfo: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Универсальная  лизинговая компания, мы работаем в сегменте малого и среднего бизнеса, преимущественно с автотраспортом"
        //label.font = .boldSystemFont(ofSize: 14)
        label.font = .italicSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //Form Login
    private let phoneLabel = FormLabel(text: "Номер телефона:")
    private let phoneTextfield = CustomTextField(placeholder: "+7 (999) 999-99-99", keyboard: .number)
    
    let stack = UIStackView()
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneTextfield.delegate = self
        setViews()
        setConstraints()
        initializeHideKeyboard()
        // Do any additional setup after loading the view.
    }
    
    private func setViews(){
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        stack.isLayoutMarginsRelativeArrangement = true;
        stack.addArrangedSubview(phoneLabel)
        stack.addArrangedSubview(phoneTextfield)
        
        view.backgroundColor = .white
        view.addSubview(buttonLogin)
        view.addSubview(buttonReg)
        view.addSubview(logoImageView)
        view.addSubview(labelInfo)
        view.addSubview(stack)
    }
    @objc func buttonActionLogin() {
        let new = phoneTextfield.text?.replacingOccurrences(of: " (", with: "")
        let new2 = new?.replacingOccurrences(of: ") ", with: "")
        let new3 = new2?.replacingOccurrences(of: "-", with: "")
        UserDefaults.standard.setValue(new3!, forKey: "phone")
        let VCSendSms = LoginCodeVC()
        buttonLogin.zoomInWithEasing()
        VCSendSms.modalPresentationStyle = .fullScreen
        show(VCSendSms, sender: self)
    }
    
    @objc func buttonActionReg() {
        
         let VCReg = RegVC()
         //VCReg.modalPresentationStyle = .fullScreen
         
        //self.present(VCReg, animated: true, completion: nil)
        
        let new = phoneTextfield.text?.replacingOccurrences(of: " (", with: "")
        let new2 = new?.replacingOccurrences(of: ") ", with: "")
        let new3 = new2?.replacingOccurrences(of: "-", with: "")
        let dest = RegVC(nibName:"RegVC", bundle: nil)
        VCReg.phoneTextfield.text = phoneTextfield.text
        NetworkTehnoDB.shared.getAgentsForPhone(parapms: new3!) { result in
            switch result {
            case .success(_):
                let alert = UIAlertController(title: "Номер зарегистрирован", message: "Такой номер уже зарегистрирован. Выполните вход.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            case .failure(_):
                self.present(VCReg, animated: true, completion: nil)
                //print(error)
            }
        }
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}


extension LoginVC{
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            buttonLogin.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70),
            buttonLogin.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70),
            buttonLogin.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            buttonLogin.heightAnchor.constraint(equalToConstant: 50),
            
            buttonReg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70),
            buttonReg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70),
            buttonReg.bottomAnchor.constraint(equalTo: buttonLogin.topAnchor, constant: -10),
            buttonReg.heightAnchor.constraint(equalToConstant: 50),
            
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            logoImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            logoImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            logoImageView.heightAnchor.constraint(equalToConstant: 70),
            
            labelInfo.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 30),
            labelInfo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            labelInfo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            stack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            stack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            stack.topAnchor.constraint(equalTo: labelInfo.bottomAnchor, constant: 150)
            
        ])
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

extension LoginVC: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if phoneTextfield.text?.count == 18{
            buttonLogin.alpha = 1
            buttonLogin.isEnabled = true
        }else{
            buttonLogin.alpha = 0.5
            buttonLogin.isEnabled = false
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = phoneTextfield.text else {return false}
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        phoneTextfield.text = formatter(mask: "+X (XXX) XXX-XX-XX", phoneNumber: newString)
        return false
        
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
