//
//  EmptyMessagesView.swift
//  ChatApp
//
//  Created by Ahmed Amin on 23/11/2022.
//

import SwiftUI

struct EmptyMessagesView: View {
    var body: some View {
        LottieView(lottieFile: "emptyMessage")
           // .frame(width: 300, height: 300)
    }
}

struct EmptyMessagesView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyMessagesView()
    }
}
