//
//  ImageViewController.swift
//  Cassini
//
//  Created by Ali Siddiqui on 8/11/16.
//  Copyright © 2016 Ali Siddiqui. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    var url = ""
    
    fileprivate let imageView: UIImageView = UIImageView()
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
            
            scrollView.minimumZoomScale = 0.5
            scrollView.maximumZoomScale = 2
        }
    }
    
    var image: UIImage? {
        get {
            return imageView.image
        }
        
        set {
            loadingIndicator.stopAnimating()
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView.contentSize = imageView.frame.size
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.addSubview(imageView)
        
        loadingIndicator.startAnimating()
        
        if let imageURL = URL(string: url) {
            DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated).async { [weak weakSelf = self] in
                if let imageData = try? Data(contentsOf: imageURL) {
                    DispatchQueue.main.async {
                        weakSelf!.image = UIImage(data: imageData)
                    }
                }
            }
        }
    }
}
