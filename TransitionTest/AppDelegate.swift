import Instabug
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private let navigationController = UINavigationController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        pushTextFieldViewController()

        // The token here needs to be for an account with user steps tracking enabled.
        Instabug.start(withToken: "YOUR_TOKEN", invocationEvent: .shake)

        return true
    }

    func pushTextFieldViewController() {
        let viewController = TextFieldViewController(returnKeyAction: { [weak self] in
            self?.pushTextFieldViewController()
        })

        navigationController.pushViewController(viewController, animated: true)
    }
}
