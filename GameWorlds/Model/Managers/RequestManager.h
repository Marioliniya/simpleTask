//
//  RequestManager.h
//  GameWorlds
//
//  Created by Admin on 3/5/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AuthManager;

@interface RequestManager : NSObject

+ (RequestManager*)sharedManager;

- (void)getGameWorldsWithLogin:(NSString*)login password:(NSString*)password
                  onCompletion:(void(^)(BOOL success, NSArray* worlds, NSError* error))completion;


@end
