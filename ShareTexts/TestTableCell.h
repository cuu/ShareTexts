//
//  TestTableCell.h
//  ShareTexts
//
//  Created by stavro on 4/6/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;


@end
