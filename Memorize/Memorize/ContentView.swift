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
    

        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView(isFaceUp: true)
        }
        .foregroundColor(.teal)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp = false
    // we're using var here to allow for different parameters from the default
    // @State is providing as the "pointer" to this variable
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            // let: is a constant -- does not change, whereas var is a "variable"
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text("👀").font(.largeTitle)
            } else {
                base.fill()
            }
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
