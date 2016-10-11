//
//  BaseViewController.m
//  AppiumTestProject
//
//  Created by franco on 2016/10/7.
//  Copyright © 2016年 Franco Liu. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self viewInitObserver];
    
}

- (void)viewInitObserver {
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidFrameChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)keyboardDidFrameChange:(NSNotification *)notification
{
    // Animate the current view out of the way
    NSDictionary* keyboardInfo = [notification userInfo];
    NSValue* keyboardFrameEnd = [keyboardInfo valueForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardFrameEndRect = [keyboardFrameEnd CGRectValue];
    
    int keyBoardTopPos =keyboardFrameEndRect.origin.y;
    
    
    [self setViewMovedUp:NO withHight:keyboardFrameEndRect.size.height withYPos:keyBoardTopPos];
    
    
    
}



//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp withHight:(int)hight withYPos:(int)pos
{
    [UIView beginAnimations:nil context:NULL];
    
    CGRect rect = self.view.frame;
    CGRect NewRect = self.view.frame;
    
    int frame_buttom_y=rect.origin.y+rect.size.height;
    int distance=pos-frame_buttom_y;
    
    
    NewRect.origin.y += distance;
    
    if (distance>0) {
        [UIView setAnimationDuration:0.1];
    }
    else{
        [UIView setAnimationDuration:0.5];
    }
    
    self.view.frame = NewRect;
    
    [UIView commitAnimations];
}


- (void)showAlertViewWithTitle:(NSString*)title withMessage:(NSString*)msg {
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:msg
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction* ActionOk = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    
    [alert addAction:ActionOk];
    [self presentViewController:alert animated:YES completion:nil];
    
}

  
@end
