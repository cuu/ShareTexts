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

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
    NSLog(@"what is this value: %@", self.usernameOrEmailTextField.text);
    NSLog(@"this is the other value: %@", self.ttvc.checkingEmailForLogIn);

}

- (void)viewDidLoad
{
    // committing 
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"iPadBackgroundTexture-brown.png"]]];
    
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

- (void)keyboardDidShow:(NSNotification *)note
{
   // self.view.center = CGPointMake(self.originalCenter.x, 120);
}

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


//- (void)keyboardDidHide:(NSNotification *)note
//{
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:.1];
//    self.view.center = CGPointMake(self.originalCenter.x,280);
//    [UIView commitAnimations];
//
//}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.5];
    self.view.center = CGPointMake(self.originalCenter.x, 185);

    
   // self.view.frame = CGRectMake(0, 120, 320,400);
    [UIView commitAnimations];
    
}


//- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    // Make sure your segue name in storyboard is the same as this line
//    if ([[segue identifier] isEqualToString:@"toShareTextsFirstView"])
//    {
//        // Get reference to the destination view controller
//        ShareTextsFirstViewController *stfvc = [segue destinationViewController];
//        
//        // Pass any objects to the view controller here, like...
//    }
//    
//    if ([[segue identifier] isEqualToString:@"toSignUpView"])
//    {
//        // Get reference to the destination view controller
//        SignUpViewController *sivc = [segue destinationViewController];
//        
//        // Pass any objects to the view controller here, like...
//    }
//
//}

- (IBAction)logInButton:(id)sender
{
    
    if (self.usernameOrEmailTextField.text.length == 0 || self.passwordTextField.text.length == 0 ) {
        
        UIAlertView *emptyTextAlert = [[UIAlertView alloc] initWithTitle:nil message:@"You must fill out both fields to proceed" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [emptyTextAlert show];
        return;
        
        ShareTextsFirstViewController *stfvc = [[ShareTextsFirstViewController alloc] init];
        
        [self presentViewController: stfvc animated:YES completion:^{
            
        }];
        
        //[self shouldPerformSegueWithIdentifier:@"toShareTextsFirstView" sender:self];
    }
    
    if ([self.usernameOrEmailTextField.text isEqualToString:self.ttvc.checkingEmailForLogIn])
    {
        UIAlertView *uialertView = [[UIAlertView alloc] initWithTitle:@"awesome" message:@"awesome" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil];
        [uialertView show];
        return;
    }
    
    if ([self.usernameOrEmailTextField.text isEqualToString:self.ttvc.checkingEmailForLogIn]) {
        UIAlertView *uialertView = [[UIAlertView alloc] initWithTitle:@"awesome" message:@"awesome" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil];
        [uialertView show];
        return;
    
}
}


- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [self.usernameOrEmailTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    return NO;
}

- (BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{

//    [self shouldPerformSegueWithIdentifier:@"toShareTextsFirstView" sender:self];
//    return YES;
//
}

//- (void)perform
//{
//    UIViewController *src = (UIViewController *) self.loginViewController;
//    UIViewController *dst = (UIViewController *) self.signUpViewController;
//    
//    [UIView beginAnimations:@"LeftFlip" context:nil];
//    [UIView setAnimationDuration:0.8];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:dst.view.superview cache:YES];
//    [UIView commitAnimations];
//    
//    [dst presentViewController:src animated:NO completion:nil];
//}


- (IBAction)signUpButton:(id)sender
{
    SignUpViewController *sivc = [[SignUpViewController alloc] init];
    [self presentViewController: sivc animated:YES completion:^{
    }];
    
}

- (IBAction)googleSignInButton:(id)sender
{
    
}

- (IBAction)facebookSignInButton:(id)sender
{
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
