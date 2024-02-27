import Foundation
import XCTest

class BasePageObject {
    let app: XCUIApplication

    init(application: XCUIApplication) {
        app = application
    }

    //This should be overriden by subclasses and the visibility of a distinct element per page (Eg. A label, a textfield)
    func isVisible() -> Bool {
        return false
    }

    func distinctElement() -> XCUIElement {
        fatalError("Implemented by subclasses")
    }

    func goBack() {
        app.navigationBars.buttons.firstMatch.tap()
    }
}

extension BasePageObject {
    @discardableResult
    func waitToAppear(timeout: TimeInterval = 10) -> Bool {
        return distinctElement().waitForExistence(timeout: timeout)
    }
}
