//
//  DashBoardModel.m
//  SalSideDemo
//
//  Created by Mohanreddy on 16/02/16.
//  Copyright © 2016 Mohanreddy. All rights reserved.
//

#import "DashBoardModel.h"

@implementation DashBoardModel

@synthesize titleName   = mTitleName;
@synthesize imageUrl    = mImageUrl;
@synthesize desc        = mDesc;

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


+ (DashBoardModel *)dashBoardDetailsFinderFromDictionary:(NSDictionary *)inDashBoardDetails;
{
    DashBoardModel *details = nil;
    if( inDashBoardDetails && [inDashBoardDetails isKindOfClass:[NSDictionary class]])
    {
        details = [[DashBoardModel alloc] init];
        
        details.titleName   = [inDashBoardDetails objectForKey:@"title"];
        details.imageUrl    = [inDashBoardDetails objectForKey:@"image"];
        details.desc        = [inDashBoardDetails objectForKey:@"description"];
    }
    return details;
}


@end
