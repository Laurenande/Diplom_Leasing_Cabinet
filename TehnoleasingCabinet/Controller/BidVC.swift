//
//  BidVC.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 07.11.2023.
//

import UIKit

class BidVC: UIViewController {
    
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
    
    
    private var infoCollection: UICollectionView = {
        let lay = UICollectionViewFlowLayout()
        lay.scrollDirection = .vertical
        let coll = UICollectionView(frame: .zero, collectionViewLayout: lay)
        coll.translatesAutoresizingMaskIntoConstraints = false
        coll.register(BidCell.self, forCellWithReuseIdentifier: "cell")
        coll.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        coll.translatesAutoresizingMaskIntoConstraints = false
        //coll.overrideUserInterfaceStyle = .light
        coll.backgroundColor = .systemBackground
        return coll
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Заявки"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemGray6
        infoCollection.dataSource = self
        infoCollection.delegate = self
        
        setViews()
        setConstraints()
        print(infoCollection)
        
        
    }
    
    func setViews(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(infoCollection)
    }
    var rew: IndexPath?
    
    
}
//MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension BidVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BidCell
        switch indexPath.row {
        case 0:
            cell.setCellInfo(number: "123", date: "12.15.2023", client: "Tehnoleasing", tariff: "Standart", summa: "10 000 000", status: "На рассмотрении")
        case 1:
            cell.setCellInfo(number: "123", date: "12.15.2023", client: "Tehnoleasing", tariff: "Standart", summa: "10 000 000", status: "В работе")
        case 2:
            cell.setCellInfo(number: "123", date: "12.15.2023", client: "Tehnoleasing", tariff: "Standart", summa: "10 000 000", status: "Ожидание КК")
        case 3:
            cell.setCellInfo(number: "123", date: "12.15.2023", client: "Tehnoleasing", tariff: "Standart", summa: "10 000 000", status: "Ожидание АВ")
        case 4:
            cell.setCellInfo(number: "123", date: "12.15.2023", client: "Tehnoleasing", tariff: "Standart", summa: "10 000 000", status: "Завершена")
        case 5:
            cell.setCellInfo(number: "123", date: "12.15.2023", client: "Tehnoleasing", tariff: "Standart", summa: "10 000 000", status: "Отказано")
            cell.apiStatusLabel.text = "asdd"
        default:
            cell.setCellInfo(number: "123", date: "12.15.2023", client: "Tehnoleasing", tariff: "Standart", summa: "10 000 000", status: "На рассмотрении")
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width/1.05, height: 155)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(20)
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        configureContextMenu(index: indexPath, collectionView: collectionView)
    }
    
    func configureContextMenu(index: IndexPath, collectionView: UICollectionView) -> UIContextMenuConfiguration{

        let context = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { (action) -> UIMenu? in
            
            let edit = UIAction(title: "Обращени", image: UIImage(systemName: "info.bubble"), identifier: nil, discoverabilityTitle: nil, state: .off) { (_) in
                print("edit button clicked")
            }
            let cancel = UIAction(title: "Отменить", image: UIImage(systemName: "trash"), identifier: nil, discoverabilityTitle: nil, state: .off) { (_) in
                print("edit button clicked")
            }
           
            
            return UIMenu(title: "Действие", image: nil, identifier: nil, options: UIMenu.Options.displayInline, children: [edit,cancel])
            
        }
        return context
    }
    
}
//MARK: - Set constraints
extension BidVC{
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
            contentView.heightAnchor.constraint(equalToConstant: 1450),
            
            infoCollection.topAnchor.constraint(equalTo: contentView.topAnchor),
            infoCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            infoCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            infoCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
        ])
    }
}

