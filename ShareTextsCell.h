//
//  ShareTextsCell.h
//  ShareTexts
//
//  Created by stavro on 4/2/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareTextsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *recipientSentLabel;


@property (weak, nonatomic) IBOutlet UILabel *numberOfPicsSentLabel;

@property (weak, nonatomic) IBOutlet UILabel *dateSentLabel;


@end
