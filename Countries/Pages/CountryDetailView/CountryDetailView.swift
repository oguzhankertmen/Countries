//
//  CountryDetailView.swift
//  Countries
//
//  Created by Oğuzhan KERTMEN on 15.10.2022.
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImageSVGCoder

struct CountryDetailView: View {
  @StateObject  var viewModel = CountryDetailViewModel(countryApi: CountryService())
  @EnvironmentObject var savedCountries: SavedCountries
  @Environment(\.openURL) var openURL
  
  let country: CountryResponse.Country
  var body: some View {
    NavigationView{
      VStack(alignment: .leading, spacing: 0) {
        if let imageUrl = viewModel.countryDetails?.flagImageUri,
           let url = URL(string: imageUrl) {

          WebImage(
            url: url,
            context: [.imageThumbnailPixelSize : CGSize.zero]
          )
          .resizable()
          .scaledToFit()
          .border(.black, width: 8)
          .cornerRadius(10)

          Text("Country Code: \(country.code)")
            .bold()
            .frame(alignment: .leading)
            .padding()
          Button {
            openURL(URL(string: "https://www.wikidata.org/wiki/\(country.wikiDataId)")!)
          } label: {
            HStack {
              Text("For More Information")
              Image(systemName: "arrow.right")
            }
          }
          .accentColor(.white)
          .buttonStyle(.bordered)
          .background(Color.blue)
          .cornerRadius(8)
          .padding()
          Spacer()
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      
    }
    .navigationTitle(viewModel.countryDetails?.name ?? "??")
    .toolbar {
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
    .onAppear{
      viewModel.getCountryDetails(code: country.code)
    }
  }
}

struct CountryDetailView_Previews: PreviewProvider {
  static var previews: some View {
    CountryDetailView(viewModel: CountryDetailViewModel(countryApi: CountryService()), country: CountryResponse.Country(code: "TR",
                                                                                                                           currencyCodes: ["TR"],
                                                                                                                           name: "Turkey",
                                                                                                                           wikiDataId: "Q43"))
  }
}
