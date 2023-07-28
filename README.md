# FireBaseDynamicLinks
Dynamic Link is a deep-linking platform of firebase for the developers to share any content or your application with others by creating a short link.
Have you ever wanted to be notified once your app is first time installed by a user that is redirected to App Store via a link? This is the question that lead me to the Firebase Dynamic Links.
This framework lets you know the app is installed with the dynamic link you have created on Firebase or opened by clicking this link which is known as universal linking. In this blog post, I want to show you how to create a dynamic link on Firebase console and integrate it properly for your iOS app.


/*
 
 Please follow below setup instruction
 
 1: install pod file for dynamic links
 refer: https://cocoapods.org/pods/FirebaseDynamicLinks#standard-pod-install
 
 2: Configure Firebase into appdelegate at didfinishlaunching method.
 
 3: configure your App ID and Bundle Identifier on firebase console for dynamic links.
 
 4: In your Xcode project's Info.plist file, create a key called FirebaseDynamicLinksCustomDomains and set it to your app's Dynamic Links URL prefixes. For example:
 
 <key>FirebaseDynamicLinksCustomDomains</key>
 <array>
   <string>https://example.com/link</string>
   <string>https://example.com/promos</string>
 </array>
 
 
 
 
 // MARK: Receive Dynamic Links
 Now we will configure and write some code that how code will react when it receives Dynamic link. Let’s get started

 Configuration
 First, we will enable Associated Domain capability in identifiers. For that Follow these steps:

 Login in Apple Developer Account.
 Goto Certificates, Identifiers & Profiles.
 Select Identifiers.
 Open the identifier of your application.
 Mark the Associated Domains.
 Then save it.
 We are done here now we will configure our dynamic link in our project.

 Open Project and select target then go to Signing & capabilities.
 Add capability Associated Domains.
 Now add Domain like this applinks:appnamee.page.link

 
 */
