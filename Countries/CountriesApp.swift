//
//  CountriesApp.swift
//  Countries
//
//  Created by Oğuzhan KERTMEN on 13.10.2022.
//

import SwiftUI
import SDWebImage
import SDWebImageSVGCoder

@main
struct CountriesApp: App {
  var countries : SavedCountries
  init() {
    countries = SavedCountries()
    setUpDependencies()
  }
    var body: some Scene {
        WindowGroup {
          SplashScreenView()
            .environmentObject(self.countries)
        }
    }
}

private extension CountriesApp {
  func setUpDependencies() {
          SDImageCodersManager.shared.addCoder(SDImageSVGCoder.shared)
  }
}
