//
//  LoadingScreenView.swift
//  Spend Together
//
//  Created by Jose Manuel Roldan Gomez on 7/3/23.
//
import SwiftUI

struct LoadingScreenView: View {
    @State private var isShowingContent = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(red: 233/255, green: 53/255, blue: 110/255), Color(red: 245/255, green: 184/255, blue: 49/255)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .blur(radius: 50)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Text("Spend Together+")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                
                Text("From Josema and Chrysa for the world")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.white)
                
                Spacer()
            }
            
            LoadingScreenAnimationView()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                isShowingContent = true
            }
        }
        .opacity(isShowingContent ? 0 : 1)
    }
}

struct LoadingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreenView()
    }
}
