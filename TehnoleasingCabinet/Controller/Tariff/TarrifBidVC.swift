//
//  TarrifBidVC.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 29.09.2023.
//

import UIKit

class TarrifBidVC: UIViewController{
    
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
    
    private lazy var newBidButton: TehnoBlueButton = {
        let button = TehnoBlueButton(title: "Составить заявку")
        button.addTarget(self,action: #selector(buttonAction),for: .touchUpInside)
        return button
    }()
    @objc func buttonAction() {
        let VCBid = MyBidVC()
        newBidButton.zoomInWithEasing()
        navigationController?.pushViewController(VCBid, animated: true)
    }
    private var infoCollection: UICollectionView = {
        let lay = UICollectionViewFlowLayout()
        lay.scrollDirection = .vertical
        let coll = UICollectionView(frame: .zero, collectionViewLayout: lay)
        coll.translatesAutoresizingMaskIntoConstraints = false
        coll.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        coll.register(CutomCell.self, forCellWithReuseIdentifier: "cell")
        coll.translatesAutoresizingMaskIntoConstraints = false
        return coll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Тарифы"
        
        infoCollection.dataSource = self
        infoCollection.delegate = self
        
        setViews()
        setConstraints()
        
        
    }
    
    func setViews(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(infoCollection)
        contentView.addSubview(newBidButton)
    }

 

}
//MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension TarrifBidVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CutomCell
        switch indexPath.row {
        case 0:
            cell.titleLabel.text = "Какие данные потребуются для подачи стандартной заявки?"
            cell.textLabel.text = "► ИНН или название компании-клиента\n► Стоимость предмета лизинга, Руб.\n► ФИО контактного лица\n► Телефон контактного лица"
        case 1:
            cell.titleLabel.text = "Как повысить любой из стандартных тарифов на 0.25% в любой момент времени?"
            cell.textLabel.text = "Укажите дополнительные условия сделки\n► Размер аванса\n► Срок лизинга\n► Отметьте, был ли предмет лизина в употреблении если да, то укажите год выпуска\n► Загрузите баланс компании-клиента за последний отчетный квартал \n► Загрузите предложение по предмету лизинга от поставщика"
        case 2:
            cell.titleLabel.text = "Лизинг транспорта и техники: 2% от суммы финансирования"
            cell.textLabel.text = "► Легковые автомобили\n► Грузовые автомобили \n► Спецтехника\n► Сельхозтехника\n► Прицепы\n► Автобусы и микро-автобусы"
        case 3:
            cell.titleLabel.text = "Лизинг оборудования: 2% от суммы финансирования"
            cell.textLabel.text = "► Сельхозоборудование\n► Оборудование, станки  \n► Медицинское оборудование \n► Специальное оборудование"
        case 4:
            cell.titleLabel.text = "Лизинг шин: 2% от суммы финансирования"
            cell.textLabel.text = "► Рулевая ось\n► Ведущая ось  \n► Прицепная ось \n► Спецшины\n►АГРО"
        case 5:
            cell.titleLabel.text = "Лизинг недвижимости: 2% от суммы финансирования"
            cell.textLabel.text = "► Офисная недвижимость \n► Торговая недвижимость \n► Апартаменты \n► Иной вид коммерческой недвижимости"
        default:
            cell.titleLabel.text = ""
            cell.textLabel.text = ""
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.row {
        case 0:
            return CGSize(width: view.frame.width/1.05, height: 140)
        case 1:
            return CGSize(width: view.frame.width/1.05, height: 275)
        case 2:
            return CGSize(width: view.frame.width/1.05, height: 180)
        case 3:
            return CGSize(width: view.frame.width/1.05, height: 140)
        case 4:
            return CGSize(width: view.frame.width/1.05, height: 160)
        case 5:
            return CGSize(width: view.frame.width/1.05, height: 140)
        default:
            return CGSize(width: view.frame.width/1.05, height: 300)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(20)
    }
}
//MARK: - Set constraints
extension TarrifBidVC{
    func setConstraints(){
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
            contentView.heightAnchor.constraint(equalToConstant: 1250),
            
            infoCollection.topAnchor.constraint(equalTo: contentView.topAnchor),
            infoCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            infoCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            infoCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            //newBidButton.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            newBidButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70),
            newBidButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70),
            newBidButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            newBidButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
class CutomCell: UICollectionViewCell {
    
    var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 17)
        label.numberOfLines = 0
        //label.backgroundColor = .darkGray
        label.sizeToFit()
        return label
    }()
    var textLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        //label.backgroundColor = .blue
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        addSubview(textLabel)
        layer.cornerRadius = 12
        //backgroundColor = .secondarySystemBackground
        backgroundColor = .systemGray6
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 3
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -9),
            //titleLabel.heightAnchor.constraint(equalToConstant: 60),

            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            textLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            //textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7)
        ])
    }
    
}
