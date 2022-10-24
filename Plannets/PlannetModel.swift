//
//  PlannetModel.swift
//  Plannets
//
//  Created by Keshan Fernando on 2022-10-23.
//

import Foundation

// MARK: - Welcome
struct PlannetResponse: Decodable {
    let count: Int?
    let next: String?
    let results: [Plannet]?
}

// MARK: - Result
struct Plannet: Decodable,Identifiable {
    var id = UUID()
    
    let name, rotationPeriod, orbitalPeriod, diameter: String?
    let climate, gravity, terrain, surfaceWater: String?
    let population: String?
    let residents, films: [String]?
    let created, edited: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population, residents, films, created, edited, url
    }
}

