//
//  CountriesApi.swift
//  Countries
//
//  Created by Oğuzhan KERTMEN on 14.10.2022.
//

import Foundation

public protocol CountriesApi {
  func getCountries( onComplete: @escaping ((Result<CountryResponseDTO, ApiError>) -> Void))
}
