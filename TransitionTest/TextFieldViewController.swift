import UIKit

class TextFieldViewController: UIViewController {
    let returnKeyAction: (() -> Void)?

    init(returnKeyAction: (() -> Void)? = nil) {
        self.returnKeyAction = returnKeyAction
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red

        let textField = UITextField()
        textField.backgroundColor = .white
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)

        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|-16-[textField]-16-|",
                                                           options: [],
                                                           metrics: nil,
                                                           views: ["textField": textField]))

        view.addConstraint(NSLayoutConstraint(item: textField,
                                              attribute: .centerY,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .centerY,
                                              multiplier: 1,
                                              constant: 0))

        textField.becomeFirstResponder()
    }
}

extension TextFieldViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        returnKeyAction?()
        return true
    }
}
