//
//  ContentView.swift
//  MovieTicketDribble
//
//  Created by Satya Prakash Sahu on 25/09/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Home()
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
