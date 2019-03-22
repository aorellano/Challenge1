//
//  DetailViewController.swift
//  Challenge1
//
//  Created by Alexis Orellano on 3/21/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var selectedFlag: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareFlag))
        
        if let imageToLoad = selectedFlag {
            imageView.image = UIImage(named: imageToLoad)
            imageView.layer.borderWidth = 1
            imageView.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    @objc func shareFlag(){
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        let item = [image]
        let ac = UIActivityViewController(activityItems: item, applicationActivities: [])
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
}
