import XCTest

class TestCase: XCTestCase {

    var app: XCUIApplication!
    private var portNumber: UInt16 = 0

    override func setUp() {
        super.setUp()
        continueAfterFailure = false

        app = XCUIApplication()
//        portNumber=8765
//        app.launchArguments = UITestConstants.LaunchArguments.loggedInLaunchArguments
        app.launchEnvironment = launchEnvironment()

//        app.setUITestParameter(parameter: "")
        
    }

    func launchEnvironment() -> [String: String] {
        return ["MockServerPortNumber": "\(portNumber)"]
    }

    override func tearDown() {
        super.tearDown()
    }
}
