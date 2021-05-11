//
//  ViewController.swift
//  Multimedia-HomeWork-IOS-8 Kharin_ALEXEY
//
//  Created by Alexey Kharin on 09.05.2021.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var slider: UISlider! {
        didSet {
            slider.minimumValue = 0.0
            slider.addTarget(self, action: #selector(changeSlider(sender:)), for: .valueChanged)
        }
    }
    @objc func changeSlider(sender: UISlider) {
        if sender == slider {
            player.currentTime = TimeInterval(sender.value)
            player.play()
        }
    }
    @IBOutlet weak var song: UILabel!
    
    @IBAction func play(_ sender: Any) {
        player.play()
    }
    @IBAction func back(_ sender: Any) {
        if countIndex > 0 {
            countIndex -= 1
            player = try! AVAudioPlayer(contentsOf: arraySongs[countIndex]!)
            song.text = arrayNamesomgs[countIndex]
            slider.value = 0.0
            slider.maximumValue = Float(player.duration)
            player.play()
        } else {
            countIndex = (arraySongs.count - 1)
            player = try! AVAudioPlayer(contentsOf: arraySongs[countIndex]!)
            song.text = arrayNamesomgs[countIndex]
            slider.value = 0.0
            slider.maximumValue = Float(player.duration)
            player.play()
        }
    }
    
    var countIndex = 0
    
    @IBAction func next(_ sender: Any) {
        if countIndex < (arraySongs.count - 1) {
            countIndex += 1
                player = try! AVAudioPlayer(contentsOf: arraySongs[countIndex]!)
                player.play()
            song.text = arrayNamesomgs[countIndex]
            slider.value = 0.0
            slider.maximumValue = Float(player.duration)
            
        } else {
            countIndex = 0
            player = try! AVAudioPlayer(contentsOf: arraySongs[countIndex]!)
            song.text = arrayNamesomgs[countIndex]
            slider.value = 0.0
            slider.maximumValue = Float(player.duration)
            player.play()
        }
    }
    @IBAction func pause(_ sender: Any) {
        player.pause()
    }
    @IBAction func stop(_ sender: Any) {
        player.currentTime = 0.0
        slider.value = 0.0
        player.stop()
    }
    
    
    @IBOutlet weak var viewForButton: UIView!
    
    func diz() {
        viewForButton.layer.cornerRadius = 15
        viewForButton.clipsToBounds = true
        song.layer.cornerRadius = song.frame.size.height / 2
        song.clipsToBounds = true
    }
    @IBOutlet weak var listAudio: UITableView!
    
    var arraySongs: [URL?] = []
    var arrayNamesomgs: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let song1 = Bundle.main.url(forResource: "Queen", withExtension: "mp3")!
        let song2 = Bundle.main.url(forResource: "Макс Корж - 2 типа людей", withExtension: "mp3")!
        let song3 = Bundle.main.url(forResource: "Нурминский - Валим", withExtension: "mp3")!
        let song4 = Bundle.main.url(forResource: "Basstrologe - Somebody To Love", withExtension: "mp3")!
        let song5 = Bundle.main.url(forResource: "Miyagi & Andy Panda - ÐÐ°ÑÑÐ¾Ð½", withExtension: "mp3")!
        
        [song1, song2, song3, song4, song5].forEach { arraySongs.append($0)}
        
        arrayNamesomgs = ["Queen", "Макс Корж - 2 типа людей", "Нурминский - Валим", "Basstrologe - Somebody To Love", "Miyagi & Andy Panda - ÐÐ°ÑÑÐ¾Ð½"]
        
        player = try! AVAudioPlayer(contentsOf: song1)
        player.prepareToPlay()
        player.play()
        song.text = "Queen"
        slider.maximumValue = Float(player.duration)
        song.textColor = .white
        song.textAlignment = .center
        listAudio.delegate = self
        listAudio .dataSource = self
        listAudio.register(CellWeb.self, forCellReuseIdentifier: String(describing: CellWeb.self))
        diz()
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Storage.collection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CellWeb = tableView.dequeueReusableCell(
            withIdentifier: String(describing: CellWeb.self),
            for: indexPath) as! CellWeb
        
        cell.names = Storage.collection[indexPath.row].name
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = Storage.collection[indexPath.row].urlString
        guard let urlSafety = url else { return print("Net dannuh") }
        let vc = ShowViewController.storyboardInstance(url: urlSafety)
        player.stop()
        present(vc!, animated: true, completion: nil)
    }
    
}
