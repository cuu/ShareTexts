//
//  LogInViewController.m
//  ShareTexts
//
//  Created by stavro on 4/4/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import "LogInViewController.h"

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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UILabel *shareTextsLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 300, 40)];
    shareTextsLabel.text = @"Share Texts App";
    shareTextsLabel.backgroundColor = [UIColor grayColor];
    shareTextsLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:shareTextsLabel];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
