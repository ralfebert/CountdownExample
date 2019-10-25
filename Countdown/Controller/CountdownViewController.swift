// (C) 2019, Ralf Ebert - iOS Example Project: Countdown
// License: https://opensource.org/licenses/0BSD

import UIKit

class CountdownViewController: UIViewController {

    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var startButton: UIButton!

    let countdown = Countdown(seconds: 5)

    override func viewDidLoad() {
        super.viewDidLoad()

        self.timeLabel.text = ""
        self.countdown.onCountdownDecreased = { [weak self] seconds in
            self?.timeLabel.text = "\(seconds)"
        }
    }

    @IBAction func onStartTapped() {
        self.countdown.start()
    }

}
