import XCTest

final class SecondTabPageObject: BasePageObject {
    private let secondTabButton: XCUIElement
    
    override init(application: XCUIApplication) {
        secondTabButton = application.buttons[Locators.ButtonSecondTab]
        
        super.init(application: application)
    }
    
    func tapButton() {
        secondTabButton.tap()
    }
    
    override func distinctElement() -> XCUIElement {
        secondTabButton
    }
}
