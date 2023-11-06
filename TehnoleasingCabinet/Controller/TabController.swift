//
//  TabController.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 29.09.2023.
//

import UIKit

class TabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        selectedIndex = 1
        // Do any additional setup after loading the view.
    }
    
    //MARK: - setupTabs()
    private func setupTabs(){
        let home = createVC(with: "Заявки", and: UIImage(systemName: "list.clipboard"), vc: MyBidVC())
        let profile = createVC(with: "Профиль", and: UIImage(systemName: "person.circle"), vc: ProfileVC())
        let tariff = createVC(with: "Тариф", and: UIImage(systemName: "doc"), vc: TarrifBidVC())
        let sendMoney = createVC(with: "Выплаты", and: UIImage(systemName: "rublesign.circle"), vc: PayVC())
        let newBid = createVC(with: "Лизинг", and: UIImage(systemName: "plus.circle"), vc: MyBidVC())
        self.setViewControllers([home,sendMoney,newBid,profile,tariff], animated: true)
    }
    
    private func createVC(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        // correct the transparency bug for Tab bars
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance

        return nav
    }

}
