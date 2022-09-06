//
//  Dictionary_gameApp.swift
//  Dictionary_game
//
//  Created by Emilio Y Martinez on 31/08/22.
//

import SwiftUI

@main
struct Dictionary_gameApp: App {
    var body: some Scene {
        WindowGroup {
            ListView(l:Language(language: ""))
        }
    }
}
