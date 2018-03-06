//
//  GameWorld.h
//  GameWorlds
//
//  Created by Admin on 3/5/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameWorld : NSObject

@property (strong, nonatomic) NSString* id;
@property (strong, nonatomic) NSString* name;

- (id)initWithServerResponse:(NSDictionary*)responseObject;

@end
