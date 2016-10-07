//
//  LoginViewController.m
//  AppiumTestProject
//
//  Created by Franco Liu on 07/10/2016.
//  Copyright © 2016 Franco Liu. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController() 

@property int keyboardHight;



@end

@implementation LoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidFrameChange:) name:UIKeyboardDidChangeFrameNotification object:nil];
    
    
    self.userTextField.delegate = self;
    self.passWordTextField.delegate = self;

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // register for keyboard notifications
    
    //[[NSNotificationCenter defaultCenter] addObserver:self
                                             //selector:@selector(keyboardWillShow)
                                               //  name:UIKeyboardWillShowNotification
                                              // object:nil];
    
    ///[[NSNotificationCenter defaultCenter] addObserver:self
                                           //  selector:@selector(keyboardWillHide)
                                               //  name:UIKeyboardWillHideNotification
                                               //object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // unregister for keyboard notifications while not visible.
    /*[[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    
    return YES;
}

-(void)keyboardDidFrameChange:(NSNotification *)notification
{
    // Animate the current view out of the way
    NSDictionary* keyboardInfo = [notification userInfo];
    NSValue* keyboardFrameEnd = [keyboardInfo valueForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardFrameEndRect = [keyboardFrameEnd CGRectValue];
    
    int keyBoard_y =keyboardFrameEndRect.origin.y;
    int frame_y=self.view.frame.origin.y+self.view.frame.size.height;
    
    if ((keyBoard_y > frame_y) )
    {
        [self setViewMovedUp:NO withHight:keyboardFrameEndRect.size.height];
    }
    
    if ((keyBoard_y == frame_y) && (frame_y > 0))
    {
        [self setViewMovedUp:NO withHight:keyboardFrameEndRect.size.height];
    }
    
    if (keyBoard_y < frame_y)
    {
        [self setViewMovedUp:YES withHight:keyboardFrameEndRect.size.height];
    }
    
    
    
}


/*-(void)keyboardWillShow:(NSNotification *)notification
{
    // Animate the current view out of the way
    int keyboardHight =[self getKeboardHightWithNotification:notification];
    

    
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES withHight:keyboardHight];
    }
    
}

-(void)keyboardWillHide:(NSNotification *)notification {
    
    int keyboardHight =[self getKeboardHightWithNotification:notification];
    
    if (self.view.frame.origin.y >= 0)
    {
        
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO withHight:keyboardHight];
    }
}*/

//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp withHight:(int)hight
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= hight;
        rect.size.height += hight;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += hight;
        rect.size.height -= hight;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}

-(int)getKeboardHightWithNotification:(NSNotification *)notification
{
    
    NSLog(@"%f", [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height);

    return [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
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
