//
//  CountryListView.swift
//  Countries
//
//  Created by Oğuzhan KERTMEN on 14.10.2022.
//

import SwiftUI

struct CountryListView: View {
  @ObservedObject var viewModel = CountriesViewModel(countryApi: CountryService())
  
    var body: some View {
      NavigationView {
        List {
          ForEach(viewModel.countries, id: \.self){ country in
            Text(country.name)
          }
        }
        .navigationTitle("Countries")
      }
      .onAppear(perform: viewModel.getCountries)
    }
}

struct CountryListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}
