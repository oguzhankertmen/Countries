//
//  CountryListViewModel.swift
//  Countries
//
//  Created by Oğuzhan KERTMEN on 14.10.2022.
//

import Foundation


class CountriesViewModel: ObservableObject {
  @Published var countries: [CountryResponse.Country] = []
  @Published var savedCountries: [CountryResponse.Country] = []
  
  let countryService: CountriesApi
  
  init(countryApi: CountriesApi) {
    self.countryService = countryApi
  }
  
  public var currentOffSet = 0 {
    didSet {
      self.getCountries()
    }
  }
  
  func getCountries(){
    self.countryService.getCountries(offSet: self.currentOffSet) { result in
      switch result {
      case let .success(response):
        DispatchQueue.main.async {
          self.countries.append(contentsOf: response.data)
        }
      case let .failure(error):
        print(error)
      }
    }
  }
}
