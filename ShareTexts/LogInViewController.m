//
//  LogInViewController.m
//  ShareTexts
//
//  Created by stavro on 4/4/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import "LogInViewController.h"
#import "ShareTextsFirstViewController.h"
#import "SignUpViewController.h"
#import "testTableViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface LogInViewController ()

@end

@implementation LogInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark view lifecycle 

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    
    UIButton *loginButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 160, 300, 400)];
    loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    loginButton.backgroundColor = [UIColor redColor];
    loginButton.layer.borderColor = [UIColor redColor].CGColor;
    loginButton.layer.borderWidth = 0.5f;
    loginButton.layer.cornerRadius = 10.0f;
}

- (void)viewDidLoad
{
    // committing
    [super viewDidLoad];
    
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction:)];
	self.navigationItem.leftBarButtonItem = cancelButton;
    
    NSLog(@"did this view even load?");
    
    
    
    // self.navigationController.navigationItem.rightBarButtonItem;
    
    //    UIColor *coolGreen = [UIColor colorWithRed:0.257 green:0.597 blue:0.018 alpha:1.000];
    //
    //    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //    loginButton.backgroundColor = coolGreen;
    //    loginButton.layer.borderColor = [UIColor blackColor].CGColor;
    //    loginButton.layer.borderWidth = 0.5f;
    //    loginButton.layer.cornerRadius = 10.0f;
    //    [loginButton setTitle:@"Sign In" forState:UIControlStateNormal];
    //    loginButton.frame = CGRectMake(80, 210, 160, 40);
    //    [self.view addSubview:loginButton];
    
    
    // I decided to take this shitty looking background out for now
    //    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"iPadBackgroundTexture-brown.png"]]];
    
    self.originalCenter  = self.view.center;
    self.view.center = CGPointMake(self.originalCenter.x, 120);
    
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    
    
    
	// Do any additional setup after loading the view.
    
    //    UILabel *shareTextsLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 300, 40)];
    //    shareTextsLabel.text = @"Share Texts App";
    //    shareTextsLabel.backgroundColor = [UIColor grayColor];
    //    shareTextsLabel.textAlignment = NSTextAlignmentCenter;
    //    [self.view addSubview:shareTextsLabel];
    
    self.usernameOrEmailTextField.placeholder = @"username or email";
    self.usernameOrEmailTextField.delegate = self;
    
    self.passwordTextField.placeholder = @"password";
    self.passwordTextField.delegate = self;
    
    //    UINavigationBar *barButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:nil];
    //    self.navigationItem.rightBarButtonItem = barButton;
    
}

- (void) viewDidAppear:(BOOL)animated
{
    
    NSLog(@"viewDidAppear: Did this appear");
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
    NSLog(@"what is this value: %@", self.usernameOrEmailTextField.text);
    NSLog(@"this is the other value: %@", self.ttvc.checkingEmailForLogIn);
    
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

- (IBAction)logInButton:(id)sender
{
    
    if (self.usernameOrEmailTextField.text.length == 0 || self.passwordTextField.text.length == 0 ) {
        
        UIAlertView *emptyTextAlert = [[UIAlertView alloc] initWithTitle:nil message:@"You must fill out both fields to proceed" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [emptyTextAlert show];
        return;
        
        ShareTextsFirstViewController *stfvc = [[ShareTextsFirstViewController alloc] init];
        
        [self presentViewController: stfvc animated:YES completion:^{
            
        }];
//    } else {
//        [self performSegueWithIdentifier:@"toShareTexts" sender:self];
        
        
            }
}

- (IBAction)signUpButton:(id)sender
{
    SignUpViewController *sivc = [[SignUpViewController alloc] init];
    [sivc setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:sivc animated:YES completion:^{
    }];
}

- (IBAction)googleSignInButton:(id)sender
{
    [self.presentedViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (IBAction)facebookSignInButton:(id)sender
{
    
    
}

#pragma mark notifications


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    //keyboardIsPresentOnWindow
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.2];
    self.view.center = CGPointMake(self.originalCenter.x,280);
    [UIView commitAnimations];
    
    // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.usernameOrEmailTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.5];
    self.view.center = CGPointMake(self.originalCenter.x, 185);
    
    
    // self.view.frame = CGRectMake(0, 120, 320,400);
    [UIView commitAnimations];
    
}


- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [self.usernameOrEmailTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    return NO;
}


- (void)keyboardDidShow:(NSNotification *)note
{
   // self.view.center = CGPointMake(self.originalCenter.x, 120);
}


//- (BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
//{
//
//}

//- (void)keyboardDidHide:(NSNotification *)note
//{
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:.1];
//    self.view.center = CGPointMake(self.originalCenter.x,280);
//    [UIView commitAnimations];
//
//}

@end
