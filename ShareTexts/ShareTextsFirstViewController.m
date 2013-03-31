//
//  ShareTextsFirstViewController.m
//  ShareTexts
//
//  Created by stavro on 3/26/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import "ShareTextsFirstViewController.h"
#import "AGImagePickerController.h"

@interface ShareTextsFirstViewController ()

@end

@implementation ShareTextsFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addConversationButton:(id)sender
{
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


@end














