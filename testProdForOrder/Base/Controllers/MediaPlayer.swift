//
//  MediaPlayer.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 10.02.2023.
//

import UIKit
import AVKit

final class MediaPlayer: UIView {
    
    var album: Album
    
    //MARK: - Properties
    private lazy var albumCover: UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.layer.cornerRadius = 100
        v.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        return v
    }()
    
    private lazy var progressBar: UISlider = {
        let v = UISlider()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.addTarget(self, action: #selector(progressScrubbed(_:)), for: .valueChanged)
        v.minimumTrackTintColor = UIColor(named: "subtitleColor")
        v.maximumTrackTintColor = .darkGray
        v.minimumTrackTintColor = .white
        return v
        
    }()
    
    private lazy var elapsedTimeLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.textColor = .white
        v.font = .systemFont(ofSize: 14, weight: .light)
        v.text = "00:00"
        return v
    }()
    
    private lazy var remainingTimeLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.textColor = .white
        v.font = .systemFont(ofSize: 14, weight: .light)
        v.text = "00:00"
        return v
    }()
    
    private lazy var songNameLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.textColor = .white
        v.font = .systemFont(ofSize: 16, weight: .bold)
        return v
    }()
    
    private lazy var previousButton: UIButton = {
        let v = UIButton()
        v.translatesAutoresizingMaskIntoConstraints = false
        let congig = UIImage.SymbolConfiguration(pointSize: 40)
        v.setImage(UIImage(systemName: "backward.end", withConfiguration: congig), for: .normal)
        v.addTarget(self, action: #selector(didTapPrevious(_:)), for: .touchUpInside)
        v.tintColor = .white
        return v
    }()
    
    private lazy var playPauseButton: UIButton = {
        let v = UIButton()
        v.translatesAutoresizingMaskIntoConstraints = false
        let congig = UIImage.SymbolConfiguration(pointSize: 80)
        v.setImage(UIImage(systemName: "play.circle.fill", withConfiguration: congig), for: .normal)
        v.addTarget(self, action: #selector(didTapPlayPause(_:)), for: .touchUpInside)
        v.tintColor = .white
        return v
    }()
    
    private lazy var nextButton: UIButton = {
        let v = UIButton()
        v.translatesAutoresizingMaskIntoConstraints = false
        let congig = UIImage.SymbolConfiguration(pointSize: 40)
        v.setImage(UIImage(systemName: "forward.end", withConfiguration: congig), for: .normal)
        v.addTarget(self, action: #selector(didTapNext(_:)), for: .touchUpInside)
        v.tintColor = .white
        return v
    }()
    
    private lazy var controlStack: UIStackView = {
        let v = UIStackView(arrangedSubviews: [previousButton, playPauseButton, nextButton])
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .horizontal
        v.distribution = .equalSpacing
        v.spacing = 20
        return v
    }()
    
    private var player = AVAudioPlayer()
    private var timer: Timer?
    private var playingIndex = 0
    
    init(album: Album) {
        self.album = album
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private func
    private func setupView() {
        albumCover.image = UIImage(named: album.image)
        setupPlayer(song: album.songs[playingIndex])
        setupConstraints()
    }
    
    private func setupConstraints() {
        addSubview(albumCover)
        albumCover.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.top.equalToSuperview().offset(68)
            $0.height.equalTo(UIScreen.main.bounds.height * 0.5)
        }
        
        addSubview(songNameLabel)
        songNameLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.top.equalTo(albumCover.snp.bottom).offset(16)
        }
        
        addSubview(progressBar)
        progressBar.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.top.equalTo(songNameLabel.snp.bottom).offset(16)
        }
        
        addSubview(elapsedTimeLabel)
        elapsedTimeLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.top.equalTo(progressBar.snp.bottom).offset(8)
        }
        
        addSubview(remainingTimeLabel)
        remainingTimeLabel.snp.makeConstraints {
            $0.right.equalToSuperview().inset(16)
            $0.top.equalTo(progressBar.snp.bottom).offset(8)
        }
        
        addSubview(controlStack)
        controlStack.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(32)
            //$0.top.equalTo(remainingTimeLabel.snp.bottom).offset(8)
            $0.bottom.equalToSuperview().inset(40)
        }
    }
    
    private func setupPlayer(song: Song) {
        guard let url = Bundle.main.url(forResource: song.fileName, withExtension: "mp3") else {
            return
        }
        
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true )
        }
        
        songNameLabel.text = song.name
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.delegate = self
            player.prepareToPlay()
            
            try AVAudioSession.sharedInstance().setCategory(.playback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func play() {
        progressBar.value = 0.0
        progressBar.maximumValue = Float(player.duration)
        player.play()
        setPlayPauseIcon(isPlaying: player.isPlaying)
    }
    
    private func setPlayPauseIcon(isPlaying: Bool) {
        let config = UIImage.SymbolConfiguration(pointSize: 80)
        playPauseButton.setImage(UIImage(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill", withConfiguration: config), for: .normal)
    }
    
    func stop() {
        player.stop()
        timer?.invalidate()
        timer = nil
    }
    
    private func getFormattedTime(timeInterval: TimeInterval) -> String {
        let mins = timeInterval / 60
        let secs = timeInterval.truncatingRemainder(dividingBy: 60)
        let timeFormater = NumberFormatter()
        timeFormater.minimumIntegerDigits = 2
        timeFormater.minimumFractionDigits = 0
        timeFormater.roundingMode = .down
        
        guard let minsString = timeFormater.string(from: NSNumber(value: mins)) , let secStr = timeFormater.string(from: NSNumber(value: secs)) else {
            return "00:00"
        }
        return "\(minsString):\(secStr)"
    }
    
    //MARK: - Actions
    @objc private func updateProgress() {
        progressBar.value = Float(player.currentTime)
        
        elapsedTimeLabel.text = getFormattedTime(timeInterval: player.currentTime)
        let remainingTime = player.duration - player.currentTime
        remainingTimeLabel.text = getFormattedTime(timeInterval: remainingTime)
    }
    
    @objc private func progressScrubbed(_ sender: UISlider) {
        player.currentTime = Float64(sender.value)
    }
    
    @objc private func didTapPrevious(_ sender: UIButton) {
        playingIndex -= 1
        if playingIndex < 0 {
            playingIndex = album.songs.count - 1
        }
        setupPlayer(song: album.songs[playingIndex])
        play()
        setPlayPauseIcon(isPlaying: player.isPlaying)
    }
    
    @objc private func didTapPlayPause(_ sender: UIButton) {
        if player.isPlaying {
            player.pause()
        } else {
            player.play()
        }
        
        setPlayPauseIcon(isPlaying: player.isPlaying)
    }
    
    @objc private func didTapNext(_ sender: UIButton) {
        playingIndex += 1
        if playingIndex >= album.songs.count {
            playingIndex = 0
        }
        setupPlayer(song: album.songs[playingIndex])
        play()
        setPlayPauseIcon(isPlaying: player.isPlaying)
    }
    
}

extension MediaPlayer: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        didTapNext(nextButton)
    }
}
