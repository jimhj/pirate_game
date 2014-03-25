//
//  HJFactory.m
//  Pirate Adventure
//
//  Created by Jimmy Huang on 14-3-19.
//  Copyright (c) 2014年 Jimmy Huang. All rights reserved.
//

#import "HJFactory.h"
#import "HJTile.h"

@implementation HJFactory

- (NSArray *)tiles
{
    HJTile *tile1 = [[HJTile alloc] init];
    tile1.stroy = @"Captain, we need a fearless leader such as yourself to undertake a voyaga.You just stop the evil pirate Boss. Would you like a blunted sword to get started?";
    tile1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    HJWeapon *bluntedSword = [[HJWeapon alloc] init];
    bluntedSword.name = @"Blunted Sword";
    bluntedSword.damage = 12;
    tile1.weapon = bluntedSword;
    tile1.actionButtonName = @"Take the sword";
    
    HJTile *tile2 = [[HJTile alloc] init];
    tile2.stroy = @"You have come across an armory. Would you like to upgrade your armor to steel armor?";
    tile2.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    HJArmor *steelArmor = [[HJArmor alloc] init];
    steelArmor.name = @"Steel armor";
    steelArmor.health = 8;
    tile2.armor = steelArmor;
    tile2.actionButtonName = @"Take steel armor";
    
    HJTile *tile3 = [[HJTile alloc] init];
    tile3.stroy = @"A mysterious dock appears to the horizon. Should we stop and ask the directions?";
    tile3.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile3.healthEffect = 17;
    tile3.actionButtonName = @"Stop at the dock";
    
    NSMutableArray *firstColumn = [[NSMutableArray alloc] init];
    [firstColumn addObject:tile1];
    [firstColumn addObject:tile2];
    [firstColumn addObject:tile3];
    
    HJTile *tile4 = [[HJTile alloc] init];
    tile4.stroy = @"You have found a parrot. This can be used in your armor slot. Parrots are a great defender and are fiercely loyal to their captain!";
    tile4.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    HJArmor *parrotArmor = [[HJArmor alloc] init];
    parrotArmor.health = 20;
    parrotArmor.name = @"Parrot";
    tile4.armor = parrotArmor;
    tile4.actionButtonName = @"Adopt parrot";
    
    HJTile *tile5 = [[HJTile alloc] init];
    tile5.stroy = @"You have stumbled upon a cache of pirate weapons. Would you like to upgrade your to a pistol?";
    tile5.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    HJWeapon *pistol = [[HJWeapon alloc] init];
    pistol.damage = 17;
    pistol.name = @"Pistol";
    tile5.weapon = pistol;
    tile5.actionButtonName = @"Take pistol";
    
    HJTile *tile6 = [[HJTile alloc] init];
    tile6.stroy = @"You have been captured by pirates and are order to walk the plank.";
    tile6.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile6.healthEffect = -22;
    tile6.actionButtonName = @"Show no fear!";
    
    NSMutableArray *secondColumn = [[NSMutableArray alloc] init];
    [secondColumn addObject:tile4];
    [secondColumn addObject:tile5];
    [secondColumn addObject:tile6];

    HJTile *tile7 = [[HJTile alloc] init];
    tile7.stroy = @"You have sighted a pirate battle off the coast. Should we intervene?";
    tile7.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile7.healthEffect = 8;
    tile7.actionButtonName = @"Fight those scum";
    
    HJTile *tile8 = [[HJTile alloc] init];
    tile8.stroy = @"The legend of the deep. The mighty kraken appears";
    tile8.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile8.healthEffect = -46;
    tile8.actionButtonName = @"Abandon ship";
    
    HJTile *tile9 = [[HJTile alloc] init];
    tile9.stroy = @"You have stumbled upon a hide cave of pirate treasurer";
    tile9.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile9.healthEffect = 20;
    tile9.actionButtonName = @"Take treasurer";
    
    NSMutableArray *thirdColumn = [[NSMutableArray alloc] init];
    [thirdColumn addObject:tile7];
    [thirdColumn addObject:tile8];
    [thirdColumn addObject:tile9];

    HJTile *tile10 = [[HJTile alloc] init];
    tile10.stroy = @"A group of pirates attemps to board your ship";
    tile10.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile10.healthEffect = 15;
    tile10.actionButtonName = @"Repel the invaders";
    
    HJTile *tile11 = [[HJTile alloc] init];
    tile11.stroy = @"In the deep of the sea many things live and manythings can be found. Will the fortune bring help or ruin?";
    tile11.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile11.healthEffect = -7;
    tile11.actionButtonName = @"Swim deeper";
    
    HJTile *tile12 = [[HJTile alloc] init];
    tile12.stroy = @"You final faceoff with the fearsome pirate Boss";
    tile12.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile12.healthEffect = -15;
    tile12.actionButtonName = @"Fight!";
//    tile12.boss = [self boss];
    
    NSMutableArray *fourthColumn = [[NSMutableArray alloc] init];
    [fourthColumn addObject:tile10];
    [fourthColumn addObject:tile11];
    [fourthColumn addObject:tile12];
    
    NSArray *tiles = [[NSArray alloc] initWithObjects:firstColumn, secondColumn, thirdColumn, fourthColumn, nil];
    
    return tiles;
}   

- (HJCharacter *)character
{
    HJCharacter *character = [[HJCharacter alloc] init];
    character.health = 100;
    
    HJArmor *armor = [[HJArmor alloc] init];
    armor.name = @"Cloak";
    armor.health = 5;
    character.armor = armor;
    
    HJWeapon *weapon = [[HJWeapon alloc] init];
    weapon.name = @"Fists";
    weapon.damage = 10;
    character.weapon = weapon;
    
    return character;
}

- (HJBoss *)boss
{
    HJBoss *boss = [[HJBoss alloc] init];
    boss.health = 65;
    return boss;
}

@end




