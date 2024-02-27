import Foundation

typealias AccesibilityID = String

enum Locators {
    private static let HomeViewLocators: AccesibilityID = "HomeViewLocators"
    
    static let TabView: AccesibilityID = HomeViewLocators + ".TabView"
    static let FirstTab: AccesibilityID = HomeViewLocators + ".FirstTab"
    static let ButtonFirstTab: AccesibilityID = HomeViewLocators + ".ButtonFirstTab"
    static let SecondTab: AccesibilityID = HomeViewLocators + ".SecondTab"
    static let ButtonSecondTab: AccesibilityID = HomeViewLocators + ".ButtonSecondTab"
}
