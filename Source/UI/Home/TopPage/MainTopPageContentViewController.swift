//
//  MainTopPageContentViewController.swift
//  KizCafePass
//
//  Created by seungwook-jung on 05/05/2019.
//  Copyright © 2019 정승욱. All rights reserved.
//

import UIKit

class MainTopPageContentViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView?
    private var pageColor: UIColor = UIColor.red
    
    convenience init(color: UIColor) {
        self.init()
        self.pageColor = color
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView?.backgroundColor = pageColor
    }
    
    func setImageBackground(_ color: UIColor) {
        self.pageColor = color
        self.imageView?.backgroundColor = self.pageColor
    }
    
}
