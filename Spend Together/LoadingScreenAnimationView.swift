//
//  LoadingScreenAnimationView.swift
//  Spend Together
//
//  Created by Jose Manuel Roldan Gomez on 7/3/23.
//

import SwiftUI

struct LoadingScreenAnimationView: View {
    @State private var heartOffset: CGSize = CGSize(width: 0, height: -100)
    @State private var dollarOffset: CGSize = CGSize(width: 0, height: 100)
    
    var body: some View {
        ZStack {
            Image(systemName: "heart.fill")
                .foregroundColor(.white)
                .font(.system(size: 50))
                .offset(heartOffset)
            
            Image(systemName: "dollarsign.circle.fill")
                .foregroundColor(.white)
                .font(.system(size: 50))
                .offset(dollarOffset)
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                withAnimation(.interpolatingSpring(mass: 0.1, stiffness: 5, damping: 1, initialVelocity: 0)) {
                    heartOffset = CGSize(width: -50, height: -100)
                    dollarOffset = CGSize(width: 50, height: 100)
                }
                
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { timer in
                    withAnimation(.interpolatingSpring(mass: 0.1, stiffness: 5, damping: 1, initialVelocity: 0)) {
                        heartOffset = CGSize(width: 0, height: -100)
                        dollarOffset = CGSize(width: 0, height: 100)
                    }
                }
            }
        }
    }
}

struct LoadingScreenAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreenAnimationView()
    }
}


