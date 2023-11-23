//
//  AgentSMSVC.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 25.10.2023.
//

import UIKit

class AgentSMSVC: UIViewController {
    //MARK: - Instans objects
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
        label.numberOfLines = 0
        label.frame.size = CGSize(width: 100, height: 200)
        label.text = "Для подтверждения Агентского договора введите код"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.frame.size = CGSize(width: 100, height: 200)
        label.text = "Код был отправлен на указанный Вами номер"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let smsCodeTextFiled: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Код из СМС"
        textField.textAlignment = .center
        textField.keyboardType = .asciiCapableNumberPad
        textField.isSelected = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var nextButton: TehnoBlueButton = {
        let button = TehnoBlueButton(title: "Подтвердить")
        button.alpha = 0.5
        button.isEnabled = false
        button.addTarget(self,action: #selector(buttonAction),for: .touchUpInside)
        return button
    }()
    
    
    @objc
    func buttonAction() {
        let VCReg = TabController()
        nextButton.zoomInWithEasing()
        VCReg.modalPresentationStyle = .fullScreen
        VCReg.modalTransitionStyle = .coverVertical
        present(VCReg, animated: true, completion: nil)
    }
    
    
    private lazy var sendSMSTwo: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Отправить код повторно", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.layer.cornerRadius = 14
        //button.addTarget(self,
        //               action: #selector(buttonActionLogin),
        //             for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        return button
    }()
    
    private let timerLable: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.frame.size = CGSize(width: 100, height: 200)
        //label.text = "Код был отправлен на указанный Вами номер"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //Properties timer
    var countdownTimer: Timer!
    var totalTime = 120
    //private let numberCodeTF1: UITextField
    override func viewDidLoad() {
        super.viewDidLoad()
        smsCodeTextFiled.delegate = self
        setViews()
        setConstraints()
        initializeHideKeyboard()
        sendSMSTwo.isEnabled = false
        sendSMSTwo.alpha = 0.5
        startTimer()
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Settings Timer
    func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    @objc func updateTime() {
        timerLable.text = "\(timeFormatted(totalTime))"
        if totalTime != 0 {
            totalTime -= 1
        } else {
            endTimer()
        }
    }
    func endTimer() {
        countdownTimer.invalidate()
        sendSMSTwo.isEnabled = true
        sendSMSTwo.alpha = 1
    }
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}


//MARK: - Setting Views
extension AgentSMSVC{
    private func setViews(){
        view.backgroundColor = .white
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(smsCodeTextFiled)
        view.addSubview(sendSMSTwo)
        view.addSubview(timerLable)
        view.addSubview(nextButton)
    }
}

//MARK: - Constraints
extension AgentSMSVC{
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            logoImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            logoImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            logoImageView.heightAnchor.constraint(equalToConstant: 70),
            
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            //titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            subTitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            smsCodeTextFiled.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 10),
            smsCodeTextFiled.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            smsCodeTextFiled.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            smsCodeTextFiled.heightAnchor.constraint(equalToConstant: 40),
            
            sendSMSTwo.topAnchor.constraint(equalTo: smsCodeTextFiled.bottomAnchor, constant: 5),
            sendSMSTwo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70),
            sendSMSTwo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70),
            sendSMSTwo.heightAnchor.constraint(equalToConstant: 30),
            
            timerLable.topAnchor.constraint(equalTo: sendSMSTwo.bottomAnchor, constant: 5),
            timerLable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70),
            timerLable.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70),
            timerLable.heightAnchor.constraint(equalToConstant: 30),
            
            nextButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70),
            nextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -130),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    //MARK: - Hidden keyboard
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
//MARK: UITextFieldDelegate
extension AgentSMSVC: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentTextCount = textField.text?.count ?? 0
        
        if range.length + range.location > currentTextCount{
            return false
        }
        let newLength = currentTextCount + string.count - range.length
        return newLength <= 6
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text?.count == 6{
            nextButton.alpha = 1
            nextButton.isEnabled = true
        }else{
            nextButton.alpha = 0.5
            nextButton.isEnabled = false
        }
    }
}
