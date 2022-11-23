//
//  MessageFieldView.swift
//  ChatApp
//
//  Created by Ahmed Amin on 23/11/2022.
//

import SwiftUI

struct MessageFieldView: View {
    @State private var message: String = ""
    
    var body: some View {
        HStack {
            CustomTextField(text: $message, placeholder: "Enter your message here")
            
            Button {
                print("message sent!")
                message = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color("Peach"))
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color("Gray"))
        .cornerRadius(50)
        .padding()

    }
}

struct MessageFieldView_Previews: PreviewProvider {
    static var previews: some View {
        MessageFieldView()
    }
}


struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        
        TextField(placeholder, text: $text)
    }
}
