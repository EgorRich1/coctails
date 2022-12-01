//
//  DatabaseService.swift
//  Cocktails
//
//  Created by Егор Ярошук on 29.11.22.
//

import Foundation
import RealmSwift

protocol DatabaseServiceProtocol {
    func writeCocktail(shortCocktail: ShortDrinkModel, completion: (() -> Void)?)
    func removeCocktail(by id: String, completion: ((Result<Void, Error>) -> Void)?)
    func getListOfFavoriteCocktails() -> [ShortDrinkModel]
}

final class DatabaseService: DatabaseServiceProtocol {
    
    static let shared: DatabaseService = .init()
    
    private var realm: Realm?
    
    init() {}
    
    func setup() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            do {
                self.realm = try Realm()
            } catch {
                fatalError()
            }
        }
    }
    
    func writeCocktail(shortCocktail: ShortDrinkModel, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                completion?()
                return
            }
            do {
                try self.realm?.write({
                    let dbCoctail = DBShortCocktail(shortDrink: shortCocktail)
                    self.realm?.add(dbCoctail, update: .modified)
                })
                completion?()
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func removeCocktail(by id: String, completion: ((Result<Void, Error>) -> Void)? = nil) {
        DispatchQueue.main.async { [weak self] in
            guard
                let self = self,
                let cocktail = self.realm?.objects(DBShortCocktail.self).first(where: { $0.drinkId == id} )
            else {
                completion?(.failure(NSError(domain: "Somethind wrong", code: -1)))
                return
            }
            
            do {
                try self.realm?.write({
                    self.realm?.delete(cocktail)
                })
                completion?(.success(()))
            } catch {
                print("Error: \(error.localizedDescription)")
                completion?(.failure(error))
            }
        }
    }
    
    func getListOfFavoriteCocktails() -> [ShortDrinkModel] {
        if let dbDrinks = realm?.objects(DBShortCocktail.self) {
            var drinks = [ShortDrinkModel]()
            for dbDrink in dbDrinks {
                let drink = ShortDrinkModel(
                    name: dbDrink.title,
                    imageUrl: dbDrink.imageUrl,
                    drinkId: dbDrink.drinkId
                )
                drinks.append(drink)
            }
            return drinks
        }
        return []
    }
}
