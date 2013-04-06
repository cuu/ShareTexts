//
//  AGIPCAssetsController.m
//  AGImagePickerController
//
//  Created by Artur Grigor on 17.02.2012.
//  Copyright (c) 2012 - 2013 Artur Grigor. All rights reserved.
//
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.
//

#import "AGIPCAssetsController.h"

#import "AGImagePickerController+Helper.h"

#import "AGIPCGridCell.h"
#import "AGIPCToolbarItem.h"

@interface AGIPCAssetsController ()
{
    ALAssetsGroup *_assetsGroup;
    NSMutableArray *_assets;
    AGImagePickerController *_imagePickerController;
}

@property (nonatomic, strong) NSMutableArray *assets;

@end

@interface AGIPCAssetsController (Private)

- (void)changeSelectionInformation;

- (void)registerForNotifications;
- (void)unregisterFromNotifications;

- (void)didChangeLibrary:(NSNotification *)notification;
- (void)didChangeToolbarItemsForManagingTheSelection:(NSNotification *)notification;

- (BOOL)toolbarHidden;

- (void)loadAssets;
- (void)reloadData;

- (void)setupToolbarItems;

- (NSArray *)itemsForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)doneAction:(id)sender;
- (void)selectAllAction:(id)sender;
- (void)deselectAllAction:(id)sender;
- (void)customBarButtonItemAction:(id)sender;

@end

@implementation AGIPCAssetsController

#pragma mark - Properties

@synthesize assetsGroup = _assetsGroup, assets = _assets, imagePickerController = _imagePickerController;


- (UITextField *) recipientTextField
{
    if (!_recipientTextField) _recipientTextField = [[UITextField alloc] init];
    return _recipientTextField;
}

- (BOOL)toolbarHidden
{
    if (! self.imagePickerController.shouldShowToolbarForManagingTheSelection)
        return YES;
    else
    {
        if (self.imagePickerController.toolbarItemsForManagingTheSelection != nil) {
            return !(self.imagePickerController.toolbarItemsForManagingTheSelection.count > 0);
        } else {
            return NO;
        }
    }
}

- (void)setAssetsGroup:(ALAssetsGroup *)theAssetsGroup
{
    @synchronized (self)
    {
        if (_assetsGroup != theAssetsGroup)
        {
            _assetsGroup = theAssetsGroup;
            [_assetsGroup setAssetsFilter:[ALAssetsFilter allPhotos]];
<<<<<<< HEAD
						
=======
            
>>>>>>> commit
            [self reloadData];
        }
    }
}

- (ALAssetsGroup *)assetsGroup
{
    ALAssetsGroup *ret = nil;
    
    @synchronized (self)
    {
        ret = _assetsGroup;
    }
    
    return ret;
}

- (NSArray *)selectedAssets
{
    NSMutableArray *selectedAssets = [NSMutableArray array];
    
<<<<<<< HEAD
		for (AGIPCGridItem *gridItem in self.assets)
    {
				if (gridItem.selected)
        {
						[selectedAssets addObject:gridItem.asset];
				}
		}
=======
    for (AGIPCGridItem *gridItem in self.assets)
    {
        if (gridItem.selected)
        {
            [selectedAssets addObject:gridItem.asset];
        }
    }
>>>>>>> commit
    
    return selectedAssets;
}

#pragma mark - Object Lifecycle

- (id)initWithImagePickerController:(AGImagePickerController *)imagePickerController andAssetsGroup:(ALAssetsGroup *)assetsGroup
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self)
    {
        _assets = [[NSMutableArray alloc] init];
        self.assetsGroup = assetsGroup;
        self.imagePickerController = imagePickerController;
        self.title = NSLocalizedStringWithDefaultValue(@"AGIPC.Loading", nil, [NSBundle mainBundle], @"Loading...", nil);
        
        self.tableView.allowsMultipleSelection = NO;
        self.tableView.allowsSelection = NO;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        // Setup toolbar items
        [self setupToolbarItems];
        
        // Start loading the assets
        [self loadAssets];
    }
    
    return self;
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (! self.imagePickerController) return 0;
    
    double numberOfAssets = (double)self.assetsGroup.numberOfAssets;
    NSInteger nr = ceil(numberOfAssets / self.imagePickerController.numberOfItemsPerRow);
    
    return nr;
}

