import UIKit

protocol UserDataDelegate {
    func sendData(userData: [String: Any], command: CDVInvokedUrlCommand)
}

class ViewController: UIViewController {

    //MARK: Properties
    var userDataDelegate: UserDataDelegate!
    var userDict = [String: Any]()
    var cdvCommand: CDVInvokedUrlCommand!

    //MARK: IBoutlets
    @IBOutlet weak var textfieldFirstName: UITextField!
    @IBOutlet weak var textfieldLastName: UITextField!
    @IBOutlet weak var buttonSubmit: UIButton!
    @IBOutlet weak var buttonBack: UIButton!
    //MARK: Button actions
    //@IBAction func buttonBackClicked(_ sender: Any) {
    //    userDict["firstName"] = nil
    //    userDict["lastName"] = nil
    //    self.userDataDelegate.sendData(userData: self.userDict,
     //                                  command: self.cdvCommand)
    //    self.removeChildController()
    //}
    
    //@IBAction func buttonSumitClicked(_ sender: Any) {
    //    if let  firstName = textfieldFirstName.text ,
     //       let lastName = textfieldLastName.text {
     //       if !firstName.isEmpty && !lastName.isEmpty {
     //           userDict["firstName"] = firstName
     //           userDict["lastName"] = lastName
     //          self.userDataDelegate.sendData(userData: self.userDict,
    //                                           command: self.cdvCommand)
    //           self.removeChildController()
    //        }
    //    }
    //}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //textfieldFirstName.textColor = .blackGrey
        //textfieldLastName.textColor = .blackGrey
        buttonSubmit.setTitleColor(.white, for: .normal)
        //buttonSubmit.backgroundColor = .purplePrimary
        //buttonBack.setTitleColor(.lightGrey, for: .normal)
        
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }
}