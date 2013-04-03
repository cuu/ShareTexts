//
//  testTableViewController.h
//  ShareTexts
//
//  Created by stavro on 4/3/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface testTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
