//
//  ProfileVC.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 01.10.2023.
//

import UIKit

class ProfileVC: UIViewController {

    private let fioLabel: UILabel = {
       let label = UILabel()
        label.textColor = .label
        label.text = "Куракин Егор Андреевич"
        label.font = .boldSystemFont(ofSize: 20)
        //label.font = .italicSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //imageView.layer.cornerRadius = 55
        //imageView.layer.borderWidth = CGFloat(integerLiteral: 2)
        return imageView
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
    //Email element
    private let mailLabel = FormLabel(text: "E-mail")
    private let mailTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "info@tehnoleasing.ru", keyboard: .adc)
        textfield.isEnabled = false
        return textfield
    }()
    //Phone element
    private let phoneLabel = FormLabel(text: "Телефон")
    private let phoneTextfield: CustomTextField = {
       let textfield = CustomTextField(placeholder: "+7 (999) 999-99-99", keyboard: .number)
        textfield.isEnabled = false
        return textfield
    }()
    //Contract element
    private let contractLabel = FormLabel(text: "Агентский договор")
    private let contractTextfield: CustomTextField = {
        let textfield = CustomTextField(placeholder: "№123456", keyboard: .number)
         textfield.isEnabled = false
         return textfield
    }()
    
    private lazy var contractButton: TehnoBlueButton = {
        let button = TehnoBlueButton(title: "Договор")
        button.addTarget(self,action: #selector(buttonAction),for: .touchUpInside)
        return button
    }()
    @objc func buttonAction() {
        contractButton.zoomInWithEasing()
        let VCReg = AgentContractVC()
        
        navigationController?.pushViewController(VCReg, animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        loadProfileData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Профиль"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .done, target: self, action: #selector(settingsButton))
        setViews()
        setConstraints()
        // Do any additional setup after loading the view.
    }
    
    @objc func settingsButton() {
        let VCReg = SettingsVC()
        navigationController?.pushViewController(VCReg, animated: true)
    }
    
    func setViews() {
        view.addSubview(logoImageView)
        view.addSubview(fioLabel)
        view.addSubview(formStack)
        //view.addSubview(contractButton)
        formStack.addArrangedSubview(mailLabel)
        formStack.addArrangedSubview(mailTextfield)
        formStack.addArrangedSubview(phoneLabel)
        formStack.addArrangedSubview(phoneTextfield)
        formStack.addArrangedSubview(contractLabel)
        formStack.addArrangedSubview(contractTextfield)
        
    }
    
    func loadProfileData() {
        let phoneCache = UserDefaults.standard.string(forKey: "phone")!
        NetworkTehnoDB.shared.getAgentsForPhone(parapms: phoneCache) { result in
            switch result {
            case .success(let agent):
                self.fioLabel.text = agent.surname
                self.mailTextfield.text = agent.email
                self.phoneTextfield.text = agent.phone
            case .failure(_): break
                //self.present(VCReg, animated: true, completion: nil)
                //print(error)
            }
        }
    }
    
    

}
extension ProfileVC{
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 110),
            logoImageView.widthAnchor.constraint(equalToConstant: 110),
            
            fioLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40),
            fioLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            fioLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            
            formStack.topAnchor.constraint(equalTo: fioLabel.bottomAnchor, constant: 80),
            formStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            formStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            /*contractButton.topAnchor.constraint(equalTo: formStack.bottomAnchor, constant: 50),
            contractButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70),
            contractButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70),
            contractButton.heightAnchor.constraint(equalToConstant: 50)*/
        ])
    }
}


