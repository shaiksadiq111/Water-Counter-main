//
//  DataController.swift
//  Water Counter
//
//  Created by Prasoon Rajpoot on 29/06/22.
//

import Foundation
import CoreData

class DataController : ObservableObject{
    let cantainer = NSPersistentContainer(name: "WaterModel1");
    init(){
        cantainer.loadPersistentStores { description , error in
            if let error = error {
                print("core data failed to load")
                print(error);
            }
        }
    }
    
    
}
