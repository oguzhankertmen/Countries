//
//  TabBarView.swift
//  Countries
//
//  Created by Oğuzhan KERTMEN on 16.10.2022.
//

import SwiftUI
import UIKit
import SDWebImageSwiftUI

struct TabBarView: View {
  @EnvironmentObject var savedCountries: SavedCountries
    var body: some View {
      TabView {
        CountryListView()
          .environmentObject(savedCountries)
          .tabItem {
            Label("Home", systemImage: "house.fill")
              .foregroundColor(.white)
          }
        SavedCountryListView()
          .environmentObject(savedCountries)
          .tabItem {
            Label("Saved", systemImage: "heart.fill")
              .foregroundColor(.white)
          }
      }
      .accentColor(.black)
      .onAppear {
          let appearance = UITabBarAppearance()
          appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
          appearance.backgroundColor = UIColor(Color.black.opacity(0.2))
          UITabBar.appearance().standardAppearance = appearance
          UITabBar.appearance().scrollEdgeAppearance = appearance
      }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
      TabBarView()
    }
}
