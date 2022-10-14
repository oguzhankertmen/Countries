//
//  CountryListViewModel.swift
//  Countries
//
//  Created by Oğuzhan KERTMEN on 14.10.2022.
//

import Foundation

class CountriesViewModel: ObservableObject {
  @Published var countries: [CountryResponseDTO.Country] = []
  
  let countryService: CountriesApi
  
  init(countryApi: CountriesApi) {
    self.countryService = countryApi
  }
  
  func getCountries(){
    self.countryService.getCountries() { result in
      switch result {
      case let .success(response):
        DispatchQueue.main.async {
          self.countries = response.data
        }
      case let .failure(error):
        print(error.localizedDescription)
      }
    }
  }
}
