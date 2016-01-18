//
//  DetailViewController.swift
//  StormViewer
//
//  Created by jhampac on 1/18/16.
//  Copyright © 2016 jhampac. All rights reserved.
//

import Social
import UIKit

class DetailViewController: UIViewController
{
    @IBOutlet weak var detailImageView: UIImageView!

    var detailItem: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "shareTapped")
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
    
    func shareTapped()
    {
        let vc = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        vc.setInitialText("Look at this great picture!")
        vc.addImage(detailImageView.image!)
        vc.addURL(NSURL(string: "http://www.photolib.noaa.gov/nssl"))
        presentViewController(vc, animated: true, completion: nil)
    }
}

