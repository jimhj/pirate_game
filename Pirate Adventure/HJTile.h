//
//  HJTile.h
//  Pirate Adventure
//
//  Created by Jimmy Huang on 14-3-17.
//  Copyright (c) 2014年 Jimmy Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HJWeapon.h"
#import "HJArmor.h"
#import "HJBoss.h"

@interface HJTile : NSObject

@property (strong, nonatomic) NSString *stroy;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) NSString *actionButtonName;
@property (strong, nonatomic) HJWeapon *weapon;
@property (strong, nonatomic) HJArmor *armor;
@property (strong, nonatomic) HJBoss *boss;
@property (nonatomic) int healthEffect;

@end
