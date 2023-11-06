//
//  PayVC.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 06.11.2023.
//

import UIKit

class PayVC: UIViewController {
    
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
    
   
    private var infoCollection: UICollectionView = {
        let lay = UICollectionViewFlowLayout()
        lay.scrollDirection = .vertical
        let coll = UICollectionView(frame: .zero, collectionViewLayout: lay)
        coll.translatesAutoresizingMaskIntoConstraints = false
        coll.register(PayCell.self, forCellWithReuseIdentifier: "cell")
        coll.translatesAutoresizingMaskIntoConstraints = false
        return coll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Выплаты"
        
        infoCollection.dataSource = self
        infoCollection.delegate = self
        
        setViews()
        setConstraints()
        
        
    }
    
    func setViews(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(infoCollection)
    }
    
    
    
}
//MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension PayVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PayCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width/1.05, height: 175)
    }
     
}
//MARK: - Set constraints
extension PayVC{
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
            contentView.heightAnchor.constraint(equalToConstant: 1000),
            
            infoCollection.topAnchor.constraint(equalTo: contentView.topAnchor),
            infoCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            infoCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            infoCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
        ])
    }
}
