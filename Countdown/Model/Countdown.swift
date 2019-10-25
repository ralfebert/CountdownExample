// (C) 2019, Ralf Ebert - iOS Example Project: Countdown
// License: https://opensource.org/licenses/0BSD

import Foundation

class Countdown {

    var onCountdownDecreased: ((_ seconds: TimeInterval) -> Void)?

    var seconds: TimeInterval = 0 {
        didSet {
            self.onCountdownDecreased?(self.seconds)
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
            }
        }
    }

}
