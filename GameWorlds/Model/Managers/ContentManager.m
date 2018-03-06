//
//  ContentManager.m
//  GameWorlds
//
//  Created by Admin on 3/5/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "ContentManager.h"
#import "AuthManager.h"
#import "RequestManager.h"

@implementation ContentManager

#pragma mark - Inicialization

+ (ContentManager*)shareManager{
    
    static ContentManager* sharedManager = nil;
    static dispatch_once_t  oncePredecate;
    
    dispatch_once(&oncePredecate,^{
        sharedManager = [[ContentManager alloc] init];
    });
    return sharedManager;
}

#pragma mark - Content

- (void)getContentWithCompletion:(void(^)(BOOL success, NSArray* worlds, NSError* error))completion{
    
        NSString* login = [AuthManager sharedManager].login;
        NSString* password = [AuthManager sharedManager].password;
        
        [[RequestManager sharedManager] getGameWorldsWithLogin:login password:password onCompletion:^(BOOL success, NSArray *worlds, NSError *error) {
            if (success) {
                [ContentManager shareManager].content = worlds;
            }
            
            if (completion) {
                completion(success, worlds, error);
            }
        }];
}

@end
