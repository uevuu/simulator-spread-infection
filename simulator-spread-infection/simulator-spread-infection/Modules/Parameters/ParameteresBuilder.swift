//
//  ParameteresBuilder.swift
//  simulator-spread-infection
//
//  Created by Nikita Marin on 10.05.2023.
//

import UIKit

final class ParameteresBuilder {
    private var moduleOutput: ParameteresPresenterOutput?
    
    init(moduleOutput: ParameteresPresenterOutput?) {
        self.moduleOutput = moduleOutput
    }
    
    func build() -> UIViewController {
        let presenter = ParameteresPresenter(output: moduleOutput)
        let view = ParametersViewController(output: presenter)
        presenter.view = view
        return view
    }
}
