//
//  SignUpViewController.m
//  ShareTexts
//
//  Created by stavro on 4/5/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import "SignUpViewController.h"
#import "WelcomeViewController.h"


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

-(void) viewWillAppear:(BOOL)animated
{
    
}

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

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark buttons

- (IBAction)backToSignInButton:(id)sender
{
    // [self prepareForSegue:@"backToSignIn" sender:sender];
    [self performSegueWithIdentifier:@"backToSignIn" sender:sender];
    //    [self dismissViewControllerAnimated:YES completion:^{
    //
    //    }];
}

- (IBAction)submitButton:(id)sender
{
    
    
    BOOL validEmail = [self NSStringIsValidEmail:self.emailSignUpTextField.text];

    if (self.lastNameTextField.text.length == 0 || self.firstNameTextField.text.length == 0 || self.emailSignUpTextField.text.length == 0 || self.passwordSignUpTextField.text.length == 0 ) {
        
        UIAlertView *emptyTextAlert = [[UIAlertView alloc] initWithTitle:nil message:@"You must fill out all fields to proceed" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [emptyTextAlert show];
        return;

    }
    
    else if (!validEmail) {
        
        UIAlertView *emptyTextAlert = [[UIAlertView alloc] initWithTitle:nil message:@"You must enter a valid email" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [emptyTextAlert show];


        NSLog(@"test");
    }

    
    else [self performSegueWithIdentifier:@"backToSignIn" sender:sender];
    

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.firstNameTextField.text forKey:@"first name"];
    [defaults setObject:self.lastNameTextField.text forKey:@"last name"];
    [defaults setObject:self.emailSignUpTextField.text forKey:@"email"];
    [defaults setObject:self.passwordSignUpTextField.text forKey:@"password"];
    
    
    
       
    
    // this is to store the nsuserdefaults in an array
//    NSArray *userDataBase = [defaults objectForKey:@"userDataBase"];
//    
//    if (userDataBase == nil) {
//        userDataBase = [NSArray array];
//    }
//    
//
//    NSDictionary *userInfo = @{@"last name": self.lastNameTextField.text,
//                               @"first name": self.firstNameTextField.text,
//                               @"email": self.emailSignUpTextField.text,
//                               @"password": self.passwordSignUpTextField.text};
//
//    userDataBase = [userDataBase arrayByAddingObject:userInfo];
//    [defaults setObject:userDataBase forKey:@"userDataBase"];
    
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

-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
    
    

}


- (IBAction)cancelButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    

}
@end
