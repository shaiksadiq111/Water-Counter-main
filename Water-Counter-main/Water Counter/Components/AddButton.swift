//
//  AddButton.swift
//  Water Counter
//
//  Created by Prasoon Rajpoot on 29/06/22.
//

import SwiftUI

struct AddButton: View {
    var body: some View {
        ZStack{
            Circle()
                .foregroundColor(.green)
            Text("+")
                .foregroundColor(.white)
                .font(.title)
        }.frame(width: 40)
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton()
    }
}
