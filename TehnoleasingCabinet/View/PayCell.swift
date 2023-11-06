//
//  PayCell.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 06.11.2023.
//

import UIKit

class PayCell: UICollectionViewCell {
    
    let numberLabel = PayLabel(text: "Номер №")
    let clientLabel = PayLabel(text: "Лизингополучатель")
    let tariffLabel = PayLabel(text: "Тариф")
    let summaLabel = PayLabel(text: "Сумма Фин-вания")
    let agentComLabel = PayLabel(text: "Агентская ком.")
    let statusLabel = PayLabel(text: "Статус выплат")
    let dateLabel = PayLabel(text: "Дата выплаты")
    
    let apiNumberLabel = ApiPayLabel(text: "2456457")
    let apiClientLabel = ApiPayLabel(text: "ООО ТЕХНО Лизинг")
    let apiTariffLabel = ApiPayLabel(text: "Стандарт")
    let apiSummaLabel = ApiPayLabel(text: "10 000 000 руб.")
    let apiAgentComLabel = ApiPayLabel(text: "10%")
    let apiStatusLabel = ApiPayLabel(text: "Одобрено")
    let apiDateLabel =  ApiPayLabel(text: "12.12.2023")
    
    let contentPayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = .systemGray5
        return view
    }()
    
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
        addSubview(agentComLabel)
        addSubview(statusLabel)
        addSubview(dateLabel)

        layer.cornerRadius = 12
        backgroundColor = .systemGray6
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            
            tariffLabel.topAnchor.constraint(equalTo: clientLabel.bottomAnchor, constant: 7),
            tariffLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            tariffLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -9),
            
            summaLabel.topAnchor.constraint(equalTo: tariffLabel.bottomAnchor, constant: 7),
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
        textColor = .black
        textAlignment = .left
        numberOfLines = 1
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
        font = .systemFont(ofSize: 14)
        sizeToFit()
        text = textInit
        textColor = .black
        textAlignment = .left
        numberOfLines = 1
        frame.size = CGSize(width: 100, height: 200)
    }
}
