//
//  CountriesService.swift
//  Countries
//
//  Created by Oğuzhan KERTMEN on 14.10.2022.
//

import Foundation

public final class CountryService: CountriesApi {
  public func getCountries(onComplete: @escaping ((Result<CountryResponseDTO, ApiError>) -> Void)) {
    var request = URLRequest(
      url: URL(string: "https://wft-geo-db.p.rapidapi.com/v1/geo/countries?limit=10")!,
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
        let countries = try JSONDecoder().decode(CountryResponseDTO.self, from: data)
        onComplete(.success(countries))
      }
      catch {
        print(error)
      }
    }
    
    dataTask.resume()
  }
}


public enum ApiError: Error {
  case wrongUrl
  case dataNotArrived
  case dataNotProcessed
}
