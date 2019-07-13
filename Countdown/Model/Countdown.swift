// (C) 2019, Ralf Ebert - iOS Example Project: Countdown
// License: https://opensource.org/licenses/0BSD

import Foundation

protocol CountdownDelegate: AnyObject {
    func secondsChanged(countdown: Countdown)
    func finished(countdown: Countdown)
}

class Countdown {

    weak var delegate: CountdownDelegate?

    var seconds: TimeInterval = 0 {
        didSet {
            self.delegate?.secondsChanged(countdown: self)
        }
    }

    init(seconds: TimeInterval) {
        self.seconds = seconds
    }

    func start() {
        self.scheduleTick()
    }

    func scheduleTick() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.seconds -= 1
            if self.seconds > 0 {
                self.scheduleTick()
            } else {
                self.delegate?.finished(countdown: self)
            }
        }
    }

}
