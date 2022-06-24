//
//  ViedioViewController.swift
//  Weather
//
//  Created by liyuehang on 2022/5/17.
//

import Foundation
import AVFoundation

extension ViewController: UIViewController {
    
    
    
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
    func setupView() {lazy var button:UIButton = {
        let button = UIButton(frame: CGRect(x: ScreenWidth / 2 - 100, y: ScreenHeight / 2 - 100, width: 200, height: 200))
        button.setImage(UIImage(named: "music play"), for: .normal)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    
        self.view.addSubview(button)
        
    }
}
