//
//  StadiumDetailsView.swift
//  Booking
//
//  Created by Samuel Hellstrøm on 13/05/2025.
//

import SwiftUI

struct StadiumDetailsView: View {
    let stadium: Stadium
    
    var body: some View {
        VStack {
            Text(stadium.name)
                .font(.largeTitle)
            Text("Stadium details will appear here")
            Spacer()
        }
        .padding()
        .navigationTitle(stadium.name)
    }
}

struct StadiumDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        StadiumDetailsView(stadium: StadiumMock.sampleStadiums[0])
    }
}
