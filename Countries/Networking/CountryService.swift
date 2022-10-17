//
//  CountriesService.swift
//  Countries
//
//  Created by Oğuzhan KERTMEN on 14.10.2022.
//

import Foundation

public final class CountryService: CountriesApi {
  
  public func getCountries(offSet: Int, onComplete: @escaping ((Result<CountryResponse, ApiError>) -> Void)) {

    var request = URLRequest(
      url: URL(string: "https://wft-geo-db.p.rapidapi.com/v1/geo/countries?offset=\(offSet)&limit=10")!,
      cachePolicy: .useProtocolCachePolicy,
      timeoutInterval: 10.0)
    
    let urlHeaders = [
      "X-RapidAPI-Key": "6d85c62365mshef30705391f67dap1f6f57jsn5d0b50799b96",
      "X-RapidAPI-Host": "wft-geo-db.p.rapidapi.com"
    ]
    
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = urlHeaders
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request)  { (data, response, error) in
      guard let data = data, error == nil else {
        return  onComplete(.failure(.dataNotArrived))
      }
      do {
        let countries = try JSONDecoder().decode(CountryResponse.self, from: data)
        onComplete(.success(countries))
      }
      catch {
        onComplete(.failure(.dataNotProcessed))
      }
    }
    dataTask.resume()
  }
  
  public func getCountryDetails(code: String, onComplete: @escaping ((Result<CountryDetailResponse, ApiError>)-> Void)) {
    let countryUrl = "https://wft-geo-db.p.rapidapi.com/v1/geo/countries/\(code)"
    var request = URLRequest(
      url: URL(string: countryUrl)!,
      cachePolicy: .useProtocolCachePolicy,
      timeoutInterval: 10.0)
    
    let urlHeaders = [
      "X-RapidAPI-Key": "6d85c62365mshef30705391f67dap1f6f57jsn5d0b50799b96",
      "X-RapidAPI-Host": "wft-geo-db.p.rapidapi.com"
    ]
    
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = urlHeaders
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request)  { (data, response, error) in
      guard let data = data, error == nil else {
        return  onComplete(.failure(.dataNotArrived))
      }
      do {
        let country = try JSONDecoder().decode(CountryDetailResponse.self, from: data)
        onComplete(.success(country))
      }
      catch {
        onComplete(.failure(.dataNotProcessed))
      }
    }
    dataTask.resume()
  }
}

public enum ApiError: Error {
  case dataNotArrived
  case dataNotProcessed
}
