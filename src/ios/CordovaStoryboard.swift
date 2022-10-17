@objc(CordovaStoryboard) class CordovaStoryboard : CDVPlugin{

    // MARK: Properties
    var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)

    //This method is called when the plugin is initialized; plugin setup methods got here
    override func pluginInitialize() {
    }
    /* This methods accepts string messgae from ionic app
     and returns a message */
    @objc(coolMethod:) func coolMethod(_ command: CDVInvokedUrlCommand?) {
        var pluginResult: CDVPluginResult? = nil
        let echo = command?.arguments[0] as? String
        if let echoString = echo{
            pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "\(echoString)!! from India")
        } else {
            pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)
        }

        commandDelegate.send(pluginResult, callbackId: command?.callbackId)
    }

    @objc(getUserData:) func getUserData(_ command: CDVInvokedUrlCommand) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let userDataController = storyboard.instantiateViewController(withIdentifier: "controllerId") as! ViewController
        userDataController.userDataDelegate = self
        userDataController.cdvCommand = command
        viewController.addChildController(userDataController)
    }
}

// User Report date delegate methods which sends result back to ionic app from UIViewController
extension CordovaStoryboard: UserDataDelegate {
    func sendData(userData: [String : Any], command: CDVInvokedUrlCommand) {
        print("Data: \(userData)")
        pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: userData)
        self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
    }
}