//
//  ShareTextsCell.h
//  ShareTexts
//
//  Created by stavro on 4/2/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareTextsCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *recipientSentLabel;


@property (strong, nonatomic) IBOutlet UILabel *numberOfPicsSentLabel;

@property (strong, nonatomic) IBOutlet UILabel *dateSentLabel;


@end
