//
//  ContentView.swift
//  ChatApp
//
//  Created by Ahmed Amin on 23/11/2022.
//

import SwiftUI

struct ContentView: View {
   @StateObject private var messagesManager = MessagesManager()
        
    var body: some View {
        VStack {
            VStack {
                TitleRowView()
                
                ScrollView {
                    ForEach(messagesManager.messages) { message in
                        MessageBubbleView(message: message)
                    }
                }
                .padding(.top, 10)
                .background(.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
            }
            .background(Color("Peach"))
            
            
            MessageFieldView()
                .environmentObject(messagesManager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
