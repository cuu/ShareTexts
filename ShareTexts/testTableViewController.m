//
//  testTableViewController.m
//  ShareTexts
//
//  Created by stavro on 4/1/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import "testTableViewController.h"
#import "HistoryCell.h"
#import "AGIPCAssetsController.h"

@interface testTableViewController ()

@property (nonatomic,strong) NSArray *historyArray;

@end

@implementation testTableViewController


/* this that we want saved and shown in this table view are

1) recipient (or email address that received email)
2) # of images sent
3) date/time the email was sent
4) when we click on cell, it would be cool to see the screenshots sent

*/

- (NSArray *)historyArray
{
    // load from defaults
    
    /*
     
     {
     
     "sentConvos" : [
     
     { "recipient" : "Barney",
     "number" : 2,
     "date" : "04/01/13"
     },
     
     { "recipient" : "Bamm",
     "number" : 5,
     "date" : "04/02/13"
     }
     
     
     
     ]
     
     }
     
     */
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 5;

    MCemail
    

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"HistoryCell";
    HistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
//    cell.textLabel.text = @"text";
    
    // cell.recipientLabel.text =

    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    cell.recipientLabel.text = @"stavro (statically typed)";
//    cell.numberOfImages.text = [defaults integerForKey:@"NumberOfPicsSent"];
    //cell.dateSent.text = [defaults objectForKey:@"Date"];
    
    cell.textLabel.text = @"hello";
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Navigation logic may go here. Create and push another view controller.
//    /*
//     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
//     // ...
//     // Pass the selected object to the new view controller.
//     [self.navigationController pushViewController:detailViewController animated:YES];
//     */
//}

@end
