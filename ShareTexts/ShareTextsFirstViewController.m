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

@interface ShareTextsFirstViewController ()

@property (strong, nonatomic) ShareTextsCell *sharedTextCell;

@end


@implementation ShareTextsFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1000;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"ShareTextsCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ShareTextsCell"];
    }
    
    
    //    static NSString *CellIdentifier = @"Cell";
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
//    NSDate *localDate = [NSDate date];
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
//    dateFormatter.dateFormat = @"MM/dd/yy";
//    
//    NSString *dateString = [dateFormatter stringFromDate: localDate];
//    
//    NSLog(@" the date is %@", dateString);
//    
//    
//     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//
//   
//    
//    self.sharedTextCell.dateSentLabel.text = [defaults objectForKey:@"Date"];
//    self.sharedTextCell.recipientSentLabel.text = @"stavro";    
//    NSInteger theNumber = [defaults integerForKey:@"NumberOfPicsSent"];
//    self.sharedTextCell.numberOfPicsSentLabel.text = [NSString stringWithFormat:@"%i", theNumber];
    
    
    // in the book the following line of code is: cell.accessoryType = UITableViewCellAccessoryDetailDisclosureIndicator;
    //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    
    //    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //    cell.recipientLabel.text = @"stavro (statically typed)";
    //    cell.numberOfImages.text = [defaults integerForKey:@"NumberOfPicsSent"];
    //cell.dateSent.text = [defaults objectForKey:@"Date"];
    
    // Configure the cell...
    
    return cell;
    

}




@end














