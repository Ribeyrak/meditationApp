//
//  SceneDelegate.swift
//  testProdForOrder
//
//  Created by Evhen Lukhtan on 27.01.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navigation = UINavigationController()
    var navigation1 = UINavigationController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        navigation = UINavigationController(rootViewController: PaywallVC())
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
//        if (UserDefaults.standard.string(forKey: "userEmail") != nil) {
//            window?.rootViewController = UINavigationController(rootViewController: MainVCCoordinator().start())
//        } else {
//            window?.rootViewController = navigation
//        }
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }

}

