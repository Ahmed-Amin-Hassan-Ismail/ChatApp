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
    @Published private(set) var lastMessageId = ""
    
    private let database = Firestore.firestore()
    private let collectionName = "messages"
    
    init() {
        getMessages()
    }
    
    
    func getMessages() {
        database.collection(collectionName).addSnapshotListener { querySnapshot, error in
            
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
            
            self.lastMessageId = self.messages.last?.id ?? ""
        }
    }
    
    func sendMessage(text: String) {
        let newMessage = Message(id: UUID().uuidString, text: text, received: false, timeStamp: Date())
        
        do {
            try database.collection(collectionName).document().setData(from: newMessage)
        } catch {
            print("Error encoding document into messages \(error)")
        }
    }
}
