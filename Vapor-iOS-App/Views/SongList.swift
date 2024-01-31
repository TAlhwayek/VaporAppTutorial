//
//  ContentView.swift
//  Vapor-iOS-App
//
//  Created by Tony Alhwayek on 1/30/24.
//

import SwiftUI

struct SongList: View {
    
    @StateObject var viewModel = SongListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.songs) { song in
                    Button {
                        
                    } label: {
                        Text(song.title)
                            .font(.title3)
                            .foregroundStyle(Color(.label))
                    }
                }
            }
            .navigationTitle(Text("🎶 Songs"))
            .toolbar {
                Button {
                    
                } label: {
                    Label("Add Song", systemImage: "plus.circle")
                }
            }
        }
        .onAppear {
            Task {
                do {
                    try await viewModel.fetchSongs()
                } catch {
                    print("Error: \(error)")
                }
            }
        }
    }
}

#Preview {
    SongList()
}
