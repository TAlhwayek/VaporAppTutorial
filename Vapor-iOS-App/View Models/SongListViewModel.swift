//
//  SongListViewModel.swift
//  Vapor-iOS-App
//
//  Created by Tony Alhwayek on 1/30/24.
//

import Foundation

class SongListViewModel: ObservableObject {
    @Published var songs = [Song]()
    
    func fetchSongs() async throws {
        let urlString = Constants.baseURL + Endpoints.songs
        
        // Get url
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        
        // Fetch response from url
        let songResponse: [Song] = try await HttpClient.shared.fetch(url: url)
        
        DispatchQueue.main.async {
            self.songs = songResponse
        }
    }
}