- (NSArray *)itemsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:self.imagePickerController.numberOfItemsPerRow];
    
    NSUInteger startIndex = indexPath.row * self.imagePickerController.numberOfItemsPerRow,
<<<<<<< HEAD
		endIndex = startIndex + self.imagePickerController.numberOfItemsPerRow - 1;
=======
    endIndex = startIndex + self.imagePickerController.numberOfItemsPerRow - 1;
>>>>>>> commit
    if (startIndex < self.assets.count)
    {
        if (endIndex > self.assets.count - 1)
            endIndex = self.assets.count - 1;
        
        for (NSUInteger i = startIndex; i <= endIndex; i++)
        {
            [items addObject:(self.assets)[i]];
        }
    }
    
    return items;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    AGIPCGridCell *cell = (AGIPCGridCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[AGIPCGridCell alloc] initWithImagePickerController:self.imagePickerController items:[self itemsForRowAtIndexPath:indexPath] andReuseIdentifier:CellIdentifier];
    }
<<<<<<< HEAD
		else
    {
				cell.items = [self itemsForRowAtIndexPath:indexPath];
		}
=======
    else
    {
        cell.items = [self itemsForRowAtIndexPath:indexPath];
    }
>>>>>>> commit
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect itemRect = self.imagePickerController.itemRect;
    return itemRect.size.height + itemRect.origin.y;
}

#pragma mark - View Lifecycle

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    [self reloadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    // Reset the number of selections
    [AGIPCGridItem performSelector:@selector(resetNumberOfSelections)];
    
    [super viewWillAppear:animated];
    
    self.recipientTextField.delegate = self;
}


- (void)viewDidDisappear:(BOOL)animated {
    self.recipientTextField.text = recipientTextField.text;
    NSLog(@"tes");
}


<<<<<<< HEAD
- (void)viewDidDisappear:(BOOL)animated {
		self.recipientTextField.text = textField.text;
		NSLog(@"tes");
}


=======
>>>>>>> commit
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Fullscreen
    if (self.imagePickerController.shouldChangeStatusBarStyle) {
        self.wantsFullScreenLayout = YES;
    }
    
    // Setup Notifications
    [self registerForNotifications];
    // Navigation Bar Items
    UIBarButtonItem *doneButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction:)];
    doneButtonItem.enabled = NO;
<<<<<<< HEAD
		//self.navigationItem.rightBarButtonItem = doneButtonItem;
		
    
    //testemail "Send Email" button
    //UIButton *shareButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 300, 40)];
		UIButton *shareButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 360, 300, 40)];
=======
    //self.navigationItem.rightBarButtonItem = doneButtonItem;
    
    
    //testemail "Send Email" button
    //UIButton *shareButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 300, 40)];
    UIButton *shareButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 260, 300, 40)];
>>>>>>> commit
    [shareButton setBackgroundImage:[UIImage imageNamed:@"nav-bar-background-normal@2x"]forState:UIControlStateNormal];
    [shareButton  addTarget:self action:@selector(sendEmail:) forControlEvents:UIControlEventTouchUpInside];
    [shareButton setTitle:@"Send Email" forState:UIControlStateNormal];
    [shareButton setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:shareButton];
    
    
    //textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 150, 300, 40)];
<<<<<<< HEAD
		textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 400, 300, 40)];

    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.font = [UIFont systemFontOfSize:15];
    textField.placeholder = @"recipient's name";
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.delegate = self;
    [self.view addSubview:textField];
    
		// self.recipientTextField.text = textField.text;
=======
    recipientTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 300, 300, 40)];
    
    recipientTextField.borderStyle = UITextBorderStyleRoundedRect;
    recipientTextField.font = [UIFont systemFontOfSize:15];
    recipientTextField.placeholder = @"recipient's name";
    recipientTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    recipientTextField.keyboardType = UIKeyboardTypeDefault;
    recipientTextField.returnKeyType = UIReturnKeyDone;
    recipientTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    recipientTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    recipientTextField.delegate = self;
    [self.view addSubview:recipientTextField];
    
    // self.recipientTextField.text = textField.text;
>>>>>>> commit
    NSLog(@"the text field says: %@", self.recipientTextField.text);
    
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [recipientTextField resignFirstResponder];
    return YES;
}

