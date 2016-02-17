//
//  NetWorkManager.m
//  SalSideDemo
//
//  Created by Mohanreddy on 17/02/16.
//  Copyright © 2016 Mohanreddy. All rights reserved.
//

#import "NetWorkManager.h"

@implementation NetWorkManager

+ (NetWorkManager*)sharedManager {
    static NetWorkManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}


#pragma mark - Network methods

- (void) getDashBoardItems:(void(^)(id responseObject, id error))completionBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];

    
    NSString *url = @"https://gist.githubusercontent.com/maclir/f715d78b49c3b4b3b77f/raw/8854ab2fe4cbe2a5919cea97d71b714ae5a4838d/items.json";
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSArray class]])
        {
            completionBlock(responseObject, @"Successfully");
            
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock(nil, error.description);
        
    }];

}


@end
