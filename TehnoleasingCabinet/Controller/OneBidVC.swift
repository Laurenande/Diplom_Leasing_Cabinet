//
//  OneBidVC.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 21.03.2024.
//

import UIKit

class OneBidVC: UIViewController {
    
    
    // MARK: - Properties
    
    var bidInfo: Apps? // Переменная для хранения информации о заявке
    
   
    // MARK: - Properties
    
   
    
    // MARK: - UI Elements
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.cornerRadius = 15
        return stackView
    }()
    
    private let leasingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .quaternarySystemFill
        stackView.layer.cornerRadius = 15
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Отступы слева и справа
           stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private let financeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .quaternarySystemFill
        stackView.layer.cornerRadius = 15
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Отступы слева и справа
           stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private let otherStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .quaternarySystemFill
        stackView.layer.cornerRadius = 15
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Отступы слева и справа
           stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Детали заявки"
        setupUI()
        displayBidInfo()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40)
        ])
    }
    
    // MARK: - Data Display
    
    private func displayBidInfo() {
        guard let bidInfo = bidInfo else {
            return
        }
        
        // Информация о лизинге
        stackView.addArrangedSubview(leasingStackView)
        leasingStackView.addArrangedSubview(addCategory(title: "Информация о лизинге", color: .systemBlue))
        leasingStackView.addArrangedSubview(addDetailItem(name: "Номер заявки", value: bidInfo.appNum ?? "Нет"))
        leasingStackView.addArrangedSubview(addDetailItem(name: "Статус лизингополучателя", value: bidInfo.appE ?? "Нет"))
        leasingStackView.addArrangedSubview(addDetailItem(name: "Лизингополучателя", value: bidInfo.appCompany ?? "Нет"))
        leasingStackView.addArrangedSubview(addDetailItem(name: "Тип лизинга", value: bidInfo.appType ?? "Нет"))
        leasingStackView.addArrangedSubview(addDetailItem(name: "Группа лизинга", value: bidInfo.appGroup ?? "Нет"))
        leasingStackView.addArrangedSubview(addDetailItem(name: "Предмет лизинга", value: bidInfo.appName ?? "Нет"))
        leasingStackView.addArrangedSubview(addDetailItem(name: "Срок лизинга", value: "\(bidInfo.appTerm ?? "Не указан") Мес."))
        
        // Финансовая часть
        stackView.addArrangedSubview(financeStackView)
        financeStackView.addArrangedSubview(addCategory(title: "Финансовая часть", color: .systemGreen))
        financeStackView.addArrangedSubview(addDetailItem(name: "Стоимость", value: bidInfo.appCost ?? "Нет"))
        financeStackView.addArrangedSubview(addDetailItem(name: "Аванс", value: "\(bidInfo.appAdvance ?? "Нет")%"))
        financeStackView.addArrangedSubview(addDetailItem(name: "Комиссия", value: formatNumberFromString(bidInfo.appComission ?? "Нет") ?? "Ошибка преобразования"))
        financeStackView.addArrangedSubview(addDetailItem(name: "Агентское вознагрождение", value: "\(bidInfo.tariffRate ?? "Нет")%"))
        financeStackView.addArrangedSubview(addDetailItem(name: "Статус", value: bidInfo.appStatus ?? "Нет"))
        
        // Другая информация
        stackView.addArrangedSubview(otherStackView)
        otherStackView.addArrangedSubview(addCategory(title: "Другая информация", color: .systemOrange))
        otherStackView.addArrangedSubview(addDetailItem(name: bidInfo.appReturnable ?? "", value: ""))
        otherStackView.addArrangedSubview(addDetailItem(name: bidInfo.appUsed ?? "", value: ""))
        otherStackView.addArrangedSubview(addDetailItem(name: bidInfo.appGuarantor ?? "", value: ""))
        otherStackView.addArrangedSubview(addDetailItem(name: "Контактное лицо", value: bidInfo.appContactName ?? "Нет"))
        otherStackView.addArrangedSubview(addDetailItem(name: "Контактный телефон", value: bidInfo.appContactPhone ?? "Нет"))
        otherStackView.addArrangedSubview(addDetailItem(name: "Примечание", value: bidInfo.appNote ?? "Нет"))
    
    }
    
    private func addCategory(title: String, color: UIColor)  -> UIView{
        let categoryView = UIView()
        categoryView.backgroundColor = color
        categoryView.layer.cornerRadius = 10
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        categoryView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: categoryView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: categoryView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: categoryView.trailingAnchor, constant: -10),
            titleLabel.bottomAnchor.constraint(equalTo: categoryView.bottomAnchor, constant: -10)
        ])
        
        
        
        return categoryView
    }
    
    private func addDetailItem(name: String, value: String) -> UIStackView{
        let nameLabel = FormLabel(text: name)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        /*
        let valueTextField = CustomTextField(placeholder: "", keyboard: .adc)
        valueTextField.text = value
        valueTextField.borderStyle = .roundedRect
        valueTextField.isUserInteractionEnabled = false
        */
        let valueTextField = UILabel()
        valueTextField.text = value
        valueTextField.numberOfLines = 0
        valueTextField.font = UIFont.systemFont(ofSize: 15)
        
        let detailStackView = UIStackView()
        detailStackView.axis = .vertical
        detailStackView.spacing = 5
        detailStackView.translatesAutoresizingMaskIntoConstraints = false
        detailStackView.layer.cornerRadius = 15
        
        detailStackView.addArrangedSubview(nameLabel)
        detailStackView.addArrangedSubview(valueTextField)
        
        return detailStackView
    }
    func formatNumberFromString(_ numberString: String) -> String? {
        // Пытаемся преобразовать строку в целое число
        guard let number = Int(numberString) else {
            return nil // Возвращаем nil, если строка не может быть преобразована в число
        }

        // Используем тот же код для форматирования числа
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2

        if let formattedNumber = numberFormatter.string(from: NSNumber(value: number)) {
            return "\(formattedNumber) ₽"
        } else {
            return nil
        }
    }
}
