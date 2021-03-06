//
//  SSAutoresizeLabelFlowConfig.m
//  SSAutoresizeLabelFlow
//
//  Created by Mrss on 16/1/25.
//  Copyright © 2016年 expai. All rights reserved.
//

#import "SSAutoresizeLabelFlowConfig.h"

@implementation SSAutoresizeLabelFlowConfig


+ (SSAutoresizeLabelFlowConfig *)shareConfig {
    static SSAutoresizeLabelFlowConfig *config;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[self alloc]init];
    });
    return config;
}

// default

- (instancetype)init {
    self = [super init];
    if (self) {
        self.contentInsets = UIEdgeInsetsMake(10, 15, 10, 15);
        self.lineSpace = 10;
        self.itemHeight = 25;
        self.itemSpace = 10;
        self.itemCornerRaius = 3;
        self.itemColor = [UIColor whiteColor];
        self.textMargin = 20;
        self.textColor = [UIColor darkTextColor];
        self.textFont = [UIFont systemFontOfSize:15];
        self.backgroundColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1];
        
    }
    return self;
}
@end
