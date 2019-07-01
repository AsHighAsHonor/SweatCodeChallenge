//
//  SCCNavigationController.m
//  SweatCodeChallenge
//
//  Created by Alvin He on 1/7/19.
//  Copyright © 2019 PixelForce Systems. All rights reserved.
//

#import "SCCNavigationController.h"

@interface SCCNavigationController ()

@end

@implementation SCCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setProperties];
}

- (void)setProperties {
    self.navigationBar.translucent = false;
    self.navigationBar.barTintColor = [UIColor whiteColor];
}

@end
