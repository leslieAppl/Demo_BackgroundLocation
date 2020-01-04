//
//  ViewController.swift
//  Demo_BackgroundLocation1210
//
//  Created by leslie on 12/10/19.
//  Copyright © 2019 leslie. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: LocationManager?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = LocationManager()
        Log.printFileURL()
//        print("here are my Logs: \(Log.getAllLogs())")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(logDataDidChange(_:)), name: LOG_DATA_DID_CHANGE, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @objc func logDataDidChange(_ notif: Notification) {
        tableView.reloadData()
        
        // scroll table view to bottom
        if Log.getAllLogs()?.count ?? 0 > 0 {
            let endIndex = IndexPath(row: Log.getAllLogs()!.count - 1, section: 0)
            self.tableView.scrollToRow(at: endIndex, at: .bottom, animated: false)
        }
    }
    
    func startLocationLog() {
        locationManager?.startUpdatingLocation()
    }
    
    func pauseLocationLog() {
        locationManager?.pauseUpdatingLocation()
    }
    
    func stopLocationLog() {
        locationManager?.stopUpdatingLocation()
    }
    
    @IBAction func startLogBtnPressed(_ sender: Any) {
        startLocationLog()
    }
    
    @IBAction func pauseLogBtnPressed(_ sender: Any) {
        pauseLocationLog()
    }
    
    @IBAction func stopLogBtnPressed(_ sender: Any) {
        stopLocationLog()
    }
    
    @IBAction func deleteLogBtnPressed(_ sender: Any) {
        Log.removeAllData()
        self.tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table View Delegate
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let important = importantAction(at: indexPath)
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete, important])
    }
    
    func importantAction(at indexPath: IndexPath) -> UIContextualAction {
        let log = Log.getAllLogs()?[indexPath.row]
        
        // Creates a new contextual action with the specified title and handler.
        // handler: The handler to execute when the user selects the action.
        let action = UIContextualAction(style: .normal, title: "Important") { (action, view, completion) in
            Log.upDateIsImportant(at: indexPath)
            completion(true)
        }
        if #available(iOS 13.0, *) {
            action.image = UIImage(systemName: "pin")
        } else {
            // Fallback on earlier versions
        }
        action.backgroundColor = log!.isImportant ? #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1) : #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)

        return action
    }
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "Delete") { (action, view, completion) in
            Log.removeData(at: indexPath)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }

        if #available(iOS 13.0, *) {
            action.image = UIImage(systemName: "trash")
        } else {
            // Fallback on earlier versions
        }

        action.backgroundColor = .red

        return action
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let complete = completionAction(at: indexPath)
        
        return UISwipeActionsConfiguration(actions: [complete])
    }

    func completionAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Complete") { (action, view, completion) in
            Log.removeData(at: indexPath)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        
        action.image = UIImage(systemName: "checkmark")
        action.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        return action
    }
    
    // select and deselect the high light row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! LogCellView
        
        // correct code description
        if cell.backgroundColor != UIColor.red {
            cell.backgroundColor = UIColor.red
        } else {
            cell.backgroundColor = UIColor(named: "Default")
        }
        
        // wrong code description
        //        if cell.backgroundColor == UIColor(named: "Default") {
        //            cell.backgroundColor = UIColor.red
        //        } else {
        //            cell.backgroundColor = UIColor(named: "Default")
        //        }
    }
    
    // MARK: - Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Log.getAllLogs()?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "LogCellView") as? LogCellView {
            guard let log = Log.getAllLogs()?[indexPath.row] else {
                return LogCellView()
            }
            cell.configureLogCell(log: log)
            return cell
        } else {
            return LogCellView()
        }
    }
    

}
