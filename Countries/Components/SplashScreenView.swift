//
//  File.swift
//  Countries
//
//  Created by Oğuzhan KERTMEN on 17.10.2022.
//

import SwiftUI

struct SplashScreenView: View {
  @EnvironmentObject var savedCountries: SavedCountries
  @State var isActive : Bool = false
  @State private var size = 0.8
  @State private var opacity = 0.5
  
  var body: some View {
    if isActive {
      TabBarView()
        .environmentObject(savedCountries)
    } else {
      VStack {
        VStack {
          Image(systemName: "flag.filled.and.flag.crossed")
            .font(.system(size: 80))
            .foregroundColor(.red)
          Text("Countries App")
            .font(Font.custom("PT Serif Bold", size: 25))
            .foregroundColor(.black.opacity(0.80))
        }
        .scaleEffect(size)
        .opacity(opacity)
        .onAppear {
          withAnimation(.easeIn(duration: 0.8)) {
            self.size = 0.9
            self.opacity = 1.00
          }
        }
      }
      .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
          withAnimation {
            self.isActive = true
          }
        }
      }
    }
  }
}

struct SplashScreenView_Previews: PreviewProvider {
  static var previews: some View {
    SplashScreenView()
  }
}
