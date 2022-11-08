//
//  NetworkService.swift
//  Cocktails
//
//  Created by Егор Ярошук on 8.11.22.
//

import Foundation
import Alamofire

struct NetworkConstants {
    static let baseUrl = "https://www.thecocktaildb.com/api/json/v1/1/"
}

protocol NetworkServiceProtocol {
    func getAlcoholicCoctails() async throws -> CoctailsList
}

final class NetworkService: NetworkServiceProtocol {
    
    static let shared = NetworkService()
    
    func getAlcoholicCoctails() async throws -> CoctailsList {
        let params: Parameters = ["a": "Alcoholic"]
        let dataTask = AF.request(NetworkConstants.baseUrl + "filter.php", method: .get, parameters: params).validate(statusCode: 200..<300).serializingDecodable(CoctailsList.self)
        let value = try await dataTask.value
        return value
    }
}
