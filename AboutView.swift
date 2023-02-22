//
//  AboutView.swift
//  
//
//  Created by Michael Burlingame on 2/21/23.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                Text("How To Play:")
                    .underline()
                    .scaleEffect(1.5)
                Spacer()
            }
            
            Image("howTo")
                .resizable()
                .frame(maxWidth: 350, maxHeight: 200)
                .aspectRatio(contentMode: .fit)
                .padding(.top, 20)
            
            HStack {
                Spacer()
                Text("OR")
                    .underline()
                    .scaleEffect(1.5)
                Spacer()
            }
            
            HStack {
                Spacer()
                Text("Simply Click The Keys")
                    .scaleEffect(1.5)
                Spacer()
            }
            .padding(.top, 20)
            
        }
        .padding()
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
