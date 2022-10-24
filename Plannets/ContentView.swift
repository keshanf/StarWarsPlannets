//
//  ContentView.swift
//  Plannets
//
//  Created by Keshan Fernando on 2022-10-23.
//

import SwiftUI
import CoreData

// The main view of the app, using combine framework 
struct ContentView: View {
    @StateObject var vm = PlannetsViewModel()

    var body: some View {
        NavigationView {
            ZStack{
                if vm.isRefreshing {
                    ProgressView()
                } else {
                    List(vm.plannets) { planet in
                        NavigationLink(destination: PlanetView(planet: planet)) {
                            PlanetRow(planet: planet)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Planets")
            .onAppear(perform: vm.fetchPlannets)
        }
    }
}

// The PlanetRow view for the listing 
struct PlanetRow: View {
    var planet: Plannet
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://picsum.photos/50"))
                    .frame(width: 50, height: 50)
            Text(planet.name!)
            Spacer()
            Text(planet.climate!)
        }
    }
}
