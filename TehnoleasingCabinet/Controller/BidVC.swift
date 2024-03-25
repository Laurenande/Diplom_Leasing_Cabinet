//
//  BidVC.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 07.11.2023.
//

import UIKit

class BidVC: UIViewController, UISearchControllerDelegate {
    private var infoCollection: UICollectionView = {
        let lay = UICollectionViewFlowLayout()
        lay.scrollDirection = .vertical
        let coll = UICollectionView(frame: .zero, collectionViewLayout: lay)
        coll.register(BidCell.self, forCellWithReuseIdentifier: "cell")
        coll.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        coll.translatesAutoresizingMaskIntoConstraints = false
        //coll.overrideUserInterfaceStyle = .light
        coll.backgroundColor = .systemBackground
        return coll
    }()
    
    private var appsAgentData: [Apps]?
    var searchText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        loadApps()
        navigationItem.title = "Заявки"
        navigationController?.navigationBar.prefersLargeTitles = true
        let search = UISearchController(searchResultsController: nil)
        search.delegate = self
        search.searchBar.delegate = self
        self.navigationItem.searchController = search
        view.backgroundColor = .systemGray6
        infoCollection.dataSource = self
        infoCollection.delegate = self
        setViews()
        setConstraints()
    }
    
    func loadApps(){
        let phoneCache = UserDefaults.standard.string(forKey: "phone")!
        NetworkTehnoDB.shared.getAppsOrAgentsForPhone(parapms: phoneCache) { result in
            switch result {
            case .success(let agent):
                self.loadData(page: agent)
            case .failure(let error):
                //self.present(VCReg, animated: true, completion: nil)
                print( error)
            }
        }
    }
    
    private func loadData(page: [Apps]) {
        appsAgentData = page
        infoCollection.reloadData()
    }
    func setViews(){
        view.addSubview(infoCollection)
    }

    func formatDate(_ dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "dd.MM.yyyy"
            return dateFormatter.string(from: date)
        } else {
            return nil
        }
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
//MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension BidVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appsAgentData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BidCell
        
        let apps = appsAgentData?[indexPath.row]
        //Форматирование даты
        let dateApp = apps?.createdAt ?? ""
        var newDate = ""
        if let formattedDate = formatDate(dateApp) {
            newDate = formattedDate // Output: 29.01.2023
        } else {
            newDate = "Failed to format date"
        }
        cell.setCellInfo(number: apps?.appNum ?? "Нет",
                         date: newDate,
                         client: apps?.appCompany ?? "Нет",
                         tariff: apps?.appCost ?? "Нет",
                         summa: formatNumberFromString(apps?.appComission ?? "Нет") ?? "Ошибка" ,
                         status: apps?.appStatus ?? "Нет")
        /*
         switch indexPath.row {
         case 0:
         cell.setCellInfo(number: "100", date: "12.15.2023", client: "Tehnoleasing", tariff: "Standart", summa: "10 000 000", status: "На рассмотрении")
         case 1:
         cell.setCellInfo(number: "120", date: "12.15.2023", client: "Tehnoleasing", tariff: "Standart", summa: "10 000 000", status: "В работе")
         case 2:
         cell.setCellInfo(number: "130", date: "12.15.2023", client: "Tehnoleasing", tariff: "Standart", summa: "10 000 000", status: "Ожидание КК")
         case 3:
         cell.setCellInfo(number: "133", date: "12.15.2023", client: "Tehnoleasing", tariff: "Standart", summa: "10 000 000", status: "Ожидание АВ")
         case 4:
         cell.setCellInfo(number: "144", date: "12.15.2023", client: "Tehnoleasing", tariff: "Standart", summa: "10 000 000", status: "Завершена")
         case 5:
         cell.setCellInfo(number: "149", date: "12.15.2023", client: "Tehnoleasing", tariff: "Standart", summa: "10 000 000", status: "Отказано")
         cell.apiStatusLabel.text = "asdd"
         default:
         cell.setCellInfo(number: "000", date: "12.15.2023", client: "Tehnoleasing", tariff: "Standart", summa: "10 000 000", status: "На рассмотрении")
         }
         */
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width/1.05, height: 155)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedBid = appsAgentData?[indexPath.row] else {
            return
        }
        let bidDetailsVC = OneBidVC()
        bidDetailsVC.bidInfo = selectedBid
        navigationController?.pushViewController(bidDetailsVC, animated: true)
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
            infoCollection.topAnchor.constraint(equalTo: self.view.topAnchor),
            infoCollection.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            infoCollection.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            infoCollection.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
        ])
    }
}
//MARK: - SearchBar
extension BidVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Обновляем searchText при каждом изменении текста в строке поиска
        self.searchText = searchText
        // Фильтруем данные в соответствии с введенным текстом
        filterData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // Очищаем строку поиска и сбрасываем фильтрацию
        searchBar.text = ""
        searchText = ""
        // Восстанавливаем исходные данные
        resetData()
    }
    
    func resetData() {
        // Восстанавливаем исходные данные
        loadApps()
    }
    
    func filterData() {
        // Если searchText пустой, восстанавливаем исходные данные
        guard !searchText.isEmpty else {
            loadApps()
            return
        }
        
        // Фильтруем данные по searchText
        let filteredData = appsAgentData?.filter { app in
            // Фильтруем по номеру, компании, статусу и т.д. в соответствии с вашими требованиями
            return app.appNum?.lowercased().contains(searchText.lowercased()) ?? true ||
            app.appCompany?.lowercased().contains(searchText.lowercased()) ?? true ||
            app.appStatus?.lowercased().contains(searchText.lowercased()) ?? true
        }
        
        // Обновляем коллекцию с отфильтрованными данными
        if let filteredData = filteredData {
            appsAgentData = filteredData
            infoCollection.reloadData()
        }
    }
}

