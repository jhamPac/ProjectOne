//
//  DetailViewController.swift
//  StormViewer
//
//  Created by jhampac on 1/18/16.
//  Copyright © 2016 jhampac. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    
    @IBOutlet weak var detailImageView: UIImageView!

    var detailItem: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.title = detailItem ?? "Blah"
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    func configureView()
    {
        if let imageName = detailItem
        {
            self.detailImageView.image = UIImage(named: imageName)
        }
    }
}

