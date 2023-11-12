//
//  HomeView.swift
//  Water Counter
//
//  Created by Prasoon Rajpoot on 29/06/22.
//

import SwiftUI
import CoreData


struct HomeView: View {
    
    @Environment(\.managedObjectContext) var context;
    
    @State public var isAddVesselShow : Bool = false;
    
    @State var totalWaterDrankToday : Int = 0;
    
    
    @FetchRequest(sortDescriptors: [])  var vessels : FetchedResults <Vessel>
    

    init(){
        _vessels =  FetchRequest<Vessel>(sortDescriptors: [])

        totalWaterDrankToday = getTotalWaterDrankToday()
    }



    
    
    var body: some View {
        VStack{
            HStack(spacing: 70){
                Text("Today's Water Intake").font(.title3)
                Text("\(totalWaterDrankToday) ml").font(.title3)
            }.padding(.top, 20)
            
            List(vessels){ vessel in
                                
                VesselsRow(vessel : vessel)
                    .environment(\.managedObjectContext, context)
            }
            
            HStack{
                Spacer()
                AddButton()
                    .padding([.trailing, .bottom] , 30)
                    .onTapGesture {
                        isAddVesselShow.toggle()
                    }
            }

        }
        .sheet(isPresented: $isAddVesselShow) {
            AddVesselView()
                .environment(\.managedObjectContext, context)
        }
    }
    
    
    func getTotalWaterDrankToday() -> Int{
        totalWaterDrankToday = 0;
        vessels.forEach { vessel in
            if let vesselDrinks = vessel.drankNow?.allObjects as? [DrankNow]{
                
                vesselDrinks.forEach { drink in
                    if(drink.date?.formatted(date: .numeric, time: .omitted) == Date().formatted(date: .numeric, time: .omitted)){
                        totalWaterDrankToday = totalWaterDrankToday + vesselDrinks.count*Int(vessel.capacity)
                        print(totalWaterDrankToday)
                    }
                }
                
                
            }
        }
        
        print(totalWaterDrankToday)
        return totalWaterDrankToday
    }
    
    
    

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