//resize image to send email
-(UIImage*)resizeImage:(UIImage*)image{
    //CGSize newSize = CGSizeMake(100.0, 100.0);
<<<<<<< HEAD
		CGSize newSize = CGSizeMake(300.0, 300.0);
		
=======
    CGSize newSize = CGSizeMake(300.0, 300.0);
    
>>>>>>> commit
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

//testemail
- (void)sendEmail:(UIButton *)button {
<<<<<<< HEAD
		
		if (textField.text.length == 0 ) {

				UIAlertView *emptyTextAlert = [[UIAlertView alloc] initWithTitle:nil message:@"You must enter a recipient name" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
				[emptyTextAlert show];
				return;

		}
		
		// Set our email message body
		NSMutableString *htmlMsg = [NSMutableString string];
		[htmlMsg appendString:@"<html><body><p>"];
		[htmlMsg appendString:@"This is your message \n\n\n"];
		//[htmlMsg appendString:@": %@</p></body></html>"];
		
		
		MFMailComposeViewController* controller =
		[[MFMailComposeViewController alloc] init];
		controller.mailComposeDelegate = self;
		controller.navigationBar.tintColor = [UIColor blackColor];
		[controller setMessageBody:htmlMsg isHTML:NO];
		//[controller setToRecipients:[NSArray arrayWithObjects:@"mike_chen7@hotmail.com", nil]];
			[controller setToRecipients:[NSArray arrayWithObjects:@"stavros81@gmail.com", nil]];
    
		
		// Pull the image from ALAsset
		int picCount = self.selectedAssets.count;
		for (int i = 0; i < picCount; i++) {
				
				ALAsset *asset = [self.selectedAssets objectAtIndex:i];
				ALAssetRepresentation *rep = [asset defaultRepresentation];
				Byte *buffer = (Byte*)malloc(rep.size);
				NSUInteger buffered = [rep getBytes:buffer
																 fromOffset:0.0 length:rep.size error:nil];
				NSData *imageData = [NSData dataWithBytesNoCopy:buffer
																								 length:buffered freeWhenDone:YES];
				
				//Image is too large for email, resize it with our custom method
				UIImage *dataImage = [UIImage imageWithData:imageData];
				dataImage = [self resizeImage:dataImage];
				imageData = UIImageJPEGRepresentation(dataImage, 1);
				
				NSString *fileType = [NSString stringWithFormat:@"file%i.jpeg", i];
				[controller addAttachmentData:imageData mimeType:@"image/jpeg" fileName:fileType];
		}
		
		[controller setSubject:@"Subject"];
		[controller setMessageBody:htmlMsg isHTML:YES];
		
		if (controller)
				[self presentViewController:controller animated:YES
												 completion:^{}];
		
=======
    
    if (recipientTextField.text.length == 0 ) {
        
        UIAlertView *emptyTextAlert = [[UIAlertView alloc] initWithTitle:nil message:@"You must enter a recipient name" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [emptyTextAlert show];
        return;
        
    }
    
    // Set our email message body
    NSMutableString *htmlMsg = [NSMutableString string];
    [htmlMsg appendString:@"<html><body><p>"];
    [htmlMsg appendString:@"This is your message \n\n\n"];
    //[htmlMsg appendString:@": %@</p></body></html>"];
    
    
    MFMailComposeViewController* controller =
    [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = self;
    controller.navigationBar.tintColor = [UIColor blackColor];
    [controller setMessageBody:htmlMsg isHTML:NO];
    //[controller setToRecipients:[NSArray arrayWithObjects:@"mike_chen7@hotmail.com", nil]];
    [controller setToRecipients:[NSArray arrayWithObjects:@"stavros81@gmail.com", nil]];
    
    
    // Pull the image from ALAsset
    int picCount = self.selectedAssets.count;
    for (int i = 0; i < picCount; i++) {
        
        ALAsset *asset = [self.selectedAssets objectAtIndex:i];
        ALAssetRepresentation *rep = [asset defaultRepresentation];
        Byte *buffer = (Byte*)malloc(rep.size);
        NSUInteger buffered = [rep getBytes:buffer
                                 fromOffset:0.0 length:rep.size error:nil];
        NSData *imageData = [NSData dataWithBytesNoCopy:buffer
                                                 length:buffered freeWhenDone:YES];
        
        //Image is too large for email, resize it with our custom method
        UIImage *dataImage = [UIImage imageWithData:imageData];
        dataImage = [self resizeImage:dataImage];
        imageData = UIImageJPEGRepresentation(dataImage, 1);
        
        NSString *fileType = [NSString stringWithFormat:@"file%i.jpeg", i];
        [controller addAttachmentData:imageData mimeType:@"image/jpeg" fileName:fileType];
    }
    
    [controller setSubject:@"Subject"];
    [controller setMessageBody:htmlMsg isHTML:YES];
    
    if (controller)
        [self presentViewController:controller animated:YES
                         completion:^{}];
    
>>>>>>> commit
}


- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error;
{
<<<<<<< HEAD
		[self dismissViewControllerAnimated:YES
														 completion:^{}];
		/*
		 UIAlertView *alert = [[UIAlertView alloc]
		 initWithTitle: nil message: @"Your complaint has been sent" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		 
		 if (result == MFMailComposeResultSent) {
		 [alert show];
		 }
		 */
=======
    [self dismissViewControllerAnimated:YES
                             completion:^{}];
    /*
     UIAlertView *alert = [[UIAlertView alloc]
     initWithTitle: nil message: @"Your complaint has been sent" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
     
     if (result == MFMailComposeResultSent) {
     [alert show];
     }
     */
>>>>>>> commit
    
    
    if (result == MFMailComposeResultSaved || result == MFMailComposeResultSent) {
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
        [dateFormatter setDateStyle:NSDateFormatterLongStyle];
        NSDate *date = [NSDate date];
        NSLog(@"%@",[dateFormatter stringFromDate:date]);
        NSString *dateAndTime = [dateFormatter stringFromDate:date];
        
        //SLdatabase input - save to defaults
        // Load from defaults an array of past emails.
        // The array will contain a dictionary for each past email.
        // Each dictionary will contain the recipient, count, and date.
        // Add the current sent email info to this array then resave back into defaults.
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
<<<<<<< HEAD
				
=======
        
>>>>>>> commit
        NSArray *history = [defaults objectForKey:@"convoHisotry"];
        
        if (history == nil) {
            history = [NSArray array];
        }
        
        NSDictionary *currentEmail = @{@"recipeint": self.recipientTextField.text,
                                       @"numberOfPicsSent": @(self.selectedAssets.count),
                                       @"date" : dateAndTime
                                       };
        
        history = [history arrayByAddingObject:currentEmail];
        [defaults setObject:history forKey:@"convoHisotry"];
        [defaults synchronize];
    }
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Destroy Notifications
    [self unregisterFromNotifications];
}

#pragma mark - Private

- (void)setupToolbarItems
{
    if (self.imagePickerController.toolbarItemsForManagingTheSelection != nil)
    {
        NSMutableArray *items = [NSMutableArray array];
        
        // Custom Toolbar Items
        for (id item in self.imagePickerController.toolbarItemsForManagingTheSelection)
        {
            NSAssert([item isKindOfClass:[AGIPCToolbarItem class]], @"Item is not a instance of AGIPCToolbarItem.");
            
            ((AGIPCToolbarItem *)item).barButtonItem.target = self;
            ((AGIPCToolbarItem *)item).barButtonItem.action = @selector(customBarButtonItemAction:);
            
            [items addObject:((AGIPCToolbarItem *)item).barButtonItem];
        }
        
        self.toolbarItems = items;
    } else {
        // Standard Toolbar Items
        UIBarButtonItem *selectAll = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedStringWithDefaultValue(@"AGIPC.SelectAll", nil, [NSBundle mainBundle], @"Select All", nil) style:UIBarButtonItemStyleBordered target:self action:@selector(selectAllAction:)];
        UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *deselectAll = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedStringWithDefaultValue(@"AGIPC.DeselectAll", nil, [NSBundle mainBundle], @"Deselect All", nil) style:UIBarButtonItemStyleBordered target:self action:@selector(deselectAllAction:)];
        
        NSArray *toolbarItemsForManagingTheSelection = @[selectAll, flexibleSpace, deselectAll];
        self.toolbarItems = toolbarItemsForManagingTheSelection;
        
    }
}

- (void)loadAssets
{
    [self.assets removeAllObjects];
    
    __ag_weak AGIPCAssetsController *weakSelf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        
        __strong AGIPCAssetsController *strongSelf = weakSelf;
        
        @autoreleasepool {
            [strongSelf.assetsGroup enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                
                if (result == nil)
                {
                    return;
                }
                
                AGIPCGridItem *gridItem = [[AGIPCGridItem alloc] initWithImagePickerController:strongSelf.imagePickerController asset:result andDelegate:strongSelf];
                if ( strongSelf.imagePickerController.selection != nil &&
                    [strongSelf.imagePickerController.selection containsObject:result])
                {
                    gridItem.selected = YES;
                }
                [strongSelf.assets addObject:gridItem];
            }];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [strongSelf reloadData];
            
        });
        
    });
}

