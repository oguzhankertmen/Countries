//
//  CountryDetailViewModel.swift
//  Countries
//
//  Created by Oğuzhan KERTMEN on 16.10.2022.
//

import Foundation

class CountryDetailViewModel: ObservableObject {
  @Published var countryDetails: CountryDetailResponse.CountryDetail?
  
  let countryService: CountriesApi
  
  init(countryApi: CountriesApi) {
    self.countryService = countryApi
  }
  
  func getCountryDetails(code: String){
    self.countryService.getCountryDetails(code: code){ result in
      switch result {
      case let .success(response):
        DispatchQueue.main.async {
          self.countryDetails = response.data
        }
      case let .failure(error):
        print(error)
      }
    }
  }
}

