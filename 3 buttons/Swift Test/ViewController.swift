import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

 @IBAction func showMessage(sender: UIButton) {
    var emojiDict = ["🦡":"Енотовидная собака или енот, я не уверен", "🐈":"Кошка", "🐖":"Свинья", "🐕":"Собака"]
let selectedButton = sender
 if let wordtolookup = selectedButton.titleLabel?.text {
var meaning = emojiDict[wordtolookup]
let alertController = UIAlertController(title: "Это", message: meaning, preferredStyle: UIAlertController.Style.alert)

        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

}
}
