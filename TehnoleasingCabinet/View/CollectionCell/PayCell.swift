//
//  PayCell.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 06.11.2023.
//

import UIKit
/**
 Custom UICollectionViewCell class for the cell used in the collection to display current bids. This class used in PayVC
 */
class PayCell: UICollectionViewCell {
    
    ///Сustom UILabel for collection cells displays "Номер №"
    let numberLabel = PayLabel(text: "Номер №:")
    ///Сustom UILabel for collection cells displays ""Лизингополучатель"
    let clientLabel = PayLabel(text: "Лизингополучатель:")
    ///Сustom UILabel for collection cells displays "Тариф"
    let tariffLabel = PayLabel(text: "Тариф:")
    ///Сustom UILabel for collection cells displays "Сумма Фин-вания"
    let summaLabel = PayLabel(text: "Сумма Фин-вания:")
    ///Сustom UILabel for collection cells displays "Агентская ком."
    let comAgentLabel = PayLabel(text: "Агентская ком.:")
    ///Сustom UILabel for collection cells displays "Статус выплат"
    let statusLabel = PayLabel(text: "Статус выплат:")
    ///Сustom UILabel for collection cells displays "Дата выплаты"
    let dateLabel = PayLabel(text: "Дата выплаты:")
    
    ///Custom UILabel for collection cells, outputs received data via API. The received data corresponds to the UILabel without an API attribution
    let apiNumberLabel = ApiPayLabel(text: "2456457")
    ///Custom UILabel for collection cells, outputs received data via API. The received data corresponds to the UILabel without an API attribution
    let apiClientLabel = ApiPayLabel(text: "ООО ТЕХНО Лизинг")
    ///Custom UILabel for collection cells, outputs received data via API. The received data corresponds to the UILabel without an API attribution
    let apiTariffLabel = ApiPayLabel(text: "Стандарт")
    ///Custom UILabel for collection cells, outputs received data via API. The received data corresponds to the UILabel without an API attribution
    let apiSummaLabel = ApiPayLabel(text: "10 000 000 руб.")
    ///Custom UILabel for collection cells, outputs received data via API. The received data corresponds to the UILabel without an API attribution
    let apiAgentComLabel = ApiPayLabel(text: "10%")
    ///Custom UILabel for collection cells, outputs received data via API.The received data corresponds to the UILabel without an API attribution
    let apiStatusLabel = ApiPayLabel(text: "Одобрено")
    ///Custom UILabel for collection cells, outputs received data via API. The received data corresponds to the UILabel without an API attribution
    let apiDateLabel =  ApiPayLabel(text: "12.12.2023")
    ///UIView to which all UILabels are added, in which data received via the API is displayed; for greater clarity, it has a different background color.
    let contentPayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = #colorLiteral(red: 0.9899999499, green: 0.9899999499, blue: 0.9899999499, alpha: 1)
        //view.backgroundColor = .secondarySystemBackground
        view.overrideUserInterfaceStyle = .dark
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: -1, height: 0)
        view.layer.shadowRadius = 4
        return view
    }()
    ///During initialization, all created objects are added. This is also where the initial setup of the entire cell takes place.
    ///
    ///Default cell parameters
    ///```swift
    ///layer.cornerRadius = 12
    ///backgroundColor = .systemGray6
    ///layer.shadowColor = UIColor.black.cgColor
    ///layer.shadowOpacity = 0.4
    ///layer.shadowOffset = CGSize(width: 1, height: 1)
    ///layer.shadowRadius = 3
    ///```
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(contentPayView)
        contentPayView.addSubview(apiNumberLabel)
        contentPayView.addSubview(apiClientLabel)
        contentPayView.addSubview(apiTariffLabel)
        contentPayView.addSubview(apiSummaLabel)
        contentPayView.addSubview(apiAgentComLabel)
        contentPayView.addSubview(apiStatusLabel)
        contentPayView.addSubview(apiDateLabel)
        addSubview(numberLabel)
        addSubview(clientLabel)
        addSubview(tariffLabel)
        addSubview(summaLabel)
        addSubview(comAgentLabel)
        addSubview(statusLabel)
        addSubview(dateLabel)
        numberLabel.font = .boldSystemFont(ofSize: 16)
        
        backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        layer.cornerRadius = 12
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 3
        setConstraints()
    }
    ///Fatal error
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    ///The function configures constraints.
    func setConstraints() {
        NSLayoutConstraint.activate([
            contentPayView.topAnchor.constraint(equalTo: topAnchor),
            contentPayView.rightAnchor.constraint(equalTo: rightAnchor),
            contentPayView.widthAnchor.constraint(equalToConstant: bounds.width/1.8),
            contentPayView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            numberLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            numberLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            numberLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -9),
            
            clientLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 7),
            clientLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            clientLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -9),
            
            tariffLabel.topAnchor.constraint(equalTo: clientLabel.bottomAnchor, constant: 7),
            tariffLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            tariffLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -9),
            
            summaLabel.topAnchor.constraint(equalTo: tariffLabel.bottomAnchor, constant: 7),
            summaLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            summaLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -9),
            
            comAgentLabel.topAnchor.constraint(equalTo: summaLabel.bottomAnchor, constant: 7),
            comAgentLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            comAgentLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -9),
            
            statusLabel.topAnchor.constraint(equalTo: comAgentLabel.bottomAnchor, constant: 7),
            statusLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            statusLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -9),
            
            dateLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 7),
            dateLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            dateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -9),
            
            //contentPayView
            apiNumberLabel.topAnchor.constraint(equalTo: contentPayView.topAnchor, constant: 7),
            apiNumberLabel.leftAnchor.constraint(equalTo: contentPayView.leftAnchor, constant: 10),
            apiNumberLabel.rightAnchor.constraint(equalTo: contentPayView.rightAnchor, constant: -9),
            
            apiClientLabel.topAnchor.constraint(equalTo: apiNumberLabel.bottomAnchor, constant: 7),
            apiClientLabel.leftAnchor.constraint(equalTo: contentPayView.leftAnchor, constant: 10),
            apiClientLabel.rightAnchor.constraint(equalTo: contentPayView.rightAnchor, constant: -9),
            
            apiTariffLabel.topAnchor.constraint(equalTo: apiClientLabel.bottomAnchor, constant: 7),
            apiTariffLabel.leftAnchor.constraint(equalTo: contentPayView.leftAnchor, constant: 10),
            apiTariffLabel.rightAnchor.constraint(equalTo: contentPayView.rightAnchor, constant: -9),
            
            apiSummaLabel.topAnchor.constraint(equalTo: apiTariffLabel.bottomAnchor, constant: 7),
            apiSummaLabel.leftAnchor.constraint(equalTo: contentPayView.leftAnchor, constant: 10),
            apiSummaLabel.rightAnchor.constraint(equalTo: contentPayView.rightAnchor, constant: -9),
            
            apiAgentComLabel.topAnchor.constraint(equalTo: apiSummaLabel.bottomAnchor, constant: 7),
            apiAgentComLabel.leftAnchor.constraint(equalTo: contentPayView.leftAnchor, constant: 10),
            apiAgentComLabel.rightAnchor.constraint(equalTo: contentPayView.rightAnchor, constant: -9),
            
            apiStatusLabel.topAnchor.constraint(equalTo: apiAgentComLabel.bottomAnchor, constant: 7),
            apiStatusLabel.leftAnchor.constraint(equalTo: contentPayView.leftAnchor, constant: 10),
            apiStatusLabel.rightAnchor.constraint(equalTo: contentPayView.rightAnchor, constant: -9),
            
            apiDateLabel.topAnchor.constraint(equalTo: apiStatusLabel.bottomAnchor, constant: 7),
            apiDateLabel.leftAnchor.constraint(equalTo: contentPayView.leftAnchor, constant: 10),
            apiDateLabel.rightAnchor.constraint(equalTo: contentPayView.rightAnchor, constant: -9),
            
        ])
    }
    
}
class PayLabel: UILabel {
    
    init(text:String){
        super.init(frame: .zero)
        setupLabel(textInit: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel(textInit: String) {
        translatesAutoresizingMaskIntoConstraints = false
        font = .boldSystemFont(ofSize: 14)
        sizeToFit()
        text = textInit
        textColor = .white
        textAlignment = .left
        numberOfLines = 1
        //layer.borderWidth = 1
        //layer.borderColor = CGColor(red: 45, green: 54, blue: 23, alpha: 1)
        frame.size = CGSize(width: 100, height: 200)
    }
}
class ApiPayLabel: UILabel {
    
    init(text:String){
        super.init(frame: .zero)
        setupLabel(textInit: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel(textInit: String) {
        translatesAutoresizingMaskIntoConstraints = false
        font = .boldSystemFont(ofSize: 14)
        sizeToFit()
        text = textInit
        textColor = .black
        textAlignment = .left
        numberOfLines = 1
        frame.size = CGSize(width: 100, height: 200)
    }
}
