//
//  ViewController.m
//  AppiumTestProject
//
//  Created by Franco Liu on 07/10/2016.
//  Copyright © 2016 Franco Liu. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickLoginButton:(id)sender {
    
    LoginViewController *viewController = [[LoginViewController alloc] init];
    //[self.navigationController pushViewController:viewController animated:YES];
    
    [self presentViewController:viewController animated:YES completion:nil];
}


@end
