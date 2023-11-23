//
//  SettingsVC.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 23.11.2023.
//

import UIKit


struct Section {
    let title:String
    let options: [SettingsOptionType]
}

enum SettingsOptionType {
    case staticCell(model:SettingsOption)
    case switchCell(model:SettingsSwitchOption)
}

struct SettingsSwitchOption {
    let title:String
    let icon:UIImage?
    let iconBG:UIColor
    let handler: (() -> Void)
    let isOn:Bool
}

struct SettingsOption {
    let title:String
    let icon:UIImage?
    let iconBG:UIColor
    let handler: (() -> Void)
}

class SettingsVC: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        
        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        return table
    }()
    
    var models = [Section]()
    
    var noteIs = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        navigationItem.title = "Настройки"
        //navigationController?.navigationBar.prefersLargeTitles = true
        configure()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        // Do any additional setup after loading the view.
    }
    
    func configure() {
        models.append(Section(title: "Основные", options: [
            .staticCell(model: SettingsOption(title: "Экран", icon: UIImage(systemName: "circle.lefthalf.filled"), iconBG: UIColor.systemMint ) {
                
            }),
            .staticCell(model: SettingsOption(title: "Язык", icon: UIImage(systemName: "globe"), iconBG: UIColor.systemGreen ) {
                
            }),
        ]))
        
        models.append(Section(title: "Дополнительно", options: [
            .staticCell(model: SettingsOption(title: "Политки", icon: UIImage(systemName: "doc.text.fill"), iconBG: UIColor.systemBlue ) {
                let detailViewController = PolicyIpAndFisVC()
                let nav = UINavigationController(rootViewController: detailViewController)
                nav.modalPresentationStyle = .pageSheet
                self.present(nav, animated: true, completion: nil)
            }),
            
        ]))
        
        models.append(Section(title: "Уведомления e-mail", options: [.switchCell(model: SettingsSwitchOption(title: "Все уведомления",
                                                                                                             icon: UIImage(systemName: "text.bubble.fill"),
                                                                                                             iconBG: UIColor.systemIndigo,
                                                                                                             handler: {
            
            
            
            
        }, isOn: false)),
                                                                     .switchCell(model: SettingsSwitchOption(title: "Только важные",
                                                                                                             icon: UIImage(systemName: "exclamationmark.bubble.fill"),
                                                                                                             iconBG: UIColor.systemIndigo,
                                                                                                             handler: {
            
        }, isOn: true)),
                                                                     
                                                                    ]))
        
        models.append(Section(title: "Уведомления СМС", options: [.switchCell(model: SettingsSwitchOption(title: "Только важные",
                                                                                                             icon: UIImage(systemName: "exclamationmark.bubble.fill"),
                                                                                                             iconBG: UIColor.systemPurple,
                                                                                                             handler: {
            
            
            
            
        }, isOn: false))
                                                                    ]))
    }
    
}
//MARK: SettingsVC: UITableViewDelegate, UITableViewDataSource
extension SettingsVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return models[section].title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as? SettingTableViewCell else {return UITableViewCell()}
            
            cell.configure(with: model)
            if model.title == "Экран" || model.title == "Язык"{
                cell.isUserInteractionEnabled = false
                cell.cellAlpha()
            }
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath) as? SwitchTableViewCell else {return UITableViewCell()}
            
            cell.configure(with: model)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
    }
    
}
