//
//  ShareTextsCell.m
//  ShareTexts
//
//  Created by stavro on 4/2/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import "ShareTextsCell.h"

@implementation ShareTextsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

/*- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    //SLdatabase output 
    
    NSDate *localDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"MM/dd/yy";
    NSString *dateString = [dateFormatter stringFromDate: localDate];
    NSLog(@" the date is %@", dateString);
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.dateSentLabel.text = [defaults objectForKey:@"Date"];
    
    //Recipient 
    self.recipientSentLabel.text = @"stavro";
    //self.recipientSentLabel.text = [defaults objectForKey:@"recipient"];
    
    NSInteger theNumber = [defaults integerForKey:@"numberOfPicsSent"];
    NSString *image = theNumber > 1 ? @"images" : @"image";
    self.numberOfPicsSentLabel.text = [NSString stringWithFormat:@"%i %@", theNumber, image];

}*/


@end
