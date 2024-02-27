//
//  TabbarUITestDemoApp.swift
//  TabbarUITestDemo
//
//  Created by nscabezon on 27/2/24.
//

import SwiftUI

enum Tab: Int {
    case first
    case second
    
    var name: LocalizedStringKey {
        switch self {
        case .first:
            return LocalizedStringKey("first_tab_name")
        case .second:
            return LocalizedStringKey("second_tab_name")
        }
    }
}

@main
struct TabbarUITestDemoApp: App {
    @State var selectedTab: Tab = .first
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab) {
                VStack {
                    Text("test")
                    Button(action: {
                        debugPrint("button in first tab tapped!")
                    }, label: {
                        Text("ButtonToTap")
                    })
                    .accessibilityIdentifier(Locators.ButtonFirstTab)
                }
                .tabItem {
                    VStack {
                        Image(systemName: "map")
                        Text(Tab.first.name)
                    }
                    .accessibilityIdentifier(Locators.FirstTab)
                }
                .tag(Tab.first)
                VStack {
                    Text("test")
                    Button(action: {
                        debugPrint("button in second tab tapped!")
                    }, label: {
                        Text("ButtonToTap")
                    })
                    .accessibilityIdentifier(Locators.ButtonSecondTab)
                    
                }
                .tabItem {
                    VStack {
                        Image(systemName: "web.camera")
                        Text(Tab.second.name)
                    }
                    .accessibilityIdentifier(Locators.SecondTab)
                }
                .tag(Tab.second)
            }
            .accessibilityIdentifier(Locators.TabView)
        }
    }
}
