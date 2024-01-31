//
//  ContentView.swift
//  Vapor-iOS-App
//
//  Created by Tony Alhwayek on 1/30/24.
//

import SwiftUI

struct SongList: View {
    
    @StateObject var viewModel = SongListViewModel()
    @State var modal: ModalType? = nil
    
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
                    modal = .add
                } label: {
                    Label("Add Song", systemImage: "plus.circle")
                }
            }
        }
        .sheet(item: $modal, onDismiss: {
            Task {
                do {
                    try await viewModel.fetchSongs()
                } catch {
                    print("ERROR: \(error)")
                }
            }
        }) { modal in
            switch modal {
            case .add:
                AddUpdateSong(viewModel: AddUpdateSongViewModel())
            case .update(let song):
                AddUpdateSong(viewModel: AddUpdateSongViewModel(currentSong: song))
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
