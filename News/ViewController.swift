//
//  ViewController.swift
//  News
//
//  Created by Nikolay Zhukov on 02.08.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        view.backgroundColor = .systemBackground
        
        APICaller.shared.getTopStories { result in
            
        }
    }


}

