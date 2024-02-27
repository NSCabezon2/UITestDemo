import XCTest

final class DemoTests: TestCase {
    var tabbarPage: TabBarPageObject!
    var firstPage: FirstTabPageObject!
    var secondPage: SecondTabPageObject!
    
    override func setUp() {
        super.setUp()
        
        tabbarPage = TabBarPageObject(application: app)
        firstPage = FirstTabPageObject(application: app)
        secondPage = SecondTabPageObject(application: app)
    }
    
    func test_tapOnSecondTab() throws {
        let application = XCUIApplication()
        application.launch()
        
        tabbarPage.waitToAppear()
        firstPage.waitToAppear()
        firstPage.tapButton()
        tabbarPage.tapSecondTab()
        secondPage.tapButton()
    }
}
