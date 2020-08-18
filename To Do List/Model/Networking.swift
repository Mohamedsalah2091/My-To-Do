//
//  Networking.swift
//  To Do List
//
//  Created by MAK on 5/13/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit

import FirebaseCore
import FirebaseFirestore

enum StartCollection :String{
    case UserData
}
class Networking {
    
    static var users = [UserModel]()
    init() {}
    
    private func referrance(startCollection: StartCollection) ->CollectionReference{
        return Firestore.firestore().collection(startCollection.rawValue)
    }
    
    func create<T:Codable>(data: T){
        
        let json =  data.toJson(keys: ["id"])
        referrance(startCollection: .UserData ).addDocument(data: json)
        
    }
    
    func read<T:Decodable>(objectType : T.Type , completion : @escaping([T]) -> Void ){
        
        referrance(startCollection:.UserData).addSnapshotListener { (snapshot, _) in
            guard let snapshot = snapshot else {return}
            do{
                var objects = [T]()
                
                for  document in snapshot.documents{
                    let object = try document.decode(objectType: objectType)
                    objects.append(object)
                }
                
                completion(objects)
            }catch{
                print(error)
            }
        }
    }
    
    func update<T:Codable & ID >(data: T){
        let json =  data.toJson(keys: ["id"])
        guard let id = data.id else {return}
        referrance(startCollection:.UserData).document(id).setData(json)
    }
    
    func delete<T:ID >(data : T){
        referrance(startCollection:.UserData).document(data.id!).delete()
    }
    
}
extension DocumentSnapshot{
    func decode<T:Decodable>(objectType : T.Type) throws -> T {
        var documentjason = data()
        documentjason!["id"] = documentID
        
        let documentData = try JSONSerialization.data(withJSONObject: documentjason!, options: [])
        let decodedObject = try JSONDecoder().decode(objectType, from: documentData)
        
        return decodedObject
    }
    
}
extension Encodable{
    
    func toJson(keys : [String] = [String]()) -> [String:Any] {
        let object = try! JSONEncoder().encode(self)  // Convert data to json
        let jsonObject = try! JSONSerialization.jsonObject(with: object, options: []) // Convert jason to json object
        guard var json = jsonObject as? [String:Any] else {return ["Error":""]}
        // to not make id an item to save
        for key in keys{
            json[key] = nil
        }
        
        return json
    }
    
}
