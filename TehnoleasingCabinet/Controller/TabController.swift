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
        //overrideUserInterfaceStyle = .light
        // Do any additional setup after loading the view.
    }
    
    //MARK: - setupTabs()
    private func setupTabs(){
        let home = createVC(with: "Заявки", and: UIImage(systemName: "list.clipboard"), vc: BidVC())
        let profile = createVC(with: "Профиль", and: UIImage(systemName: "person.circle"), vc: ProfileVC())
        let tariff = createVC(with: "Договор", and: UIImage(systemName: "doc"), vc: AgentContractVC())
        let sendMoney = createVC(with: "Выплаты", and: UIImage(systemName: "rublesign.circle"), vc: PayVC())
        let newBid = createVC(with: "Лизинг", and: UIImage(systemName: "plus.circle"), vc: MyBidVC())
        self.setViewControllers([home,sendMoney,newBid,profile,tariff], animated: true)
    }
    
    private func createVC(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: vc)
        //nav.overrideUserInterfaceStyle = .dark
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        //nav.navigationBar.tintColor = #colorLiteral(red: 0, green: 0.3430749774, blue: 0.5971426964, alpha: 1)
        //UITabBar.appearance().tintColor = #colorLiteral(red: 0, green: 0.3430749774, blue: 0.5971426964, alpha: 1)
        //UITabBar.appearance().overrideUserInterfaceStyle = .dark
        // correct the transparency bug for Tab bars
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        return nav
    }

}
