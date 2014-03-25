//
//  HJFactory.h
//  Pirate Adventure
//
//  Created by Jimmy Huang on 14-3-19.
//  Copyright (c) 2014年 Jimmy Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HJCharacter.h"
#import "HJBoss.h"

@interface HJFactory : NSObject

//@property (nonatomic, strong) NSString *story;

- (NSArray *) tiles;
- (HJCharacter *)character;
- (HJBoss *)boss;

@end
