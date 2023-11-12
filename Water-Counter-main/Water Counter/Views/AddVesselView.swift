//
//  AddVesselView.swift
//  Water Counter
//
//  Created by Prasoon Rajpoot on 29/06/22.
//

import SwiftUI

struct AddVesselView: View {
    
    @Environment(\.managedObjectContext) var context;
    @Environment(\.dismiss) var dismiss
    @State public var name : String = "";
    @State public var capacity : String = "";
    
    var body: some View {
        VStack{
            Text("Create A New Vessel")
                .font(.title)
                .padding()
            TextField("Name Of Vessel", text: $name)
                .font(.title2)
                .cornerRadius(50)
                .padding()
                .foregroundColor(.black)
            
            TextField("Capacity of Vessel (in ml)", text: $capacity )
                .font(.title2)
                .cornerRadius(50)
                .padding()
                .foregroundColor(.black)
            Button("Add Vessel") {
                let newVessel = Vessel(context: context)
                newVessel.name = name;
                newVessel.capacity = Double(capacity) ?? 0
                newVessel.date = Date()
                
                do{
                    try context.save()
                    dismiss()
                }catch{
                    print("error while trying to save vessel");
                    print(error)
                }
                
            }.padding()
            
            Spacer()
            
        }
    }
}

struct AddVesselView_Previews: PreviewProvider {
    static var previews: some View {
        AddVesselView()
    }
}
