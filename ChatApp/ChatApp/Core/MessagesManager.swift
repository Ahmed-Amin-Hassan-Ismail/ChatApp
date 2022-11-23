//
//  MessagesManager.swift
//  ChatApp
//
//  Created by Ahmed Amin on 23/11/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


final class MessagesManager: ObservableObject {
    @Published private(set) var messages = [Message]()
    private let database = Firestore.firestore()
    
    init() {
        getMessages()
    }
    
    
    func getMessages() {
        database.collection ("messages").addSnapshotListener { querySnapshot, error in
            
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents...", String(describing: error))
                return
            }
            
            self.messages = documents.compactMap({ document -> Message? in
                do {
                    return try document.data(as: Message.self)
                } catch {
                    print("Error decoding document into messages \(error)")
                    return nil
                }
            })
            
            self.messages.sort { $0.timeStamp < $1.timeStamp}
        }
    }
}
