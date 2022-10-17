//
//  CountryListView.swift
//  Countries
//
//  Created by Oğuzhan KERTMEN on 14.10.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct CountryListView: View {
  @StateObject var viewModel = CountriesViewModel(countryApi: CountryService())
  @EnvironmentObject var savedCountries : SavedCountries
  
  var body: some View {
    NavigationView {
      ScrollView {
        ForEach(viewModel.countries, id: \.self){ country in
          NavigationLink(destination: CountryDetailView(country: country)) {
            CountryCell(country: country)
              .environmentObject(savedCountries)
          }
        }
        Button {
          viewModel.currentOffSet += 10
        } label: {
          Text("Load More")
            .frame( alignment: .center)
          }
        .buttonStyle(.bordered)
        .cornerRadius(10)
        Spacer()
      }
      .navigationBarTitleDisplayMode(.inline)
      .navigationTitle("Countries")
    }
    .onAppear(perform: viewModel.getCountries)
  }
}

struct CountryListView_Previews: PreviewProvider {
  static var previews: some View {
    CountryListView(viewModel: CountriesViewModel(countryApi: CountryService()))
  }
}
