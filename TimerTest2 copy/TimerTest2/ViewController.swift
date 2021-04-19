//
//  ViewController.swift
//  TimerTest2
//
//  Created by Colton Swapp on 4/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var timerLabel: UIButton!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var printTimeButton: UIButton!
    @IBOutlet weak var printMinuteButton: UIButton!
    @IBOutlet weak var button1: QuickTallyButton!
    var counterLabel: UILabel = UILabel()
    
    // MARK: - Properties
    var timer: Timer = Timer()
    var count: Int = 0
    var timerCounting: Bool = false
    var missedTackleCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTimer()
        printTimeButton.setTitle("TIME", for: .normal)
        printMinuteButton.setTitle("MINUTE", for: .normal)
        startStopButton.setTitleColor(UIColor.green, for: .normal)
        configMyLabel()
    }
    
    @IBAction func resetButtonTapped(_ sender: UITapGestureRecognizer) {
        let alert = UIAlertController(title: "Reset Timer", message: "Are you sure you would like to reset the timer?", preferredStyle: .alert)
        
        let resetAction = UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            self.count = 0
            self.timer.invalidate()
            self.timerLabel.setTitle(self.makeTimeString(minutes: 0, seconds: 0), for: .normal)
            self.startStopButton.setTitle("START", for: .normal)
            self.timerLabel.setTitleColor(.black, for: .normal)
            self.startStopButton.setTitleColor(UIColor.green, for: .normal)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(resetAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
        
    }
    @IBAction func longPressed(_ sender: UILongPressGestureRecognizer) {
        print("longPressed")
    }
    
    @IBAction func startStopButtonTapped(_ sender: Any) {
        startStopTimer()
    }
    
    @IBAction func printTimeButtonTapped(_ sender: Any) {
        let time = secondsToHoursToMinutesSeconds(seconds: count)
        let timeString = makeTimeString(minutes: time.0, seconds: time.1)
        print(timeString)
    }
    
    @IBAction func printMinuteButtonTapped(_ sender: Any) {
        let time = secondsToHoursToMinutesSeconds(seconds: count)
        print(time.0)
    }
    
    
    @objc func timerCounter() -> Void {
        count = count + 1
        let time = secondsToHoursToMinutesSeconds(seconds: count)
        let timeString = makeTimeString(minutes: time.0, seconds: time.1)
        if count > 60 {
            timerLabel.setTitleColor(.systemRed, for: .normal)
        } else {
            timerLabel.setTitleColor(.black, for: .normal)
        }
        
        UIView.performWithoutAnimation {
            timerLabel.setTitle(timeString, for: .normal)
            timerLabel.layoutIfNeeded()
        }
    }
    
    @objc func increment() {
        missedTackleCount += 1
        print("\(missedTackleCount)")
        counterLabel.text = String(missedTackleCount)
    }
    
    func secondsToHoursToMinutesSeconds(seconds: Int) -> (Int, Int) {
        return ((seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    func makeTimeString(minutes: Int, seconds: Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }
    
    func setupTimer() {
        timerLabel.addTarget(self, action: #selector(startTimerOnTap), for: .touchUpInside)
    }
    
    
    @objc func startTimerOnTap() {
        startStopTimer()
    }
    
    func startStopTimer() {
        if (timerCounting) {
            timerCounting = false
            timer.invalidate()
            startStopButton.setTitle("START", for: .normal)
            startStopButton.setTitleColor(UIColor.green, for: .normal)
        } else {
            timerCounting = true
            startStopButton.setTitle("STOP", for: .normal)
            startStopButton.setTitleColor(UIColor.red, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    
    func configMyLabel() {
        
        view.addSubview(button1)
        view.addSubview(counterLabel)
        
        button1.addTarget(self, action: #selector(increment), for: .touchUpInside)

        button1.setTitle("Missed tackle", for: .normal)
        counterLabel.text = String(missedTackleCount)
        counterLabel.textColor = .black
        counterLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        counterLabel.textAlignment = .center
        
        counterLabel.layer.borderWidth = 2
        counterLabel.layer.borderColor = UIColor.black.cgColor
        counterLabel.layer.cornerRadius = 10
        counterLabel.clipsToBounds = true

        
        counterLabel.translatesAutoresizingMaskIntoConstraints = false


        counterLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true

        counterLabel.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        counterLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true

        counterLabel.leadingAnchor.constraint(equalTo: button1.trailingAnchor, constant: 16).isActive = true

        counterLabel.bottomAnchor.constraint(equalTo: button1.bottomAnchor).isActive = true

    }
}




