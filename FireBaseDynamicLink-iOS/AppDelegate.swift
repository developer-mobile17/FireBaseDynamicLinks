//
//  AppDelegate.swift
//  FireBaseDynamicLink-iOS
//
//  Created by vikas on 28/07/23.
//

import UIKit
import firebbaseDynamiclinks
// Import FirBaseDynamiclinks

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        // Use Firebase library to configure APIs
        FirebaseApp.configure()
        return true
    }
    
    // MARK: Firebase Dynamic
    
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
      return application(app, open: url,
                         sourceApplication: options[UIApplication.OpenURLOptionsKey
                           .sourceApplication] as? String,
                         annotation: "")
    }

    
    
    // MARK: Use this if you have custom domain link like.  www.abc.com
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?,
                     annotation: Any) -> Bool {
      if let dynamicLink = DynamicLinks.dynamicLinks().dynamicLink(fromCustomSchemeURL: url) {
        // Handle the deep link. For example, show the deep-linked content or
        // apply a promotional offer to the user's account.
        // ...
        return true
      }
      return false
    }
    
    // MARK: This will call when you will click any Firebase dynamic Link outside the application like safari or mail or message.
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
            print("Handeling dynamic link")
            if let incomingURL = userActivity.webpageURL {
                print("Incoming URL is \(incomingURL)")
                let linkHandled = DynamicLinks.dynamicLinks().handleUniversalLink(incomingURL) { (dynamicLink, error) in
                    guard error == nil else {
                        print("Found an error! \(error!.localizedDescription)")
                        return
                    }
                    if let dynamicLink = dynamicLink {
                        self.handleIncomingDynamicLink(dynamicLink)
                    }
                }
                if linkHandled {
                    return true
                } else {
                    // Maybe do other things with our incoming url
                    return false
                }
            }
            return false
        }
    
    
    
    func handleIncomingDynamicLink(_ dynamicLink: DynamicLink) {
            guard let url = dynamicLink.url else {
                print("That is weird. My dynamic link object has no url")
                return
            }
            print("Your incoming link parameter is \(url.absoluteString)")
    }
    
}

