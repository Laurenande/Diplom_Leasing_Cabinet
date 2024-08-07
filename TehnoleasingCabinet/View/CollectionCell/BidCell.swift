//
//  BidCell.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 07.11.2023.
//

import UIKit

enum colorCell {
    case blue //На расмотрении
    case green //В работе
    case orange //Ожидание КК
    case yellow //Ожидание АВ
    case grey //Завершена
    case red //Отказано
    
}

class BidCell: UICollectionViewCell {
    
    let numberLabel = BidLabel(text: "Номер №:")
    let dateLabel = BidLabel(text: "Дата создания:")
    let clientLabel = BidLabel(text: "Лизингополучатель:")
    let summaLabel = BidLabel(text: "Сумма Фин-вания:")
    let agentComLabel = BidLabel(text: "Агентская ком.:")
    let statusLabel = BidLabel(text: "Статус:")
    
    let apiNumberLabel = ApiBidLabel(text: "2456457")
    let apiDateLabel =  ApiBidLabel(text: "12.12.2023")
    let apiClientLabel = ApiBidLabel(text: "ООО ТЕХНО Лизинг")
    let apiTariffLabel = ApiBidLabel(text: "Стандарт")
    let apiSummaLabel = ApiBidLabel(text: "10 000 000 руб.")
    let apiStatusLabel = ApiBidLabel(text: "Одобрено")
    
    
    
    let contentPayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = .tertiarySystemBackground
    
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: -1, height: 0)
        view.layer.shadowRadius = 4
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(contentPayView)
        contentPayView.addSubview(apiNumberLabel)
        contentPayView.addSubview(apiClientLabel)
        contentPayView.addSubview(apiTariffLabel)
        contentPayView.addSubview(apiSummaLabel)
        contentPayView.addSubview(apiStatusLabel)
        contentPayView.addSubview(apiDateLabel)
        addSubview(numberLabel)
        addSubview(clientLabel)

        addSubview(summaLabel)
        addSubview(agentComLabel)
        addSubview(statusLabel)
        addSubview(dateLabel)

        numberLabel.font = .boldSystemFont(ofSize: 16)
        layer.cornerRadius = 12
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 3
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCellInfo(number: String, date: String, client: String, tariff: String, summa: String, status: String){
        apiNumberLabel.text = number
        apiDateLabel.text = date
        apiClientLabel.text = client
        apiTariffLabel.text = tariff
        apiSummaLabel.text = summa
        apiStatusLabel.text = status
        
        switch status {
        case "На рассмотрении":
            backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1) //
        case "В работе":
            backgroundColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        case "Ожидание КК":
            backgroundColor = UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1)
        case "Ожидание АВ":
            backgroundColor = UIColor(red: 255/255, green: 204/255, blue: 0/255, alpha: 1)
        case "Завершена":
            backgroundColor = UIColor(red: 88/255, green: 86/255, blue: 214/255, alpha: 1)
        case "Отказано":
            backgroundColor = UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1)
        default:
            backgroundColor = .systemGray6
        }
    }
    
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
            
            
            summaLabel.topAnchor.constraint(equalTo: clientLabel.bottomAnchor, constant: 7),
            summaLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            summaLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -9),
            
            agentComLabel.topAnchor.constraint(equalTo: summaLabel.bottomAnchor, constant: 7),
            agentComLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            agentComLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -9),
            
            statusLabel.topAnchor.constraint(equalTo: agentComLabel.bottomAnchor, constant: 7),
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
            
            apiStatusLabel.topAnchor.constraint(equalTo: apiSummaLabel.bottomAnchor, constant: 7),
            apiStatusLabel.leftAnchor.constraint(equalTo: contentPayView.leftAnchor, constant: 10),
            apiStatusLabel.rightAnchor.constraint(equalTo: contentPayView.rightAnchor, constant: -9),
            
            apiDateLabel.topAnchor.constraint(equalTo: apiStatusLabel.bottomAnchor, constant: 7),
            apiDateLabel.leftAnchor.constraint(equalTo: contentPayView.leftAnchor, constant: 10),
            apiDateLabel.rightAnchor.constraint(equalTo: contentPayView.rightAnchor, constant: -9),
            
        ])
    }
    
}
class BidLabel: UILabel {
    
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
class ApiBidLabel: UILabel {
    
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
        textColor = .label
        textAlignment = .left
        numberOfLines = 1
        frame.size = CGSize(width: 100, height: 200)

    }
}
