//
//  HomeView.swift
//  Inspire Challenge
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State private var searchText = ""
     
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Posts (\(viewModel.posts.count))").foregroundColor(Color("RegularTeal")).padding(8)
                ScrollView {
                    ForEach(viewModel.posts) { post in
                        NavigationLink(destination: PostView(post: post) ) {
                            PostView(post: post).listRowSeparator(.hidden)
                        }.buttonStyle(.plain)
                    }
                }                
            }
        }.searchable(text: $searchText)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
