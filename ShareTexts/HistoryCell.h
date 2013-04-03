//
//  HistoryCell.h
//  ShareTexts
//
//  Created by stavro on 4/1/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *recipientLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfImages;
@property (weak, nonatomic) IBOutlet UILabel *dateSent;


@end
