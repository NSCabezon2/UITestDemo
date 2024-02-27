import UIKit
import XCTest

extension XCUIApplication {

    enum TestingLocale {
        case ES
        case GB
        case DE
    }

    func pop() {
        navigationBars.buttons.element(boundBy: 0).tap()
    }

    func launch(locale: TestingLocale) {
        switch locale {
        case .ES:
            launchArguments += ["-AppleLanguages", "(es)"]
            launchArguments += ["-AppleLocale", "es-ES"]
        case .GB:
            launchArguments += ["-AppleLanguages", "(en)"]
            launchArguments += ["-AppleLocale", "en-GB"]
        case .DE:
            launchArguments += ["-AppleLanguages", "(de)"]
            launchArguments += ["-AppleLocale", "de-DE"]
        }

        launch()
    }

    func setUITestParameter(parameter: String) {
        if let simulatorSharedDir = ProcessInfo().environment["SIMULATOR_SHARED_RESOURCES_DIRECTORY"] {
            let simulatorHomeDirURL = URL(fileURLWithPath: simulatorSharedDir)
            let path = simulatorHomeDirURL.appendingPathComponent("tmp").appendingPathComponent("UITestID")
            try? parameter.write(to: path, atomically: true, encoding: String.Encoding.utf8)
        } else {
            assertionFailure("This is valid only in simulator")
        }
    }
}

fileprivate extension Dictionary where Key == String, Value == String {
    var toJsonString: String {
        do {
            let data = try JSONEncoder().encode(self)
            return String(data: data, encoding: .utf8) ?? ""
        } catch {
            return ""
        }
    }
}

fileprivate extension Dictionary where Key == String, Value == Bool {
    var toJsonString: String {
        do {
            let data = try JSONEncoder().encode(self)
            return String(data: data, encoding: .utf8) ?? ""
        } catch {
            return ""
        }
    }
}

extension XCUIElement {
    /**
     Removes any current text in the field before typing in the new value
     - Parameter text: the text to enter into the field
     */
    func clearAndEnterText(text: String) {
        guard let stringValue = value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }

        if !hasKeyboardFocus() {
            let lowerRightCorner = self.coordinate(withNormalizedOffset: CGVector(dx: 0.9, dy: 0.9))
            lowerRightCorner.tap()
        }

        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
        typeText(deleteString)

        if !hasKeyboardFocus() {
            tap()
        }
        typeText(text)
    }

    /// Scrolls to bottom of caller til `element` is hittable
    func scrollTillHittable(for element: XCUIElement, _ maxSwipes: Int = 3) {
        guard maxSwipes > 0 else {
            if !element.exists {
                assertionFailure("Element not found on screen. ID: \(element.identifier)")
            }
            return
        }

        if !element.exists || !element.isHittable {
            self.swipeUp()
            scrollTillHittable(for: element, maxSwipes - 1)
        }
    }

    // Press delete a set number of times
    func enterAndPressDelete(times: Int = 1) {
        if !hasKeyboardFocus() {
            tap()
        }
        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: times)
        typeText(deleteString)
    }

    // Check if it has keyboardFocus
    func hasKeyboardFocus() -> Bool {
        return (self.value(forKey: "hasKeyboardFocus") as? Bool) ?? false
    }
}

extension XCTestCase {
    func takeScreenshot(name: String) {
        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.lifetime = .keepAlways
        attachment.name = name
        add(attachment)
    }

    func takeScreenshot() {
        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.lifetime = .keepAlways
        attachment.name = name
        add(attachment)
    }
}
