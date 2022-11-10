//
//  CoctailsListViewModel.swift
//  Cocktails
//
//  Created by Егор Ярошук on 27.10.22.
//

import SwiftUI

class CoctailsViewModeling: ObservableObject {
    
    @Published var coctailsList: CoctailsList?
    
    func getCoctails() async {}
}

final class CoctailsListViewModel: CoctailsViewModeling {
    // MARK: - Private properties
    
    private let networkServise: NetworkServiceProtocol
    
    // MARK: - Init
    
    init(networkServise: NetworkServiceProtocol = NetworkService.shared) {
        self.networkServise = networkServise
    }
    
    override func getCoctails() async {
        do {
            let coctails = try await networkServise.getAlcoholicCoctails()
            await updateCoctails(coctails: coctails)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @MainActor
    private func updateCoctails(coctails: CoctailsList) {
        self.coctailsList = coctails
    }
}
