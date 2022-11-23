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
                
                if messagesManager.messages.isEmpty {
                    EmptyMessagesView()
                        .padding(.top, 10)
                        .background(.white)
                        .cornerRadius(30, corners: [.topLeft, .topRight])
                } else {
                    ScrollViewReader { proxy in
                        ScrollView {
                            ForEach(messagesManager.messages) { message in
                                MessageBubbleView(message: message)
                            }
                        }
                        .padding(.top, 10)
                        .background(.white)
                        .cornerRadius(30, corners: [.topLeft, .topRight])
                        .onChange(of: messagesManager.lastMessageId) { id in
                            withAnimation {
                                proxy.scrollTo(id, anchor: .bottom)
                            }
                        }
                    }
                }
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
