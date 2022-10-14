//
//  CountryResponseDTO.swift
//  Countries
//
//  Created by Oğuzhan KERTMEN on 13.10.2022.
//

import Foundation

public struct CountryResponseDTO: Codable, Hashable {
  public let data: [Country]

  public struct Country: Codable, Hashable {
    public let code: String
    public let currencyCodes: [String]
    public let name: String
    public let wikiDataId: String
  }
}
