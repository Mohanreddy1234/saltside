//
//  NetWorkManager.h
//  SalSideDemo
//
//  Created by Mohanreddy on 17/02/16.
//  Copyright © 2016 Mohanreddy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkManager : NSObject

+ (NetWorkManager*)sharedManager;

- (void) getDashBoardItems:(void(^)(id responseObject, id error))completionBlock;


@end
