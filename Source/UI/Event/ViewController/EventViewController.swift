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
    
    
    var eventList: [Event] = []
    
    enum IndicatorSelector {
        case progress
        case completed
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setEventData()
        
        let nibName = UINib(nibName: "EventTableViewCell", bundle: nil)
        self.tableView.register(nibName, forCellReuseIdentifier: "testXib")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.selectIndicator(.progress)
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
        
        cell.eventTitle.text = event.eventTitle
        cell.dday.text = "\(event.dday)"
        
        return cell
    }
}

//let dday = 2-
// "D-\(dday)"

// TODO: - 일하세요!!

extension EventViewController {
    func setEventData() {
        let event1 = Event(title: "어린이날 기념으로 킷캣이 쏜다", dday: 20)
        let event2 = Event(title: "타이틀2", dday: 15)
        let event3 = Event(title: "타이틀3", dday: 10)
        
        eventList = [event1, event2, event3]
        
        
    }
}
