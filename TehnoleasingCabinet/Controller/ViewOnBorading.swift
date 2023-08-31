//
//  ViewOnBorading.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 30.08.2023.
//

import UIKit

class ViewOnBorading: UIViewController {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoText")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let buttonFinal: UIButton = {
        let button = UIButton(type: .system)
        //button.frame.size = CGSize(width: 100, height: 100)
        button.setTitle("Продолжить",
                        for: .normal)
        button.setTitleColor(.white,
                             for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1129455492, green: 0.2492182851, blue: 0.3852708042, alpha: 1)
        button.layer.cornerRadius = 10
        button.layer.opacity = 0
        button.addTarget(self,
                         action: #selector(buttonAction),
                         for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private var sliders = [OnBoardingView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
        setDelegates()
        
        sliders = createSlides()
        setupSlideScrollView(slides: sliders)
        scrollView.delegate = self
        
               
    }
    
    @objc
       func buttonAction() {
           print("lox")
       }
    
    private func setViews(){
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        view.addSubview(logoImageView)
        view.addSubview(buttonFinal)
    }
    
    private func setDelegates(){
        
    }
    
    private func createSlides() -> [OnBoardingView]{
        let firstOnboardingView = OnBoardingView()
        firstOnboardingView.setLabelText(text: "Сайт рыбатекст поможет дизайнеру, верстальщику, вебмастеру сгенерировать несколько абзацев более менее осмысленного текста рыбы на русском языке")
        let secondOnboardingView = OnBoardingView()
        secondOnboardingView.setLabelText(text: "Сайт рыбатекст поможет дизайнеру, верстальщику, вебмастеру сгенерировать несколько абзацев более менее осмысленного текста рыбы на русском языке")
        let thirdOnboardingView = OnBoardingView()
        thirdOnboardingView.setLabelText(text: "Сайт рыбатекст поможет дизайнеру, верстальщику, вебмастеру сгенерировать несколько абзацев более менее осмысленного текста рыбы на русском языке")
        
        return [firstOnboardingView,secondOnboardingView,thirdOnboardingView]
    }
    
    private func setupSlideScrollView(slides:[OnBoardingView]){
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count),
                                        height: view.frame.width)
        
        for i in 0..<slides.count{
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i),
                                     y: 0,
                                     width: view.frame.width,
                                     height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
}
//MARK: - UIScrollViewDelegate
extension ViewOnBorading: UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        self.pageControl.currentPage = Int(pageIndex)
        
        let maxHorizontalOffset = scrollView.contentSize.width - view.frame.width
        let percentHorizontalOffset = scrollView.contentOffset.x / maxHorizontalOffset
        
        if percentHorizontalOffset <= 0.5{
            let firstTransform = CGAffineTransform(scaleX: (0.5 - percentHorizontalOffset) / 0.5,
                                                   y: (0.5 - percentHorizontalOffset) / 0.5)
            let secondTransform = CGAffineTransform(scaleX: percentHorizontalOffset / 0.5,
                                                   y: percentHorizontalOffset / 0.5)
            sliders[0].setPageLabelTrasfor(trasform: firstTransform)
            sliders[1].setPageLabelTrasfor(trasform: secondTransform)
        }else{
            let secondTransform = CGAffineTransform(scaleX: (1 - percentHorizontalOffset) / 0.5,
                                                   y: (1 - percentHorizontalOffset) / 0.5)
            let thirdTransform = CGAffineTransform(scaleX: percentHorizontalOffset,
                                                   y: percentHorizontalOffset)
            sliders[1].setPageLabelTrasfor(trasform: secondTransform)
            sliders[2].setPageLabelTrasfor(trasform: thirdTransform)
        }
        if percentHorizontalOffset == 1{
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: {
                    self.buttonFinal.layer.opacity = 1
                }, completion: nil)
            }
        }
    }
    
}
//MARK: - Set Constraints
extension ViewOnBorading{
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -180),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            pageControl.heightAnchor.constraint(equalToConstant: 50),
            
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            logoImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            logoImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            logoImageView.heightAnchor.constraint(equalToConstant: 60),
            
            buttonFinal.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            buttonFinal.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100),
            buttonFinal.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            buttonFinal.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

