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
            NetworkTehnoDB.shared.getAppsOrAgentsForPhone(parapms: "+79917678987") { result in
                switch result {
                case .success(let agent):
                    self.loadData(page: agent)
                case .failure(let error):
                    //self.present(VCReg, animated: true, completion: nil)
                    print("error")
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
    
    
}
//MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension BidVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appsAgentData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BidCell
        
        let apps = appsAgentData?[indexPath.row]
        cell.setCellInfo(number: apps!.appNum, date: apps!.createdAt, client: apps!.appCompany, tariff: apps!.appCost, summa: apps!.appComission, status: apps!.appStatus)
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
            return app.appNum.lowercased().contains(searchText.lowercased()) ||
                   app.appCompany.lowercased().contains(searchText.lowercased()) ||
                   app.appStatus.lowercased().contains(searchText.lowercased())
        }
        
        // Обновляем коллекцию с отфильтрованными данными
        if let filteredData = filteredData {
            appsAgentData = filteredData
            infoCollection.reloadData()
        }
    }
}

