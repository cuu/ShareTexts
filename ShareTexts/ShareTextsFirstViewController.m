//
//  ShareTextsFirstViewController.m
//  ShareTexts
//
//  Created by stavro on 3/26/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import "ShareTextsFirstViewController.h"
#import "AGImagePickerController.h"
#import "ShareTextsCell.h"
#import "AGIPCAssetsController.h"
#import "ShareTextsCell.h"

@interface ShareTextsFirstViewController ()

@property (strong, nonatomic) ShareTextsCell *sharedTextCell;

@property (strong, nonatomic) NSArray *historyOfConversations;

@end


@implementation ShareTextsFirstViewController

{}
#pragma mark view lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    
    [self.tableView reloadData];

    
	// Do any additional setup after loading the view, typically from a nib.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.navigationBar.title = [NSString stringWithFormat:@"%@%@",[defaults objectForKey:@"first name"], @"'s profile"];
    
   // self.navigationBar.title = @"yo bitch";
    //self.navigationItem.title = @"hello there";
    
    NSLog(@"view did load");
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self setupDataModel];
    [self.tableView reloadData];
    
   // self.navigationBar.title = @"yo bitch";
    
    NSLog(@"share texts first view controller: view will appear");

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark nsuser defaults

- (void)setupDataModel
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // load from defaults an array of past emails. The array will contain a dictionary for each past email. Each dictionary will contain the recipient, count, and date. Add the current sent email info to this array then resave back into defaults.

    self.historyOfConversations  = [defaults objectForKey:@"convoHisotry"];
    if (self.historyOfConversations == nil) {
        self.historyOfConversations = [NSArray array];
    }
    
}

#pragma mark buttons

- (IBAction)back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (IBAction)addConversationButton:(id)sender
{
    NSLog(@"add convo button tapped");
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    NSDate *date = [NSDate date];
    
    NSLog(@"%@", [dateFormatter stringFromDate:date]);

    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        
        imagePicker.sourceType =  UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        imagePicker.delegate = self;
        //[self presentViewController:imagePicker animated:YES
        //							 completion:^{
        //}];
    }
    
    AGImagePickerController *imagePickerController = [[AGImagePickerController alloc] initWithFailureBlock:^(NSError *error) {
        
        if (error == nil)
        {
            NSLog(@"User has cancelled.");
            //[self dismissModalViewControllerAnimated:YES];
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
        } else
        {
            NSLog(@"Error: %@", error);
            
            // Wait for the view controller to show first and hide it after that
            double delayInSeconds = 0.5;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [self dismissViewControllerAnimated:YES completion:^{
                    
                }];
            });
        }
        
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
        
    } andSuccessBlock:^(NSArray *info) {
        NSLog(@"Info: %@", info);
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    }];
    
    //[self presentModalViewController:imagePickerController animated:YES];
    
    [self presentViewController:imagePickerController animated:YES
                     completion:^{
                     }];
}

#pragma mark image picker controller

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
		
		/*
		// Code here to work with media
		[self dismissViewControllerAnimated:YES completion:nil];
		
		NSString *mediaType = info[UIImagePickerControllerMediaType];
		
		if ([mediaType isEqualToString:(NSString *)kUTTypeImage])
		{
				UIImage *image = info[UIImagePickerControllerOriginalImage];
		}
		else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
		{
				// Media is a video
		}
		*/
		
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
		[self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark uitableview datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //the number of emails sent
    
    return self.historyOfConversations.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *CellIdentifier = @"ShareTextsCell";
    ShareTextsCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ShareTextsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    
    //SLdatabase
    NSDictionary *currentEmail = self.historyOfConversations[indexPath.row];
    
    NSDate *localDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"MM/dd/yy";
    NSString *dateString = [dateFormatter stringFromDate: localDate];
    NSLog(@" the date is %@", dateString);
    
    

    cell.dateSentLabel.text = currentEmail[@"date"];
    
    //Recipient
    cell.recipientSentLabel.text = currentEmail[@"recipeint"];
    //self.recipientSentLabel.text = [defaults objectForKey:@"recipient"];
    
    NSInteger theNumber = [currentEmail[@"numberOfPicsSent"] intValue];
    
    NSString *image = theNumber > 1 ? @"images" : @"image";
    cell.numberOfPicsSentLabel.text = [NSString stringWithFormat:@"%i %@", theNumber, image];
    
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;

    
    return cell;
}


#pragma mark uitableview delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"toDetailTexts" sender:tableView];
}







@end














