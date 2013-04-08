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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.lastNameTextField.delegate = self;
    self.firstNameTextField.delegate = self;
    self.emailSignUpTextField.delegate = self;
    self.passwordSignUpTextField.delegate = self;
    
    

//    [self.view addSubview: self.lastNameTextField];
//    [self.view addSubview: self.firstNameTextField];
//    [self.view addSubview: self.passwordSignUpTextField];
//    [self.view addSubview: self.emailSignUpTextField];
    
[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"iPadBackgroundTexture-brown.png"]]];


    
    
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [self.lastNameTextField resignFirstResponder];
    [self.firstNameTextField resignFirstResponder];
    [self.emailSignUpTextField resignFirstResponder];
    [self.passwordSignUpTextField resignFirstResponder];
    return YES;
}


- (void) viewWillDisappear:(BOOL)animated
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.lastNameTextField resignFirstResponder];
    [self.firstNameTextField resignFirstResponder];
    [self.emailSignUpTextField resignFirstResponder];
    [self.passwordSignUpTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitButton:(id)sender
{
    
}


@end
