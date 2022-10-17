//
//  SavedCountryListView.swift
//  Countries
//
//  Created by Oğuzhan KERTMEN on 16.10.2022.
//

import SwiftUI

struct SavedCountryListView: View {
  @EnvironmentObject var savedCountries: SavedCountries
  
  var body: some View {
    NavigationView {
      ScrollView {
        if savedCountries.savedCountryObjects.count > 0 {
          ForEach(savedCountries.savedCountryObjects, id: \.self){ country in
            NavigationLink(destination: CountryDetailView(country: country)
            ) {
              CountryCell(country: country)
                .environmentObject(savedCountries)
            }
          }
        } else {
          Text("There is no savings in here!")
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .navigationTitle("Countries")
    }
  }
}

struct SavedCountryListView_Previews: PreviewProvider {
  static var previews: some View {
    SavedCountryListView()
      .environmentObject(SavedCountries())
  }
}
