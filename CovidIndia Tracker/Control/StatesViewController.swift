//
//  StatesViewController.swift
//  CovidIndia Tracker
//
//  Created by Abhishek Tiwari on 04/05/20.
//  Copyright © 2020 Abhishek Tiwari. All rights reserved.
//

import UIKit

class StatesViewController: UIViewController {
    var states: [StateData] = []

    @IBOutlet weak var StateTable: UITableView!
    @IBOutlet weak var GoBackButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        GoBackButton.layer.cornerRadius = 20
        StateTable.dataSource = self
        print(states[0].stateName)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func GoBackButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension StatesViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(states.count)
        return states.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StateCell", for: indexPath)
        cell.textLabel?.text = states[indexPath.row].stateName
        cell.detailTextLabel?.text = String(states[indexPath.row].affected)
        return cell
    
    }
    
    
}
