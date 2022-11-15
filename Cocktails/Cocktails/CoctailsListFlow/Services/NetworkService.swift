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
    func getCocktails(isAlcohol: Bool) async throws -> CoctailsList
}

final class NetworkService: NetworkServiceProtocol {
    
    static let shared = NetworkService()
    
    func getCocktails(isAlcohol: Bool) async throws -> CoctailsList {
        let params: Parameters = ["a": isAlcohol ? "Alcoholic" : "Non_Alcoholic"]
        let dataTask = AF.request(NetworkConstants.baseUrl + "filter.php", method: .get, parameters: params).validate(statusCode: 200..<300).serializingDecodable(CoctailsList.self)
        let value = try await dataTask.value
        return value
    }
}
