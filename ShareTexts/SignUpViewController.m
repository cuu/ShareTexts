//
//  SignUpViewController.m
//  ShareTexts
//
//  Created by stavro on 4/5/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark view lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    self.lastNameTextField.delegate = self;
    self.firstNameTextField.delegate = self;
    self.emailSignUpTextField.delegate = self;
    self.passwordSignUpTextField.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"did this view appear?");
}

- (void) viewWillDisappear:(BOOL)animated
{
    //    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //
    //    NSArray *userDataBase = [defaults objectForKey:@"userDataBase"];
    //
    //    if (userDataBase == nil) {
    //        userDataBase = [NSArray array];
    //    }
    //
    //    NSDictionary *userInfo = @{@"last name": self.lastNameTextField.text,
    //                               @"first name": self.firstNameTextField.text,
    //                               @"email": self.emailSignUpTextField.text,
    //                               @"password": self.passwordSignUpTextField.text};
    //
    //    userDataBase = [userDataBase arrayByAddingObject:userInfo];
    //    [defaults setObject:userDataBase forKey:@"userDataBase"];
    //    [defaults synchronize];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark buttons

- (IBAction)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (IBAction)submitButton:(id)sender
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *userDataBase = [defaults objectForKey:@"userDataBase"];
    
    if (userDataBase == nil) {
        userDataBase = [NSArray array];
    }
    
    NSDictionary *userInfo = @{@"last name": self.lastNameTextField.text,
                               @"first name": self.firstNameTextField.text,
                               @"email": self.emailSignUpTextField.text,
                               @"password": self.passwordSignUpTextField.text};
    
    userDataBase = [userDataBase arrayByAddingObject:userInfo];
    [defaults setObject:userDataBase forKey:@"userDataBase"];
    [defaults synchronize];
    
    
}

#pragma mark notifications

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [self.lastNameTextField resignFirstResponder];
    [self.firstNameTextField resignFirstResponder];
    [self.emailSignUpTextField resignFirstResponder];
    [self.passwordSignUpTextField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.lastNameTextField resignFirstResponder];
    [self.firstNameTextField resignFirstResponder];
    [self.emailSignUpTextField resignFirstResponder];
    [self.passwordSignUpTextField resignFirstResponder];
}


@end
