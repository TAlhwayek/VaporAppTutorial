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
        }
    }
}

#Preview {
    SongList()
}
