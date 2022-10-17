//
//  SavedCountries.swift
//  Countries
//
//  Created by Oğuzhan KERTMEN on 17.10.2022.
//

import Foundation

class SavedCountries: ObservableObject {
  @Published private(set) var savedCountryObjects: [CountryResponse.Country] = []
  
  func saveCountry(country: CountryResponse.Country){
    savedCountryObjects.append(country)
  }
  
  func unSaveCountry(country: CountryResponse.Country){
    savedCountryObjects = savedCountryObjects.filter{ $0.code != country.code }
  }
}
