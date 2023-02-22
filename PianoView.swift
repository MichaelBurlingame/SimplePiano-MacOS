//
//  ContentView.swift
//  
//
//  Created by Michael Burlingame on 2/21/23.
//

import SwiftUI

struct PianoView: View {
    
    @State var selection = "nil"
    
    let songs = [
        "Twinkle Twinkle Little Star",
        "Mary Had A Little Lamb",
        "The Itsy Bitsy Spider",
        "Old MacDonald Had A Farm",
        "None"
    ]
    
    var body: some View {
        
        VStack {
            
            HStack {
                Spacer()
                Picker("Select A Song", selection: $selection) {
                    ForEach(songs, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 300)
                Spacer()
            }
            
            ScrollView {
                
                if selection == "Twinkle Twinkle Little Star" {
                    Text("""
Twinkle, twinkle, little star
C C G G A A G
How I wonder what you are
F F E E D D C
Up above the world so high
G G F F E E D
Like a diamond in the sky
G G F F E E D
Twinkle, twinkle, little star
C C G G A A G
How I wonder what you are
F F E E D D C
""")
                    
                } else if selection == "Mary Had A Little Lamb" {
                    Text("""
Mary had a little lamb
E D C D E E E
Little lamb, little lamb
D D D E G G
Mary had a little lamb
E D C D E E E
Its fleece was white as snow
E D D E D C
""")
                } else if selection == "The Itsy Bitsy Spider" {
                    Text("""
The itsy bitsy spider went up the water spout
G C C C D E E E D C D E C
Down came the rain and washed the spider out
E E F G G F E F G E
Out came the sun and dried up all the rain
C C D E E D C D E C
And the itsy bitsy spider went up the spout again
G G C C C D E E E D C D E C
""")
                } else if selection == "Old MacDonald Had A Farm" {
                    Text("""
Old MacDonald had a farm
G G G D E E D
E-i-e-i-o
B B A A G
And on that farm he had a cow
D G G G D E E D
E-i-e-i-o
B B A A G
With a moo moo here and a moo moo there
D D G G G D D G G G
Here a moo, there a moo
G G G G G G
Everywhere a moo moo
G G G G G G
Old MacDonald had a farm
G G G D E E D
E-i-e-i-o
B B A A G
""")
                } else {
                    Text("")
                }
                
            }
            .padding()
            .multilineTextAlignment(.center)
            .lineSpacing(5)
            
            Spacer()
            
            HStack {
                
                CDEF()
                CDEF()
                
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct Key: View {
    
    var note: String
    var label: String
    var shortcut: Character
    
    var body: some View {
        
        ZStack {
            Button(action: { playSounds(note) }) {}
                .keyboardShortcut(.init(shortcut), modifiers: [])
            Rectangle()
                .frame(width: 20, height: 100)
                .border(.black)
                .onTapGesture {
                    playSounds(note)
                }
            
            Text(label)
                .foregroundColor(.black)
        }
    }
}

struct CDEF: View {

    var body: some View {
        
        Key(note: "c", label: "C", shortcut: "a")
        
        Key(note: "d", label: "D", shortcut: "s")
        
        Key(note: "e", label: "E", shortcut: "d")
        
        Key(note: "f", label: "F", shortcut: "f")
        
        Key(note: "g", label: "G", shortcut: "g")
        
        Key(note: "a", label: "A", shortcut: "h")
        
        Key(note: "b", label: "B", shortcut: "j")
        
    }
}

struct PianoView_Previews: PreviewProvider {
    static var previews: some View {
        PianoView()
    }
}
