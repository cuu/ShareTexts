//
//  TestTableCell.m
//  ShareTexts
//
//  Created by stavro on 4/6/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import "TestTableCell.h"

@implementation TestTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
