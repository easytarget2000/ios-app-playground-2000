import UIKit

extension UIApplication {

    func openSettings() {
        guard let url = URL(string: Self.openSettingsURLString) else {
            return
        }

        self.open(url)
    }

}
