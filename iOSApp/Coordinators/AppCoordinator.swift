//
//  AppCoordinator.swift
//  iOSApp
//
//  Created by Reem El Machtoub on 9/6/2026.
//

import SwiftUI
import Combine

@MainActor
class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func showDetail(for show: TVShow) {
        path.append(Route.showDetail(show))
    }
    
    func popToRoot() {
        path = NavigationPath()
    }
}
