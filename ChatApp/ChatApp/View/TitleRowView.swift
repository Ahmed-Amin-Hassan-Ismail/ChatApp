//
//  TitleRowView.swift
//  ChatApp
//
//  Created by Ahmed Amin on 23/11/2022.
//

import SwiftUI

struct TitleRowView: View {
    
    var body: some View {
        HStack(spacing: 20) {
            Image("username")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .cornerRadius(50)
            
            VStack(alignment: .leading) {
                Text("Ahmed Amin")
                    .font(.title)
                    .bold()
                
                Text("online")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "phone.fill")
                .foregroundColor(.gray)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
        }
        .padding()
    }
}

struct TitleRowView_Previews: PreviewProvider {
    static var previews: some View {
        TitleRowView()
            .background(Color("Peach"))
    }
}
