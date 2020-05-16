//
//  ViewController.swift
//  CovidIndia Tracker
//
//  Created by Abhishek Tiwari on 04/05/20.
//  Copyright © 2020 Abhishek Tiwari. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UpdateCovidData{

    @IBOutlet weak var TotalCasesLabel: UILabel!
    @IBOutlet weak var ActiveCasesLabel: UILabel!
    @IBOutlet weak var CuredLabel: UILabel!
    @IBOutlet weak var StateWiseButton: UIButton!
    var covidManager = CovidManager()
    var statedata1: [StateData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StateWiseButton.layer.cornerRadius = 5
        covidManager.delegate = self
        covidManager.fetchData()
        
        
        // Do any additional setup after loading the view.
    }
    
    func didUpdateData(_ covidManager: CovidManager, data1: CovidModel) {
        DispatchQueue.main.async{
            self.TotalCasesLabel.text = data1.totalString
            self.ActiveCasesLabel.text = data1.activeString
            self.CuredLabel.text = data1.curedString
            self.statedata1 = data1.statedata
            
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    @IBAction func StateButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "GoToStates", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToStates"
        {
            let destinationVC = segue.destination as! StatesViewController
            destinationVC.states = statedata1
            
        }
    }

}

