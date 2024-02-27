import XCTest

final class TabBarPageObject: BasePageObject {
    private let tabbar: XCUIElement
    private let firstTab: XCUIElement
    private let secondTab: XCUIElement
    
    override init(application: XCUIApplication) {
        tabbar = application.tabBars.firstMatch
        firstTab = tabbar.buttons[Locators.FirstTab]
        secondTab = tabbar.buttons[Locators.SecondTab]
        
        super.init(application: application)
    }
    
    func tapFirstTab() {
        firstTab.tap()
    }
    
    func tapSecondTab() {
        secondTab.tap()
    }
    
    override func distinctElement() -> XCUIElement {
        tabbar
    }
}
