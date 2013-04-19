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
    
    self.usernameOrEmailTextField.text = @"";
    self.passwordTextField.text = @"";
    
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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];

  
    
 
    
    
    NSDictionary *userInfo = self.userDateBase;

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *theNameString = [defaults objectForKey:@"first name"];
    
    
    NSString *theOtherNameString = userInfo[kUserName];
    NSLog(@"This is the person's first name: %@", theNameString);
    
    
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
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *emailValuePassed = [defaults objectForKey:@"email"];
    NSString *passwordValuePassed = [defaults objectForKey:@"password"];
    
    
    
    NSLog(@"This is the person's email and password: %@, %@", emailValuePassed, passwordValuePassed);
    
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction:)];
	self.navigationItem.leftBarButtonItem = cancelButton;
    
    NSLog(@"did this view even load?");
    
    
    
 
    
 //    NSLog(@"these are the values: %@", userInfo);
    
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


- (void)setupDataModel
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSLog(@"what is the value of defaults anyway: %@", defaults);
    
    // load from defaults an array of past emails. The array will contain a dictionary for each past email. Each dictionary will contain the recipient, count, and date. Add the current sent email info to this array then resave back into defaults.
    
    self.userDateBase  = [defaults objectForKey:@"userDataBase"];
    if (self.userDateBase == nil) {
        self.userDateBase = [NSArray array];
    }
    
}



#pragma mark buttons

- (IBAction)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (IBAction)logInButton:(id)sender
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (self.usernameOrEmailTextField.text.length == 0 && self.passwordTextField.text.length == 0 ) {
        
        UIAlertView *emptyTextAlert = [[UIAlertView alloc] initWithTitle:nil message:@"You must fill out both fields to proceed" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [emptyTextAlert show];
        return;
        
    } else if (self.usernameOrEmailTextField.text.length == 0 && self.passwordTextField.text.length != 0)  {
        UIAlertView *emptyTextAlert = [[UIAlertView alloc] initWithTitle:nil message:@"You must enter your username or email to proceed" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [emptyTextAlert show];
        return;
    } else if (self.passwordTextField.text.length == 0 && self.usernameOrEmailTextField.text.length != 0)  {
        UIAlertView *emptyTextAlert = [[UIAlertView alloc] initWithTitle:nil message:@"You must enter your password to proceed" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [emptyTextAlert show];
        return;
    } else if (![self.passwordTextField.text isEqualToString:[defaults objectForKey:@"password"]] || ![self.usernameOrEmailTextField.text isEqualToString:[defaults objectForKey:@"email"]]) {
        UIAlertView *emptyTextAlert = [[UIAlertView alloc] initWithTitle:nil message:@"Incorrect login info entered" delegate:self cancelButtonTitle:nil otherButtonTitles:@"try again", nil];
        [emptyTextAlert show];
        return;
    } else if ([self.passwordTextField.text isEqualToString:[defaults objectForKey:@"password"]] && [self.usernameOrEmailTextField.text isEqualToString:[defaults objectForKey:@"email"]]) {
        
        [self performSegueWithIdentifier:@"toShareTexts" sender:sender];
    } 
}

- (IBAction)signUpButton:(id)sender
{
    
    [self performSegueWithIdentifier:@"toSignUpFromSignIn" sender:sender];
    
}

- (IBAction)googleSignInButton:(id)sender
{
    [self.presentedViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (IBAction)facebookSignInButton:(id)sender
{
    
    
}



- (void)keyboardDidShow:(NSNotification *)notification
{
    //Assign new frame to your view
    [self.view setFrame:CGRectMake(0,-20,320,460)]; //here taken -20 for example i.e. your view will be scrolled to -20. change its value according to your requirement.
    
}

-(void)keyboardDidHide:(NSNotification *)notification
{
    [self.view setFrame:CGRectMake(0,0,320,460)];
}



#pragma mark notifications


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
//    
//    //keyboardIsPresentOnWindow
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:.2];
//    self.view.center = CGPointMake(self.originalCenter.x,295);
//    [UIView commitAnimations];
//    
//    // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
//    
//    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.usernameOrEmailTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
//     
//        [UIView beginAnimations:nil context:NULL];
//        [UIView setAnimationDuration:.5];
//        self.view.center = CGPointMake(self.originalCenter.x, 185);
}



- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [self.usernameOrEmailTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    return NO;
}


//- (void)keyboardDidShow:(NSNotification *)note
//{
//    
//   // self.view.center = CGPointMake(self.originalCenter.x, 120);
//}


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
