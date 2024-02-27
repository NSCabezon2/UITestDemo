import XCTest

final class FirstTabPageObject: BasePageObject {
    private let firstTabButton: XCUIElement
    
    override init(application: XCUIApplication) {
        firstTabButton = application.buttons[Locators.ButtonFirstTab]
        
        super.init(application: application)
    }
    
    func tapButton() {
        firstTabButton.tap()
    }
    
    override func distinctElement() -> XCUIElement {
        firstTabButton
    }
}
