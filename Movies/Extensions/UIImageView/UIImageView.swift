//
//  UIImageView.swift
//  Movies
//
//  Created by Nelson Bolivar on 3/4/17.
//  Copyright © 2017 Nelson Bolivar. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(with url: URL) {
        self.kf.setImage(with: url)
    }
    
    func setImage(with url: URL, placeholder: UIImage) {
        self.kf.setImage(with: url, placeholder: placeholder, options: nil, progressBlock: nil, completionHandler: nil)
    }
    
}
