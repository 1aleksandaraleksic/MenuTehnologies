//
//  SingleVenueView.swift
//  MenuTehnologies
//
//  Created by aleksandar.aleksic on 5.10.22..
//

import SwiftUI

struct SingleVenueView: View {
    @State var venueName: String = ""
    @State var distance: String = ""
    @State var address: String = ""
    @State var status: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 6){
            Text(venueName)
                .font(Font.circularStdBold(size: 17))
            Text(distance)
                .font(Font.circularStdSemiBold(size: 14))
            Text(address)
                .font(Font.circularStdRegular())
                .foregroundColor(Color.grayColor)
            Text(status)
                .font(Font.circularStdRegular())
                .foregroundColor(Color.grayColor)

            HSeparatorView()
                .padding(.top, 20)
        }
        .padding()
    }
}

struct SingleVenueView_Previews: PreviewProvider {
    static var previews: some View {
        SingleVenueView()
    }
}
