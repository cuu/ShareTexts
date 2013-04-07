//
//  AGIPCAssetsController.h
//  AGImagePickerController
//
//  Created by Artur Grigor on 17.02.2012.
//  Copyright (c) 2012 - 2013 Artur Grigor. All rights reserved.
//  
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.
//  

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

#import "AGImagePickerController.h"
#import "AGIPCGridItem.h"


//testemail
#import <MessageUI/MFMailComposeViewController.h>


@interface AGIPCAssetsController : UITableViewController<UITableViewDataSource, UITableViewDelegate, AGIPCGridItemDelegate, MFMailComposeViewControllerDelegate, UITextFieldDelegate>
{
    UITextField *textField;
}

@property (strong) ALAssetsGroup *assetsGroup;
@property (ag_weak, readonly) NSArray *selectedAssets;
@property (strong) AGImagePickerController *imagePickerController;

@property (strong, nonatomic) UITextField *recipientTextField;

- (id)initWithImagePickerController:(AGImagePickerController *)imagePickerController andAssetsGroup:(ALAssetsGroup *)assetsGroup;

@end
