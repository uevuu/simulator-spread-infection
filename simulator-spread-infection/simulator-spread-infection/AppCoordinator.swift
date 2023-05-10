//
//  AppCoordinator.swift
//  simulator-spread-infection
//
//  Created by Nikita Marin on 10.05.2023.
//

import UIKit

// MARK: - AppCoordinator
final class AppCoordinator {
    private var window: UIWindow
    private weak var navigationController: UINavigationController?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start(){
        let builder = ParameteresBuilder(moduleOutput: self)
        let viewController = builder.build()
        let navigationController = UINavigationController(rootViewController: viewController)
        self.navigationController = navigationController
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

extension AppCoordinator: ParameteresPresenterOutput {
    func showSimulationModule(parameters: SimulationParameters) {
        let builder = SimulationBuilder()
        let viewController = builder.build(simulationParameters: parameters)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
