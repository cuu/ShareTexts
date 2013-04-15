//
//  SignUpViewController.h
//  ShareTexts
//
//  Created by stavro on 4/5/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kUserName @"first name"


@interface SignUpViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailSignUpTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordSignUpTextField;

@property (strong, nonatomic) NSDictionary *userInfo;
@end
