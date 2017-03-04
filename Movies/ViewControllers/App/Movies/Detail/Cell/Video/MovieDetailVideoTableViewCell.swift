//
//  MovieDetailVideoTableViewCell.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit
import YouTubePlayer

class MovieDetailVideoTableViewCell: UITableViewCell {

    @IBOutlet weak var videoTitleLabel: UILabel?
    @IBOutlet weak var videoPlayerView: UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(video: Video) {
        
        guard let name = video.name else { return }
        videoTitleLabel?.text = name
        
        guard let videoKey = video.videoKey else { return }
        
        let videoPlayer = YouTubePlayerView(frame: (videoPlayerView?.bounds)!)
        videoPlayer.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        videoPlayer.loadVideoID(videoKey)
        videoPlayerView?.addSubview(videoPlayer)
    }
}
