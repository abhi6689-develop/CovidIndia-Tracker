//
//  StatesViewController.swift
//  CovidIndia Tracker
//
//  Created by Abhishek Tiwari on 04/05/20.
//  Copyright © 2020 Abhishek Tiwari. All rights reserved.
//

import UIKit

class StatesViewController: UIViewController {

    @IBOutlet weak var GoBackButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        GoBackButton.layer.cornerRadius = 5

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
