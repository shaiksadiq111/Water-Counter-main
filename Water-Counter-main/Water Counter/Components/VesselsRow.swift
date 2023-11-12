//
//  VesselsRow.swift
//  Water Counter
//
//  Created by Prasoon Rajpoot on 29/06/22.
//

import SwiftUI



struct VesselsRow: View {
    
    @Environment(\.managedObjectContext) var context;
    
    
    var vesse : Vessel
    var title : String = "";
    var drankToday : String = ""
    
    init(vessel : Vessel){
        vesse = vessel
        drankToday = getDrank()
        title = vessel.name ?? "";
        
    }

   
    
    
    var body: some View {
        HStack{
            Text(title)
                .font(.title2)
                .padding()
            Spacer()
            Text(drankToday)
                .font(.title2)
                .padding()
        }.swipeActions(edge: .trailing){
            Button("+1"){
                var newDrink = DrankNow(context: context)
                newDrink.date = Date();
                newDrink.vessel = vesse;
                do{
                    try context.save()
                }catch{
                    print("error while saving \(error)")
                }
            }


        }.swipeActions(edge: .leading){
            Button("-1") {
                print("removed one more to day")
            }
        }
    }
    
    func getDrank() -> String{
        
        var counter = 0;
        
        if let drinkRecords = vesse.drankNow?.allObjects as? [DrankNow] {
            drinkRecords.forEach { record in
                if(record.date?.formatted(date : .numeric, time: .omitted) == Date().formatted(date: .numeric, time: .omitted)){
                    counter = counter + 1;
                }
                
            }
            
            return(String(counter))
            
        }
        else{
            return String(counter)
        }
    }
}

//struct VesselsRow_Previews: PreviewProvider {
//    static var previews: some View {
//        VesselsRow(vessel: <#Vessel#>)
//    }
//}
