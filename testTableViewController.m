//
//  testTableViewController.m
//  ShareTexts
//
//  Created by stavro on 4/3/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import "testTableViewController.h"
#import "ShareTextsCell.h"
#import "TestTableCell.h"
#import "SignUpViewController.h"

@interface testTableViewController ()

@end

@implementation testTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark view lifecycle

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self setupDataModel];
    [self.tableView reloadData];
    NSLog(@"what is this value: %@", self.checkingEmailForLogIn);

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   //[[self navigationController] setNavigationBarHidden:NO animated:YES];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.navigationItem.title = [NSString stringWithFormat:@"%@%@",[defaults objectForKey:@"first name"], @"'s profile"];
    
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSLog(@"this is the test table view controller");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Buttons

- (IBAction)backButton:(id)sender
{
[self dismissViewControllerAnimated:YES completion:^{
    
}];
}


#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 1;
//}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return self.userDateBase.count;
//}

#pragma mark nsuser defaults

- (void)setupDataModel
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSLog(@"what is the value of defaults anyway: %@", defaults);
    
    // load from defaults an array of past emails. The array will contain a dictionary for each past email. Each dictionary will contain the recipient, count, and date. Add the current sent email info to this array then resave back into defaults.
    
    self.userDateBase  = [defaults objectForKey:@"userDataBase"];
    if (self.userDateBase == nil) {
        self.userDateBase = [NSArray array];
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.userDateBase.count;
    
    // or should it be
    //return self.historyOfConversations.count;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TestTableCell";
    TestTableCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[TestTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    
    NSDictionary *userInfo = self.userDateBase[indexPath.row];
    
    cell.lastNameLabel.text = userInfo[@"first name"];
    cell.firstNameLabel.text = userInfo[@"last name"];
    cell.emailLabel.text = userInfo[@"email"];
    cell.passwordLabel.text = userInfo[@"password"];
    
    
    self.checkingEmailForLogIn = userInfo[@"email"];
    
    NSLog(@"what is this total value (table-cell): %@", userInfo);
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
