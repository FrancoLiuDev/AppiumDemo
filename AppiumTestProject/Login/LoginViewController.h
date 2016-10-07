//
//  LoginViewController.h
//  AppiumTestProject
//
//  Created by Franco Liu on 07/10/2016.
//  Copyright © 2016 Franco Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
@end
