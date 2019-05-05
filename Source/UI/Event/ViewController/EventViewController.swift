//
//  EventViewController.swift
//  KizCafePass
//
//  Created by yejin on 05/05/2019.
//  Copyright © 2019 정승욱. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    @IBOutlet private weak var leftIndicator: UIView!
    @IBOutlet private weak var rightIndicator: UIView!
    @IBOutlet weak var progressButton: UIButton!
    @IBOutlet weak var completedButton: UIButton!
    
    
    var eventList: [EventModel] = []
    
    enum IndicatorSelector {
        case progress
        case completed
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "EventTableViewCell", bundle: nil)
        self.tableView.register(nibName, forCellReuseIdentifier: "testXib")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.selectIndicator(.progress)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.requestProgress()
    }
    
    @IBAction private func progressButtonTapped(_ sender: UIButton) {
        self.selectIndicator(.progress)
        
    }
    
    @IBAction private func completedButtonTapped(_ sender: UIButton) {
        self.selectIndicator(.completed)
        
    }
    
    private func selectIndicator(_ indicatorSelector: IndicatorSelector) {
        switch indicatorSelector {
        case .progress:
            self.progressButton.setTitleColor(UIColor.red, for: .normal)
            self.completedButton.setTitleColor(UIColor.black, for: .normal)
            self.leftIndicator.isHidden = false
            self.rightIndicator.isHidden = true
        case .completed:
            self.progressButton.setTitleColor(UIColor.black, for: .normal)
            self.completedButton.setTitleColor(UIColor.red, for: .normal)
            self.leftIndicator.isHidden = true
            self.rightIndicator.isHidden = false
        }
    }
    
    
    private func requestProgress() {
        let success: (EventModels) -> Void = { eventModels in
            self.eventList = eventModels
            self.tableView.reloadData()
        }
        
        let failure: (Error?) -> Void = { error in
            
        }
        
        
        EventService.requestEvent(success: success,
                                  failure: failure)
    }
}


// MARK: - table view delegate
extension EventViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
    }
}


// MARK: - table view datasource
extension EventViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return eventList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "testXib", for: indexPath) as! EventTableViewCell
//        guard let contentCell = cell as? EventTableViewCell else {
//            return cell
//        } 
        
        let event = eventList[indexPath.row]
        
        cell.setEventData(event)
        return cell
    }
}