- (void)reloadData
{
    // Don't display the select button until all the assets are loaded.
    [self.navigationController setToolbarHidden:[self toolbarHidden] animated:YES];
    
    [self.tableView reloadData];
    [self setTitle:[self.assetsGroup valueForProperty:ALAssetsGroupPropertyName]];
    [self changeSelectionInformation];
    
    NSInteger totalRows = [self.tableView numberOfRowsInSection:0];
    
    //Prevents crash if totalRows = 0 (when the album is empty).
    if (totalRows > 0) {
<<<<<<< HEAD
				
=======
        
>>>>>>> commit
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:totalRows-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:NO];
    }
}

- (void)doneAction:(id)sender
{
    [self.imagePickerController performSelector:@selector(didFinishPickingAssets:) withObject:self.selectedAssets];
    
    
}

- (void)selectAllAction:(id)sender
{
    for (AGIPCGridItem *gridItem in self.assets) {
        gridItem.selected = YES;
    }
}

- (void)deselectAllAction:(id)sender
{
    for (AGIPCGridItem *gridItem in self.assets) {
        gridItem.selected = NO;
    }
}

- (void)customBarButtonItemAction:(id)sender
{
    for (id item in self.imagePickerController.toolbarItemsForManagingTheSelection)
    {
        NSAssert([item isKindOfClass:[AGIPCToolbarItem class]], @"Item is not a instance of AGIPCToolbarItem.");
        
        if (((AGIPCToolbarItem *)item).barButtonItem == sender)
        {
            if (((AGIPCToolbarItem *)item).assetIsSelectedBlock) {
                
                NSUInteger idx = 0;
                for (AGIPCGridItem *obj in self.assets) {
                    obj.selected = ((AGIPCToolbarItem *)item).assetIsSelectedBlock(idx, ((AGIPCGridItem *)obj).asset);
                    idx++;
                }
                
            }
        }
    }
}

