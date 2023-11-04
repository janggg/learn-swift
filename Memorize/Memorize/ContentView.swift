//
//  ContentView.swift
//  Memorize
//
//  Created by Jang Hun Choi on 10/28/23.
//

import SwiftUI


// structs can hold both variables and functions -- similar to class, but not since is not OOP.
// This is functional programming (behavior encapsulation)
struct ContentView: View { 
    // this grammar is saying "this ContentView behaves like a View"

    @State var emojis: Array<String> = []
    // let emojis: [String] = []
    // let emojis: Array<String> = []
    
    //@State var cardCount: Int = 0
    
    var body: some View {
        // var: Computed property. this var is a property of this struct.
        // the value of this variable isn't stored somewhere, but rather COMPUTED
        // some: the type of this variable has to be ANY struct in the world, as long as it's a View.
        //  - see what this returns, and use that
        
        /*
        VStack {
            // VStack: it could also be a VStack(). VStack defines behavioral instructions for elements within {}.
            // Can also be seen as VStack(content: {Image()...})
            // ViewBuilder: Turns the list of views into a tupuleview.
            Image(systemName: "globe")
            // Image(): Example of an "Image Struct", that behave like a view. The simplest view
            // "globe": Name for this named parameter, defining what we'll call it later
                .imageScale(.large)
                .foregroundStyle(.teal)
                // these are functions in Swift -- specificially "View Modifier"
                //  - can be called on any struct that behaves like a View.
                //  - returns a new, modified view. As shown above, the modifiers can be chained
            Text("Hello, world! From jang")
            // Text(): Example of an "Text Struct", that behave like a view
        }
        .padding()
        // View modifier scope applies to the elements inside the given VStack {}
        */
        
        VStack {
            title
            ScrollView {
                cards
            }
            Spacer()
            cardThemeAdjusters
            //cardCountAdjusters
        }
        .padding()
    }
    
    var title: some View {
        Text("Memorize!").font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            // LazyVGrid uses as little space as possible
            ForEach(0..<emojis.count, id: \.self) { index in
                // 0...4: 0 upto and including 4
                // 0..<4: 0 upto 4
                CardView(content: emojis[index])
                    .aspectRatio(4/4, contentMode: .fit)
            }
            
        }
        .foregroundColor(.teal)
    }
    
    var cardThemeAdjusters: some View {
        HStack {
            Spacer()
            cardThemeOne
            Spacer()
            cardThemeTwo
            Spacer()
            cardThemeThree
            Spacer()
            
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cardThemeOne: some View {
        return cardThemeChooser(
            theme: ["😀","😂","😍","🥸","😡","🥶"],
            symbol: "face.smiling.inverse",
            symbol_text: "Faces")
    }
    
    var cardThemeTwo: some View {
        return cardThemeChooser(
            theme: ["🐶","🐱","🐭","🐻","🐼","🐷","🐸","🐵"],
            symbol: "cat.circle.fill",
            symbol_text: "Animals")
    }
    
    var cardThemeThree: some View {
        return cardThemeChooser(
            theme: ["🍎","🍌","🍉","🍇","🍍","🍑","🥝"],
            symbol: "fork.knife.circle.fill",
            symbol_text: "Fruits")
    }
    
    func cardThemeChooser(theme: Array<String>, symbol: String, symbol_text: String) -> some View {
        Button(action: {
            emojis = theme
            emojis += emojis
            emojis.shuffle()
        }, label: {
            VStack {
                Image(systemName: symbol)
                Text(symbol_text).font(.caption)
            }
        })
    }
    
    /*
    var cardCountAdjusters: some View {
        HStack {
            cardAdder
            Spacer()
            cardRemover
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        // by: external parameter name -- used when passing in an argument while calling this function
        // offset: internale parameter name -- used inside this function, as shown below
        // symbol: both external and internal name
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardAdder: some View {
        return cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var cardRemover: some View {
        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus")
    }
    */
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    // we're using var here to allow for different parameters from the default
    // @State is providing as the "pointer" to this variable, allowing for a temporary modification in value
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            // let: is a constant -- does not change, whereas var is a "variable"
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
            // isFaceUp = !isFaceUp
        }
    }
}





#Preview {
    ContentView()
}
