//
//  NetworkServideWithAF.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 26.11.2023.
//

import Foundation
import Alamofire
class NetworkServideWithAF{
    static let shared = NetworkServideWithAF(); private init() { }
    
    func fetchData(parapms: String, complition: @escaping (Result<DaDataStruct, Error>) -> ()){
        
        let url = "https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/party"
        
        //Передаваемый параметры
        let params: Parameters = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "token": "ff166055839d5058ebe6df03943ca57d795737f8",
            "query": "\(parapms)"
        ]
        AF.request(url, method: .get, parameters: params ).responseDecodable(of: DaDataStruct.self) { response in
            guard let data = response.data else {
                if let error = response.error{
                    complition(.failure(error))
                }
                return
            }
            let decoder = JSONDecoder()
            guard let daData = try? decoder.decode(DaDataStruct.self, from: data) else {
                return
            }
            complition(.success(daData))
        }
    }
}



