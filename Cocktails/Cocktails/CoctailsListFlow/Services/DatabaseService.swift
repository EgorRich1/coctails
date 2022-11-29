//
//  DatabaseService.swift
//  Cocktails
//
//  Created by Егор Ярошук on 29.11.22.
//

import Foundation
import RealmSwift

final class DatabaseService {
    
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
                    var dbCoctail = DBShortCocktail(shortDrink: shortCocktail)
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
}
