//
//  LoginViewController.m
//  AppiumTestProject
//
//  Created by Franco Liu on 07/10/2016.
//  Copyright © 2016 Franco Liu. All rights reserved.
//

#import "LoginViewController.h"
#import "BaseViewController.h"

@interface LoginViewController() 

@property int keyboardHight;



@end

@implementation LoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.userTextField.delegate = self;
    self.passWordTextField.delegate = self;

}
- (IBAction)doClickedLogin:(id)sender {
    
   if( [self checkLoginInputText])
   {
       [self checkLoginData];
   }
    
}
- (IBAction)doBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)checkLoginInputText {
    
    
    if (self.userTextField.text.length==0){
        [self showAlertViewWithTitle:@"Warning" withMessage:@"Please input user name"];
         return NO;
        
    }
    
    if (self.passWordTextField.text.length==0){
        [self showAlertViewWithTitle:@"Warning" withMessage:@"Please input user password"];
        
        return NO;
    }
    
    return YES;
}

- (void)checkLoginData {
    
    
    if (![self.userTextField.text isEqualToString:@"appium"]){
        [self showAlertViewWithTitle:@"Warning" withMessage:@"user name invalid"];
        return;
    }
    
    
    
    if (![self.passWordTextField.text isEqualToString:@"appiumpwd"]){
        [self showAlertViewWithTitle:@"Warning" withMessage:@"user password incorrect"];
         return;
        
    }
    
    [self showAlertViewWithTitle:@"Warning" withMessage:@"Login successful"];
  }



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
