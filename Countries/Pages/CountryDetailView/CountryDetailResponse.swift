//
//  CountryDetailResponse.swift
//  Countries
//
//  Created by Oğuzhan KERTMEN on 15.10.2022.
//

import Foundation
  
public struct CountryDetailResponse: Codable, Hashable {
  public let data: CountryDetail
  
  public struct CountryDetail: Codable, Hashable {
      public let capital: String?
      public let code: String
      public let callingCode: String
      public let currencyCodes: [String]
      public let flagImageUri: String
      public let name: String
      public let numRegions: Int
      public let wikiDataId: String
    }
}


