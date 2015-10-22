//
//  LoginViewController.h
//  Camera
//
//  Created by Mac Bellingrath on 10/19/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@end


////LOGGIN IN
//
//func logIn() {
//    if let userName = userNameField.text {
//        PFUser.logInWithUsernameInBackground("mac", password:"password") {
//            (user: PFUser?, error: NSError?) -> Void in
//            if user != nil {
//                // Do stuff after successful login.
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                
//                //login view controller
//                
//                if let loginVC = storyboard.instantiateInitialViewController() {
//                    
//                    self.presentViewController(loginVC, animated: true, completion: nil  )
//                    
//                    
//                } else {
//                    // The login failed. Check error to see why.
//                }
//            }
//            
//            
//        }
//        
//    }
//}
//
//
//
