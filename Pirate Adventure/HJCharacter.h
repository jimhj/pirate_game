//
//  HJCharacter.h
//  Pirate Adventure
//
//  Created by Jimmy Huang on 14-3-21.
//  Copyright (c) 2014年 Jimmy Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HJArmor.h"
#import "HJWeapon.h"

@interface HJCharacter : NSObject

@property (strong, nonatomic) HJArmor *armor;
@property (strong, nonatomic) HJWeapon *weapon;
@property (nonatomic) int damage;
@property (nonatomic) int health;
@end

