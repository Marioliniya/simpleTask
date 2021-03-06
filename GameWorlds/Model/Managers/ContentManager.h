//
//  ContentManager.h
//  GameWorlds
//
//  Created by Admin on 3/5/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContentManager : NSObject

@property (strong, nonatomic) NSArray* content;

+ (ContentManager*)shareManager;
- (void)getContentWithCompletion:(void(^)(BOOL success, NSArray* worlds, NSError* error))completion;

@end
