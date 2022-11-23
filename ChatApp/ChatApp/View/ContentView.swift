//
//  ContentView.swift
//  ChatApp
//
//  Created by Ahmed Amin on 23/11/2022.
//

import SwiftUI

struct ContentView: View {
    var messages: [String] = [
        "Hello you",
        "How are you doing?",
        "I've been building SwiftUI application from scratch and it's so much fun"
    ]
    
    
    var body: some View {
        VStack {
            VStack {
                TitleRowView()
                
                ScrollView {
                    ForEach(messages, id: \.self) { message in
                        MessageBubbleView(message: Message(id: "12345", text: message, received: true, timeStamp: Date()))
                    }
                }
                .padding(.top, 10)
                .background(.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
            }
            .background(Color("Peach"))
            
            
            MessageFieldView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
