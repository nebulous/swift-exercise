//
//  HomeViewModel.swift
//  Inspire Challenge
//
//  Created by John Lifsey on 11/23/22.
//

import Foundation

class HomeViewModel : ObservableObject {
    @Published var posts: [Post] = []
       
   init() {
       fetchPosts()
   }
   
   func fetchPosts() {
       guard let file = Bundle.main.url(forResource: "ImportedData", withExtension: "json") else {
           return
       }
       do {
           let postlist = try PostList(fromURL: file)
           posts = postlist.posts
       } catch {
           print("ERROR PARSING \(file)\n\n\(error)")
       }
   }
}
