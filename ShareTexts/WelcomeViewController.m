//
//  WelcomeViewController.m
//  ShareTexts
//
//  Created by stavro on 4/11/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import "WelcomeViewController.h"
#import <unistd.h>

@interface WelcomeViewController ()

@end

@implementation WelcomeViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark buttons

- (IBAction)signInWelcomeButton:(id)sender
{
    
    WelcomeViewController *wvc = [[WelcomeViewController alloc] init];
    [wvc setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:wvc animated:YES completion:^{
        
    }];
    
}

- (IBAction)signUpWelcomeButton:(id)sender
{
    
}

//- (id)instantiateViewControllerWithIdentifier:(NSString *)identifier
//{
//    
//   // toSignIn
//}





@end
