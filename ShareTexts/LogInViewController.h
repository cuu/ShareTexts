//
//  LogInViewController.h
//  ShareTexts
//
//  Created by stavro on 4/4/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogInViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameOrEmailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (nonatomic) CGPoint originalCenter;

@property (nonatomic, strong) UIViewController *loginViewController;
@property (nonatomic, strong) UIViewController *signUpViewController;

@end
