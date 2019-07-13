// (C) 2019, Ralf Ebert - iOS Example Project: Countdown
// License: https://opensource.org/licenses/0BSD

import UIKit

class CountdownViewController: UIViewController, CountdownDelegate {

    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var startButton: UIButton!

    let countdown = Countdown(seconds: 5)

    override func viewDidLoad() {
        super.viewDidLoad()

        self.timeLabel.text = ""
        self.countdown.delegate = self
    }

    @IBAction func onStartTapped() {
        self.countdown.start()
    }

    // MARK: - CountdownDelegate

    func secondsChanged(countdown: Countdown) {
        self.timeLabel.text = String(Int(countdown.seconds))
    }

    func finished(countdown: Countdown) {
        self.timeLabel.text = "Bing!"
    }

}
