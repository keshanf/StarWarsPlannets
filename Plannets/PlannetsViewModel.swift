//
//  PlannetsViewModel.swift
//  Plannets
//
//  Created by Keshan Fernando on 2022-10-23.
//

import Foundation
import Combine

final class PlannetsViewModel: ObservableObject, Identifiable {
    
    @Published var plannets: [Plannet] = []
    @Published var hasError = false
    @Published private(set) var isRefreshing = false
    
    private var bag = Set<AnyCancellable> () //to store cancellable, using set to avoid duplicates
    
//    init() {
//        fetchPlannets()
//    }
    
    func fetchPlannets() {         // Fetching Data from the API
        //using combine to pass data to the view

        let planetsUrl = "https://swapi.dev/api/planets/"
        
        if let url = URL(string: planetsUrl){
            isRefreshing = true
            hasError = false
            URLSession.shared.dataTaskPublisher(for: url)
                .receive(on: DispatchQueue.main)
                .map(\.data)
                .decode(type: PlannetResponse.self, decoder: JSONDecoder())
                .sink { res in
                    self.isRefreshing = false
                    
                } receiveValue: { [weak self] newRes in
//                    print("plannets \(String(describing: newRes.results))")
                    self?.plannets = newRes.results!
                }
                .store(in: &bag) //

        } 

    }
}
