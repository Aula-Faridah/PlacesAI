//
//  ContentView.swift
//  PlacesAI
//
//  Created by MacBook Pro on 24/04/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var placeVM = PlaceVM()
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(placeVM.place, id: \.self){ item in
                    PlaceRow(place: item)
                }
            }
            .navigationTitle("Malang")
            .overlay {
                placeVM.place.isEmpty ? ProgressView() : nil
            }
            .onChange(of: placeVM.isReady, { oldValue, newValue in
                if newValue {
                    Task{
                        await placeVM.getPlaces()
                    }
                }
            })
//            .task {
//                await placeVM.getPlaces()
//            }
            .refreshable {
                await placeVM.getPlaces()
            }
        }
    }
}

#Preview {
    ContentView()
}
