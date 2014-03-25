//
//  HJViewController.m
//  Pirate Adventure
//
//  Created by Jimmy Huang on 14-3-17.
//  Copyright (c) 2014年 Jimmy Huang. All rights reserved.
//

#import "HJViewController.h"
#import "HJFactory.h"
#import "HJTile.h"

@interface HJViewController ()

@end

@implementation HJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    HJFactory *factory = [[HJFactory alloc] init];
    self.tiles = [factory tiles];
    self.charactor = [factory character];
    self.boss = [factory boss];
    self.currentPoint = CGPointMake(0, 0);
    [self updateCharacterStatsForArmor:self.charactor.armor withWeapon:self.charactor.weapon withHealthEffect:self.charactor.health];
    [self updateTile];
    [self updateButton];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - IBActions

- (IBAction)actionButtonPressed:(UIButton *)sender {
    HJTile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    [self updateCharacterStatsForArmor:tile.armor withWeapon:tile.weapon withHealthEffect:tile.healthEffect];
    if (tile.healthEffect == -15) {
        self.boss.health = self.boss.health - self.charactor.damage;
    }
    
    if (self.charactor.health <= 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Death Message" message:@"You have died please restart the game!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    } else if (self.boss.health <= 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Victory Message" message:@"You have defeated the evil pirate boss!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    [self updateTile];
}

- (IBAction)northButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y + 1);
    [self updateButton];
    [self updateTile];
}

- (IBAction)eastButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    [self updateButton];
    [self updateTile];
}

- (IBAction)southButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    [self updateButton];
    [self updateTile];
}

- (IBAction)westButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    [self updateButton];
    [self updateTile];
}

- (IBAction)resetButtonPressed:(UIButton *)sender
{
    self.charactor = nil;
    self.boss = nil;
    [self viewDidLoad];
}

# pragma mark - helper methods
- (void)updateTile
{
    HJTile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.storyLabel.text = tile.stroy;
    self.backgroundImageView.image = tile.backgroundImage;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.charactor.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.charactor.damage];
    self.armorLabel.text = self.charactor.armor.name;
    self.weaponLabel.text = self.charactor.weapon.name;
    [self.actionButton setTitle:tile.actionButtonName forState:UIControlStateNormal];
}

- (void)updateButton
{
    self.westButton.hidden = [self titlExistsAtPoint:CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)];
    self.eastButton.hidden = [self titlExistsAtPoint:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
    self.northButton.hidden = [self titlExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
    self.southButton.hidden = [self titlExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];
    
}

- (BOOL)titlExistsAtPoint:(CGPoint)point
{
    if (point.x >= 0 && point.y >= 0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count]) {
        return NO;
    } else {
        return YES;
    }
}

- (void)updateCharacterStatsForArmor:(HJArmor *)armor withWeapon:(HJWeapon *)weapon withHealthEffect:(int)healthEffect
{
    if (armor != nil) {
        self.charactor.health = self.charactor.health - self.charactor.armor.health + armor.health;
        self.charactor.armor = armor;
    } else if (weapon != nil) {
        self.charactor.damage = self.charactor.damage - self.charactor.weapon.damage + weapon.damage;
        self.charactor.weapon = weapon;
    } else if (healthEffect != 0) {
        self.charactor.health =  self.charactor.health + healthEffect;
    } else {
        self.charactor.health = self.charactor.health + self.charactor.armor.health;
        self.charactor.damage = self.charactor.damage + self.charactor.weapon.damage;
    }
}

@end
