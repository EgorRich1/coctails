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
    func getCocktails(isAlcohol: Bool) async throws -> CocktailsList
    func getCoctailDetails(for id: String) async throws -> DrinkDetails
    func getSearchedCocktails(for name: String) async throws -> DrinkDetails
}

final class NetworkService: NetworkServiceProtocol {
    
    static let shared = NetworkService()
    
    func getCocktails(isAlcohol: Bool) async throws -> CocktailsList {
        let params: Parameters = ["a": isAlcohol ? "Alcoholic" : "Non_Alcoholic"]
        let dataTask = AF.request(NetworkConstants.baseUrl + "filter.php", method: .get, parameters: params).validate(statusCode: 200..<300).serializingDecodable(CocktailsList.self)
        let value = try await dataTask.value
        return value
    }
    
    func getCoctailDetails(for id: String) async throws -> DrinkDetails {
        let params: Parameters = ["i": id]
        let dataTask = AF.request(NetworkConstants.baseUrl + "lookup.php", method: .get, parameters: params).validate(statusCode: 200..<300).serializingDecodable(DrinkDetails.self)
        let value = try await dataTask.value
        return value
    }
    
    func getSearchedCocktails(for name: String) async throws -> DrinkDetails {
        let params: Parameters = ["s": name]
        let dataTask = AF.request(NetworkConstants.baseUrl + "search.php", method: .get, parameters: params).validate(statusCode: 200..<300).serializingDecodable(DrinkDetails.self)
        let value = try await dataTask.value
        return value
    }
}
