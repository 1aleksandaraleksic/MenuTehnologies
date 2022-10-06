//
//  VenueListView.swift
//  MenuTehnologies
//
//  Created by aleksandar.aleksic on 5.10.22..
//

import SwiftUI

struct VenueListView: View {
    @ObservedObject var viewModel: VenueListViewModel = VenueListViewModel()

    var body: some View {
        ScrollView{
            ForEach(viewModel.venues, id:\.id){ venue in
                SingleVenueView(venueName: venue.name,
                                distance: "\(venue.distance)",
                                address: venue.address,
                                status: venue.status)
            }
            Spacer()
        }
        .onAppear{
            viewModel.fetchVenes()
        }
    }
}
