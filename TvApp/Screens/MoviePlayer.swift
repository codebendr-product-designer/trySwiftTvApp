//
//  MoviePlayer.swift
//  TvApp
//
//  Created by Daniel Saidi on 2021-04-24.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI
import AVKit
import TvAppKit

struct MoviePlayer: UIViewControllerRepresentable {
    
    let movie: Movie
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = AVPlayerViewController()
        controller.player = getPlayer()
        controller.player?.play()
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

private extension MoviePlayer {
    
    func getPlayer() -> AVPlayer? {
        guard let url = movie.videoUrl else { return nil }
        let asset = AVAsset(url: url)
        let item = AVPlayerItem(asset: asset)
        let player = AVPlayer(playerItem: item)
        return player
    }
}

struct MoviePlayer_Previews: PreviewProvider {
    static var previews: some View {
        MoviePlayer(movie: .preview)
    }
}

