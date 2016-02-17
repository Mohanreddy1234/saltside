//
//  DashBoardTableViewCell.m
//  SalSideDemo
//
//  Created by Mohanreddy on 16/02/16.
//  Copyright © 2016 Mohanreddy. All rights reserved.
//

#import "DashBoardTableViewCell.h"


@implementation DashBoardTableViewCell
@synthesize profileTitle;
@synthesize profileDesc;

- (void) clearCell
{
    self.profileTitle   = nil;
    self.profileDesc  = nil;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) dealloc
{
    [self clearCell];
}

@end
