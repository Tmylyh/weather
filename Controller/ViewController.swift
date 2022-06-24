//
//  ViewController.swift
//  Weather
//
//  Created by liyuehang on 2022/5/9.
//

import UIKit
import CoreLocation
import AVFoundation

let frame = UIScreen.main.bounds
let ScreenWidth = frame.width
let ScreenHeight = frame.height

class ViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!

    lazy var button:UIButton = {
        let button = UIButton(frame: CGRect(x: ScreenWidth - 200, y: ScreenHeight - 200, width: 200, height: 200))
//        button.backgroundColor = UIColor.white
        button.setImage(UIImage(named: "music play"), for: .normal)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    var audioPlayer: AVAudioPlayer?
    
    let locationManager = CLLocationManager()
    let weather = Weather()
    
    @objc func tapButton() {
            let path = Bundle.main.path(forResource: "Legends Never Die", ofType: ".mp3")
            do {
                try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
                audioPlayer?.play()
                audioPlayer?.volume = 1.0
            }
            catch let audioError as NSError {
                print(audioError)
            }
        self.button.isEnabled = false
    }
    func setupView() {
        self.view.addSubview(button)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.requestWhenInUseAuthorization()//请求授权当前位置
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.requestLocation()
        setupView()
    }
    
   
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "获取位置失败"
    }

    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
//        if segue.identifier == "QueryViewControllerSegue"{
//            let vc = segue.destination as! QueryViewController
//            vc.currentCity = weather.city
        
//        }
    
        segue.destination.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        if let vc = segue.destination as? QueryViewController{
            vc.currentCity = weather.city
            vc.delegate = self
        }
    }
    
    
    
}

