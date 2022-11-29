//
//  PostView.swift
//  Inspire Challenge
//
//  Created by John Lifsey on 11/17/22.
//

import SwiftUI

struct PostView: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image("ProfileActive")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 32, height: 32)
                    .padding(4)
                
                VStack(alignment: .leading) {
                    Text(post.author?.nickname ?? "").bold()
                    Text(post.created.formatted(
                        .dateTime
                            .month()
                            .day()
                            .year()
                    ) + " • " + post.created.formatted(
                        .dateTime
                            .hour()
                            .minute()
                    )).foregroundColor(Color("Grey3"))
                    Text(post.updated ?? "")
                }
                
                Spacer()
            }
            Text(post.title).font(.system(size: 36)).bold().padding()
            Text(post.content).font(.system(size: 20)).padding()
            HStack {
                Image("ReplyIcon")
                Text("\(post.replyCountNonDeleted ?? 0) replies")
                
                Image("share")
                Text("Share")
                
                Image("ReactIcon")
                Text("React")
                
                Spacer()
                
                HStack(spacing: -8) {
                    Image("ReactionNewSupport")
                    Image("ReactionNewUseful")
                    Image("ReactionNewThanks")
                }
                Text(post.reactions?.count.formatted() ?? "")
            }
            Divider()
            Spacer()
        }.padding().navigationBarTitle("")
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        let previewpost = HomeViewModel().posts.randomElement()!
        PostView(post: previewpost)
    }
}
