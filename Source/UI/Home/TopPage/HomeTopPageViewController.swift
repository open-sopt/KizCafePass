//
//  HomeTopPageViewController.swift
//  KizCafePass
//
//  Created by seungwook-jung on 05/05/2019.
//  Copyright © 2019 정승욱. All rights reserved.
//

import UIKit

class HomeTopPageViewController: UIPageViewController {
    
    private var pages = [MainTopPageContentViewController]()
    private var currentIndex = 0
    
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll,
                   navigationOrientation: .horizontal,
                   options: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initPages()
        self.dataSource = self
        // self.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.setPages()
    }
    
    private func initPages() {
        let page1 = MainTopPageContentViewController(color: UIColor.blue)
        let page2 = MainTopPageContentViewController(color: UIColor.black)
        let page3 = MainTopPageContentViewController(color: UIColor.brown)
        
        self.pages.append(page1)
        self.pages.append(page2)
        self.pages.append(page3)
        
        self.setViewControllers([page1],
                                direction: .forward,
                                animated: false,
                                completion: nil)
    }
    
    private func setPages() {
        self.pages[0].setImageBackground(UIColor.blue)
        self.pages[1].setImageBackground(UIColor.black)
        self.pages[2].setImageBackground(UIColor.brown)
    }
    
}

// MARK: - page view delegate
extension HomeTopPageViewController: UIPageViewControllerDelegate {
    
}

// MARK: - page view datasource
extension HomeTopPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        self.currentIndex -= 1
        if self.currentIndex < 0 {
            self.currentIndex = self.pages.count - 1
        }
        return self.pages[self.currentIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        self.currentIndex += 1
        if self.currentIndex > pages.count - 1 {
            self.currentIndex = 0
        }
        return self.pages[self.currentIndex]
    }
}
