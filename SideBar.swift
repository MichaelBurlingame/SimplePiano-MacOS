//
//  SideBar.swift
//  
//
//  Created by Michael Burlingame on 2/21/23.
//

import SwiftUI

struct Option: Hashable {
    let title: String
    let imageName: String
}

struct SideBar: View {
    
    @State var currentOption = 0
    
    let options: [Option] = [
        .init(title: "Play", imageName: "play"),
        .init(title: "How To:", imageName: "info.circle")
    ]
    
    var body: some View {
        
        NavigationView {
            
            ListView(currentSelection: self.$currentOption, options: options)
            
            switch currentOption {
            case 1:
                AboutView()
            default:
                PianoView()
            }
            
        }
        .frame(minWidth: 600, minHeight: 400)
        .frame(maxWidth: 700, maxHeight: 500)
        .preferredColorScheme(.dark)
    }
}

struct ListView: View {
    
    @Binding var currentSelection: Int
    
    let options: [Option]
    
    var body: some View {
        
        VStack {
            let current  = options[currentSelection]
            ForEach(options, id:\.self) { option in
                
                HStack {
                    Image(systemName: option.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                    
                    Text(option.title)
                        .foregroundColor(current == option ? Color(.linkColor) : Color(.labelColor))
                    Spacer()
                }
                .padding()
                .onTapGesture {
                    if option.title == "Play" {
                        currentSelection = 0
                    } else if option.title == "How To:" {
                        self.currentSelection = 1
                    }
                }
            }
            Spacer()
        }
    }
}
