//
//  CountryCell.swift
//  Countries
//
//  Created by Oğuzhan KERTMEN on 15.10.2022.
//

import SwiftUI

struct CountryCell: View {
  @EnvironmentObject var savedCountries: SavedCountries
  var country: CountryResponse.Country

    var body: some View {
      ZStack {
        HStack{
          Text(country.name)
            .padding()
          Spacer()
          Button {
            if savedCountries.savedCountryObjects.contains(country){
              savedCountries.unSaveCountry(country: country)
            } else {
              savedCountries.saveCountry(country: country)
            }
          } label: {
            Image(systemName: savedCountries.savedCountryObjects.contains(country) ? "star.fill" : "star")
              .foregroundColor(.black)
              .padding()
          }
        }
        .listRowSeparatorTint(.white)
        .ignoresSafeArea(edges: .horizontal)
        .background(Color.white)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(.black, lineWidth: 3))
        .deleteDisabled(true)
        .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
      }
    }
}

struct CountryCell_Previews: PreviewProvider {
    static var previews: some View {
      
        CountryCell(
          country: CountryResponse.Country(
            code: "TR",
            currencyCodes: ["TRY"],
            name: "Turkey",
            wikiDataId: "Q28")
        ).environmentObject(SavedCountries())
    }
}
