//
//  SettingsViewController.swift
//  Evolve
//
//  Created by Liam Vinson on 02/04/2019.
//  Copyright © 2019 Liam Vinson. All rights reserved.
//

import UIKit

struct Settings { // Contains default values
    let shapeType: ShapeType = .polygon
    let shapeCount: Int = 30
    let shapeLimit: Int = 100
    let pointLimit: Int = 5
    let imageSize: Int = 200
    
    let colorDeviation: Double = 0.1
    let pointDeviation: Int = 30
    
    let pointChangeProbability = 0.01
    let addPointProbability = 0.01
    let removePointProbability = 0.01
    let colorChangeProbability = 0.01
    let removePolygonProbability = 0.01
    let addPolygonProbability = 0.01
}

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func savePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
