//
//  AppCoordinator.swift
//  LadoTsivtsivadzze_41
//
//  Created by lado tsivtsivadze on 7/3/21.
//

import Foundation
import UIKit

final class AppCoordinator: CoordinatorProtocol {
    
    var filesManager: FilesManager
    
    private var window: UIWindow?
    private var navigationController: UINavigationController?
    
    init(_ window: UIWindow?, navigationController: UINavigationController?) {
        self.window = window
        self.navigationController = navigationController
        
        self.filesManager = FilesManager()
    }
    
    func start() {
        let vc = ReminderController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func goToContent(dirname: String, contentTxt: String, filename: String) {
        let vc = ContentController.instantiateFromStoryboard()
        vc.contentTxt = contentTxt
        vc.dirName = dirname
        vc.fileName = filename
        
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToEdit(categoryName: String) {
        let vc = EditController.instantiateFromStoryboard()
        vc.categoryName2 = categoryName
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
}
