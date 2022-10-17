//
//  CountriesApi.swift
//  Countries
//
//  Created by Oğuzhan KERTMEN on 14.10.2022.
//

import Foundation

public protocol CountriesApi {
  func getCountries(offSet: Int, onComplete: @escaping ((Result<CountryResponse, ApiError>) -> Void))
  func getCountryDetails( code: String, onComplete: @escaping ((Result<CountryDetailResponse, ApiError>) -> Void))
}
