//
//  DashBoardModel.h
//  SalSideDemo
//
//  Created by Mohanreddy on 16/02/16.
//  Copyright © 2016 Mohanreddy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DashBoardModel : NSObject

{
    NSString            *mTitleName;
    NSString            *mImageUrl;
    NSString            *mDesc;
}

@property (strong, nonatomic) NSString            *titleName;
@property (strong, nonatomic) NSString            *imageUrl;
@property (strong, nonatomic) NSString            *desc;


+ (DashBoardModel *)dashBoardDetailsFinderFromDictionary:(NSDictionary *)inBreedDetails;

@end
