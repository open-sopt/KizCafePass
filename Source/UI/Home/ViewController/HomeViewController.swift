//
//  HomeViewController.swift
//  KizCafePass
//
//  Created by seungwook-jung on 05/05/2019.
//  Copyright © 2019 정승욱. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var scrollView: UIScrollView?
    @IBOutlet private weak var recommendCollectionView: UICollectionView?
    @IBOutlet private weak var popularCollectionView: UICollectionView?
    
    private let homeCollectionViewCellID = "HomeCollectionViewCell"
    
    private var homeInfoNewModels = [HomeInfoModel]()
    private var homeInfoHotModels = [HomeInfoModel]()
    private var homeInfoRecomandModels = [HomeInfoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initRecommendCollcetionView()
        self.initPopularCollcetionView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.requestHomeNew()
        self.requestHomeHot()
        self.requestHomeRecomand()
    }
    
    
    private func requestHomeNew() {
        
        let success: (HomeInfoModels) -> Void = { homeInfoModels in
            self.homeInfoNewModels = homeInfoModels
            // do nothing
        }
        
        HomeInfoService.requestHomeInfo(url: CommonDefine.API.homeNew,
                                        success: success,
                                        failure: nil)
    }
    
    private func requestHomeHot() {
        let success: (HomeInfoModels) -> Void = { homeInfoModels in
            self.homeInfoHotModels = homeInfoModels
            self.popularCollectionView?.reloadData()
        }
        
        HomeInfoService.requestHomeInfo(url: CommonDefine.API.homeHot,
                                        success: success,
                                        failure: nil)
    }
    
    private func requestHomeRecomand() {
        let success: (HomeInfoModels) -> Void = { homeInfoModels in
            self.homeInfoRecomandModels = homeInfoModels
            self.recommendCollectionView?.reloadData()
        }
        
        HomeInfoService.requestHomeInfo(url: CommonDefine.API.homeRecomand,
                                        success: success,
                                        failure: nil)
    }
    
    private func initRecommendCollcetionView() {
        self.recommendCollectionView?.register(UINib(nibName: "HomeCollectionViewCell",
                                                     bundle: nil),
                                               forCellWithReuseIdentifier: self.homeCollectionViewCellID)
        self.recommendCollectionView?.dataSource = self
        self.recommendCollectionView?.delegate = self
    }
    
    private func initPopularCollcetionView() {
        self.popularCollectionView?.register(UINib(nibName: "HomeCollectionViewCell",
                                                   bundle: nil),
                                             forCellWithReuseIdentifier: self.homeCollectionViewCellID)
        self.popularCollectionView?.dataSource = self
        self.popularCollectionView?.delegate = self
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 225, height: 238)
    }
}


extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // recommend
        if collectionView.restorationIdentifier == "RecommendCollectionView" {
            return self.homeInfoRecomandModels.count
        }
        
        // popular
        if collectionView.restorationIdentifier == "PopularCollectionView" {
            return self.homeInfoHotModels.count
        }
        
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let recommendCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.homeCollectionViewCellID,
                                                               for: indexPath)
        
        guard let contentCell = recommendCell as? HomeCollectionViewCell else {
            return recommendCell
        }
        
        // recommend
        if collectionView.restorationIdentifier == "RecommendCollectionView" {
            contentCell.setData(self.homeInfoRecomandModels[indexPath.row])
        }
        
        // popular
        if collectionView.restorationIdentifier == "PopularCollectionView" {
            contentCell.setData(self.homeInfoHotModels[indexPath.row])
        }
        
        
        
        return contentCell
        
    }
    
}
