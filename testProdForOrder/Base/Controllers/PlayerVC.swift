//
//  PlayerVC.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 01.02.2023.
//

import UIKit
import AVKit

final class PlayerVC: UIViewController {

    //MARK: - Properties
    var album: Album
    
    private lazy var mediaPlayer: MediaPlayer = {
        let v = MediaPlayer(album: album)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private let backgroundImage = UIImageView()
    
    //MARK: - Initialization
    init(album: Album) {
        self.album = album
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = false
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mediaPlayer.play()
        UIApplication.shared.isIdleTimerDisabled = true
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        mediaPlayer.stop()
        UIApplication.shared.isIdleTimerDisabled = false
    }

    //MARK: - Private functions
    private func setupViews() {
        
        backgroundImage.image = Resouces.Backgrounds.firstBack
        
        view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints {
            $0.top.bottom.left.right.equalToSuperview()
        }
        
        view.addSubview(mediaPlayer)
        mediaPlayer.snp.makeConstraints {
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide).inset(-20)
            $0.left.right.equalToSuperview()
        }
    }
}
