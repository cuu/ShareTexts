//
//  LogInTextFieldsTableView.m
//  ShareTexts
//
//  Created by stavro on 4/10/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import "LogInTextFieldsTableView.h"

@implementation LogInTextFieldsTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = @"hello";
    
    return cell;

}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//	if (section == 0) {
//		return 0;
//	} else if (section == 1) {
//		return 44;
//	}
//	return [super tableView:tableView heightForFooterInSection:section];
//}
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    int numberOfRows = [self.tableView numberOfRowsInSection:indexPath.section];
//    NSString *backgroundImageName = nil;
//    NSString *selectedBackgroundImageName = nil;
//    
//    if (numberOfRows == 1) {
//        backgroundImageName = @"tableViewSingleCell";
//        selectedBackgroundImageName = @"";
//    } else if (indexPath.row == 0) {
//        backgroundImageName = @"tableViewCellTop";
//    } else if (indexPath.row == numberOfRows -1) {
//        backgroundImageName = @"tableViewCellBottom";
//    } else {
//        backgroundImageName = @"tableViewCellMiddle";
//    }
//    
//    UIImage *image = [[UIImage imageNamed:backgroundImageName] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
//    cell.backgroundView = [[UIImageView alloc] initWithImage:image];
//    
//    UIImage *selectedImage = [[UIImage imageNamed:selectedBackgroundImageName] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
//    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:selectedImage];
//}




@end