- (void)changeSelectionInformation
{
    if (self.imagePickerController.shouldDisplaySelectionInformation) {
        self.navigationController.navigationBar.topItem.prompt = [NSString stringWithFormat:@"(%d/%d)", [AGIPCGridItem numberOfSelections], self.assets.count];
    }
}

#pragma mark - AGGridItemDelegate Methods

- (void)agGridItem:(AGIPCGridItem *)gridItem didChangeNumberOfSelections:(NSNumber *)numberOfSelections
{
    self.navigationItem.rightBarButtonItem.enabled = (numberOfSelections.unsignedIntegerValue > 0);
    [self changeSelectionInformation];
}

- (BOOL)agGridItemCanSelect:(AGIPCGridItem *)gridItem
{
    if (self.imagePickerController.selectionMode == AGImagePickerControllerSelectionModeSingle && self.imagePickerController.selectionBehaviorInSingleSelectionMode == AGImagePickerControllerSelectionBehaviorTypeRadio)
    {
        for (AGIPCGridItem *item in self.assets)
            if (item.selected)
                item.selected = NO;
        
        return YES;
    } else
    {
        if (self.imagePickerController.maximumNumberOfPhotosToBeSelected > 0)
            return ([AGIPCGridItem numberOfSelections] < self.imagePickerController.maximumNumberOfPhotosToBeSelected);
        else
            return YES;
    }
}

#pragma mark - Notifications

- (void)registerForNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didChangeLibrary:)
                                                 name:ALAssetsLibraryChangedNotification
                                               object:[AGImagePickerController defaultAssetsLibrary]];
}

- (void)unregisterFromNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:ALAssetsLibraryChangedNotification
                                                  object:[AGImagePickerController defaultAssetsLibrary]];
}

- (void)didChangeLibrary:(NSNotification *)notification
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didChangeToolbarItemsForManagingTheSelection:(NSNotification *)notification
{
    NSLog(@"here.");
}

@end