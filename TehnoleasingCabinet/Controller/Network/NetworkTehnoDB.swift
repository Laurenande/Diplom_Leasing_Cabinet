//
//  NetworkTehnoDB.swift
//  TehnoleasingCabinet
//
//  Created by Егор Куракин on 03.12.2023.
//

import Foundation
import Alamofire
class NetworkTehnoDB{
    static let shared = NetworkTehnoDB(); private init() { }
    
    func getAgentsForPhone(parapms: String, complition: @escaping (Result<Agents, Error>) -> ()){
        
        let url = "http://10.211.55.5:3003/api/user/\(parapms)"
        
        AF.request(url, method: .get ).responseDecodable(of: Agents.self) { response in
            guard let data = response.data else {
                if let error = response.error{
                    complition(.failure(error))
                    //print(error)
                }
                return
            }
            let decoder = JSONDecoder()
            guard let daData = try? decoder.decode(Agents.self, from: data) else {
                return
            }
            complition(.success(daData))
        }
    }
    
    func createAgents(parapms: Parameters, complition: @escaping (Result<Agents, Error>) -> ()){
        
        let url = "http://10.211.55.5:3003/api/createuser"
        
        //Передаваемый параметры
        let params: Parameters = parapms
        //print(params)
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON { response in
                guard let data = response.data else {
                    if let error = response.error{
                        complition(.failure(error))
                        print(error)
                    }
                    return
                }
                
            }
    }
    
    func getAppsOrAgentsForPhone(parapms: String, complition: @escaping (Result<[Apps], Error>) -> Void){
        
        let url = "http://10.211.55.5:3003/api/apps/\(parapms)"
        AF.request(url, method: .get ).responseDecodable(of: Apps.self) { response in
            guard let data = response.data else {
                if let error = response.error{
                    complition(.failure(error))
                    print(error)
                }
                return
                //print("lox")
            }
            let decoder = JSONDecoder()
            guard let daData = try? decoder.decode([Apps].self, from: data) else {
                return
            }
            //print(daData)
            complition(.success(daData))
        }
    }
    
    func createAgentsContract(parapms: Parameters, complition: @escaping (Result<Agents, Error>) -> ()){
        
        let url = "http://10.211.55.5:3003/api/add/concract/pe"
        
        //Передаваемый параметры
        let params: Parameters = parapms
        print(params)
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON { response in
                guard let data = response.data else {
                    if let error = response.error{
                        complition(.failure(error))
                        print(error)
                    }
                    print("lox")
                    return
                    
                }
                
            }
    }
}
