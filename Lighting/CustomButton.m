//
//  CustomButton.m
//  Lighting
//
//  Created by huazi on 15-5-12.
//  Copyright (c) 2015年 xiaoningLi. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateSelected];
        self.selected = NO;
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    }
    return self;
}

@end
