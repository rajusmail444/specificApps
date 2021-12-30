//
//  ContentView.swift
//  MVVM
//
//  Created by Rajesh Billakanti on 27/11/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text(viewModel.name)
                    .font(.system(size: 44))
                Text(viewModel.userName)
                    .font(.system(size: 32))
                Text(viewModel.email)
                    .font(.system(size: 24))
            }
            .navigationTitle("User")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
