//
//  BackgroundRefreshViewController.swift
//  SwiftLearning
//
//  Created by Gagandeep on 25/07/24.
//  Copyright © 2024 Gagan. All rights reserved.
//

import UIKit

class BackgroundRefreshViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var vStack: UIStackView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnMove: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    private var tableData = ["One", "Two"]
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vStack.backgroundColor = .red.withAlphaComponent(0.5)
        lblTitle?.textColor = .black
        lblTitle?.text = "Some Title"
        btnMove?.titleLabel?.text = "Move next"

        tableView.reloadData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timer?.invalidate()
        timer = nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Reloading indexPath fo cells \(indexPath)")
        let cell = UITableViewCell(style: .default, reuseIdentifier: "BackgroundRefreshCellReuseIdentifier")
        cell.largeContentTitle = tableData[indexPath.row]
        cell.textLabel?.text = tableData[indexPath.row]
        return cell
    }
    
    @IBAction private func onBtnMove(sender: Any) {
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { [weak self] _ in
            print("Timer called")
            print("Label \(self?.lblTitle.text)")
            self?.lblTitle?.text = "Background refreshed."
            self?.tableData.append("Three")
            self?.tableView?.reloadData()
        })
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
