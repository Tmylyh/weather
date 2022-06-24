//
//  QueryViewController.swift
//  Weather
//
//  Created by liyuehang on 2022/5/16.
//

import UIKit

protocol QueryViewControllerDelegate {
    func didChangeCity(city: String)
}

class QueryViewController: UIViewController {
    
    var currentCity = ""
    var delegate: QueryViewControllerDelegate?
    
    @IBOutlet weak var currentCityLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        cityTextField.becomeFirstResponder()//聚焦//cityTextField.resignFirstResponder//解除聚焦
        currentCityLabel.text = currentCity
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func query(_ sender: Any) {
        dismiss(animated: true)
        if !cityTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
            delegate?.didChangeCity(city: cityTextField.text!)
        }
    }
    

}
