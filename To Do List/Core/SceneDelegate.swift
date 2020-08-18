//
//  SceneDelegate.swift
//  To Do List
//
//  Created by MAK on 5/9/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import MOLH
class SceneDelegate: UIResponder, UIWindowSceneDelegate ,MOLHResetable {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        //        if let windowScene = scene as? UIWindowScene {
        //            let window = UIWindow(windowScene: windowScene)
        //            let Storyboard = UIStoryboard(name: "UserList",bundle: nil)
        //            let sc = Storyboard.instantiateViewController(withIdentifier: "UserList") as! UserList
        //            window.rootViewController = sc
        //            self.window = window
        //            window.makeKeyAndVisible()
        //        }
        MOLH.shared.activate(true)
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
    }
    
    func reset() {
                let Storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                let nav = Storyboard.instantiateViewController(withIdentifier: "SignUpVc")
        
                let scene = UIApplication.shared.connectedScenes.first
                if let sd : SceneDelegate = (scene?.delegate as? SceneDelegate){
                    sd.window!.rootViewController = nav
                }
    }
    
    
    
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

