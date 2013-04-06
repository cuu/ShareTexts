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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"This is the Share Text View Controller");
    
}

- (void)setupDataModel
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // load from defaults an array of past emails. The array will contain a dictionary for each past email. Each dictionary will contain the recipient, count, and date. Add the current sent email info to this array then resave back into defaults.

    self.historyOfConversations  = [defaults objectForKey:@"convoHisotry"];
    if (self.historyOfConversations == nil) {
        self.historyOfConversations = [NSArray array];
    }
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self setupDataModel];
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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



-(void)imagePickerController:
(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
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

-(void)imagePickerControllerDidCancel:
(UIImagePickerController *)picker
{
		[self dismissViewControllerAnimated:YES completion:nil];
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 1;
//}

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
    
    return cell;
}




@end














