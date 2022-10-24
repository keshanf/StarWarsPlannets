//
//  PlanetView.swift
//  Plannets
//
//  Created by Keshan Fernando on 2022-10-24.
//

import SwiftUI

struct PlanetView: View {
    var planet: Plannet
    var body: some View {
        
        VStack(alignment: .center){
            
            VStack(alignment: .leading) {
              
                HStack{
                    Text("Orbital Period: \(planet.orbitalPeriod!)")
                    Spacer()
                    Text("Gravity: \(planet.gravity!)")
                    
                }
            }
            .padding()
            .navigationTitle(planet.name!)
            AsyncImage(url: URL(string: "https://picsum.photos/350"))
                .clipShape(Circle())
            
        }
    }
}

struct PlanetViews_Previews: PreviewProvider {
    static var previews: some View {
        PlanetView(planet: Plannet(name: "Tatooine", rotationPeriod: "10", orbitalPeriod: "20", diameter: "1000", climate: "300", gravity: "Arid", terrain: "1045", surfaceWater: "no", population: "100", residents: ["123"], films: ["123"], created: "cre", edited: "hello", url: "www.test"))
    }
}
