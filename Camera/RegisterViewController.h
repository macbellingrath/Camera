//
//  RegisterViewController.h
//  Camera
//
//  Created by Mac Bellingrath on 10/19/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

#import "LoginViewController.h"

@interface RegisterViewController : LoginViewController

@end

////REGISTRATION
//func registerUser() {
//    let userName = userNameField.text
//    let user = PFUser()
//    user.username = userName
//    user.password = "myPassword"
//    user.email = "email@example.com"
//    // other fields can be set just like with PFObject
//    user["phone"] = "415-392-0202"
//
//    user.signUpInBackgroundWithBlock {
//        (succeeded: Bool, error: NSError?) -> Void in
//        if let error = error {
//            let errorString = error.userInfo["error"] as? NSString
//            // Show the errorString somewhere and let the user try again.
//            print(errorString)
//        } else {
//            // Hooray! Let them use the app now.
//
//            self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
//
//        }
//    }
//
//}
