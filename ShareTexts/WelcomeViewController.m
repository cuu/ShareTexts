//
//  WelcomeViewController.m
//  ShareTexts
//
//  Created by stavro on 4/11/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import "WelcomeViewController.h"
#import "LogInViewController.h"
#import "SignUpViewController.h"
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
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"ruggedWallpaper.png"]]];

    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:[[NSDate alloc] init]];
    
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    NSDate *today = [cal dateByAddingComponents:components toDate:[[NSDate alloc] init] options:0]; //This variable should now be pointing at a date object that is the start of today (midnight);
    
    [components setHour:-24];
    [components setMinute:0];
    [components setSecond:0];
    NSDate *yesterday = [cal dateByAddingComponents:components toDate: today options:0];
    
    components = [cal components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:[[NSDate alloc] init]];
    
    [components setDay:([components day] - ([components weekday] - 1))];
    NSDate *thisWeek  = [cal dateFromComponents:components];
    
    [components setDay:([components day] - 7)];
    NSDate *lastWeek  = [cal dateFromComponents:components];
    
    [components setDay:([components day] - ([components day] -1))];
    NSDate *thisMonth = [cal dateFromComponents:components];
    
    [components setMonth:([components month] - 1)];
    NSDate *lastMonth = [cal dateFromComponents:components];
    
    NSLog(@"today=%@",today);
    NSLog(@"yesterday=%@",yesterday);
    NSLog(@"thisWeek=%@",thisWeek);
    NSLog(@"lastWeek=%@",lastWeek);
    NSLog(@"thisMonth=%@",thisMonth);
    NSLog(@"lastMonth=%@",lastMonth);
    
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
    
//    LogInViewController *livc = [[LogInViewController alloc] init];
//    [self presentViewController:livc animated:YES completion:^{
//        
//    }];
//    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"toLoginView"])
    {
        // Get reference to the destination view controller
        LogInViewController *livc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
       // [livc setMyObjectHere:object];
    }
    
    else if ([[segue identifier] isEqualToString:@"toSignUpView"])
    {
        SignUpViewController *suvc = [segue destinationViewController];
    
        
    }
}


- (IBAction)signUpWelcomeButton:(id)sender
{
    
//    // segue for going to 
//    [self performSegueWithIdentifier:@"toSignUpView" sender:sender];
//    LogInViewController *livc = [[LogInViewController alloc] init];
//    [self.navigationController pushViewController:livc animated:YES];

}

//- (id)instantiateViewControllerWithIdentifier:(NSString *)identifier
//{
//    
//   // toSignIn
//}





@end
