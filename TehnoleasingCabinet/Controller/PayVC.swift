//
//  PayVC.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 06.11.2023.
//

import UIKit

class PayVC: UIViewController, UISearchControllerDelegate {
    
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
        coll.register(PayCell.self, forCellWithReuseIdentifier: "cell")
        coll.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        coll.translatesAutoresizingMaskIntoConstraints = false
        //coll.overrideUserInterfaceStyle = .dark
        coll.backgroundColor = .systemBackground
        return coll
    }()
    
    private var appsAgentData: [Apps]?
    var searchText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadApps()
        navigationItem.title = "Выплаты"
        let search = UISearchController(searchResultsController: nil)
        search.delegate = self
        search.searchBar.delegate = self
        self.navigationItem.searchController = search
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        infoCollection.dataSource = self
        infoCollection.delegate = self
        setViews()
        setConstraints()
        
        
        
        
    }
    private func loadData(page: [Apps]) {
        appsAgentData = page
        infoCollection.reloadData()
    }
    func loadApps(){
        let phoneCache = UserDefaults.standard.string(forKey: "phone")!
        NetworkTehnoDB.shared.getAppsOrAgentsForPhone(parapms: phoneCache) { result in
            switch result {
            case .success(let agent):
                self.loadData(page: agent)
            case .failure(let error):
                //self.present(VCReg, animated: true, completion: nil)
                print("error")
            }
        }
    }
    func setViews(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(infoCollection)
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
extension PayVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appsAgentData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PayCell
        
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
                         client: apps?.appCompany ?? "Нет",
                         tariff: "\(apps?.tariffRate ?? "Нет")%" ,
                         summa: apps?.appCost ?? "Нет",
                         comission: formatNumberFromString(apps!.appComission ?? "Нет") ?? "Ошибка" ,
                         status: apps?.payStatus ?? "Нет",
                         date: apps?.payMentDate ?? "Нет")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width/1.05, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(20)
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

//MARK: - SearchBar
extension PayVC: UISearchBarDelegate {
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
            app.appCompany?.lowercased().contains(searchText.lowercased()) ?? true  ||
            app.appStatus?.lowercased().contains(searchText.lowercased()) ?? true
        }
        
        // Обновляем коллекцию с отфильтрованными данными
        if let filteredData = filteredData {
            appsAgentData = filteredData
            infoCollection.reloadData()
        }
    }
}

