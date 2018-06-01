import UIKit
import AVKit

class ViewController: UIViewController {

    @IBOutlet private weak var firstContainerView: UIView!
    @IBOutlet private weak var secondContainerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpFirstPlayer()
        setUpSecondPlayer()

        play(playerViewController: firstPlayerViewController,
             stream: URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!)

        play(playerViewController: secondPlayerViewController,
             stream: URL(string: "https://demo-hls5-live.zahs.tv/sd/master.m3u8")!)
    }

    // Private

    private var firstPlayerViewController: AVPlayerViewController!
    private var secondPlayerViewController: AVPlayerViewController!

    private func setUpFirstPlayer() {
        firstPlayerViewController = AVPlayerViewController()
        addChildViewController(firstPlayerViewController)
        firstPlayerViewController.view.frame = firstContainerView.bounds
        firstContainerView.addSubview(firstPlayerViewController.view)
        firstContainerView.backgroundColor = .red
    }

    private func setUpSecondPlayer() {
        secondPlayerViewController = AVPlayerViewController()
        addChildViewController(secondPlayerViewController)
        secondPlayerViewController.view.frame = secondContainerView.bounds
        secondContainerView.addSubview(secondPlayerViewController.view)
        secondContainerView.backgroundColor = .blue
    }

    private func play(playerViewController: AVPlayerViewController, stream: URL) {
        let asset = AVAsset(url: stream)
        let playetItem = AVPlayerItem(asset: asset)
        playerViewController.player = AVPlayer(playerItem: playetItem)
        playerViewController.player?.play()
    }
}

