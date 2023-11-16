//
//  OnBoardingView.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 31.08.2023.
//

import UIKit

class OnBoardingView: UIView {
    
    private let pageLabel: UILabel = {
        let pageLabel = UILabel()
        pageLabel.textColor = .black
        pageLabel.font = .boldSystemFont(ofSize: 14)
        pageLabel.textAlignment = .center
        pageLabel.numberOfLines = 0
        pageLabel.translatesAutoresizingMaskIntoConstraints = false
        return pageLabel
    }()
    
    private let pageImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "gear")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(pageLabel)
        addSubview(pageImage)
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setLabelText(text: String){
        pageLabel.text = text
    }
    public func setImageBoard(image: String){
        pageImage.image = UIImage(named: image)
    }
    public func setPageLabelTrasfor(trasform: CGAffineTransform){
        pageLabel.transform = trasform
        pageImage.transform = trasform
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            pageImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            pageImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            pageImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            //pageImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            pageImage.heightAnchor.constraint(equalToConstant: 300),
            //pageImage.bottomAnchor.constraint(equalTo: pageLabel.topAnchor, constant: 0),
            
           // pageLabel.topAnchor.constraint(equalTo: pageImage.bottomAnchor, constant: 10),
            pageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            pageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            pageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            //pageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            //pageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -200),
            pageLabel.heightAnchor.constraint(equalToConstant: 130),
            
        ])
    }
}
