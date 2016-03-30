//
//  TableViewCell.m
//  Demo
//
//  Created by 温敬亮 on 16/3/30.
//  Copyright © 2016年 expai. All rights reserved.
//

#import "TableViewCell.h"
#import "SSAutoresizeLabelFlowConfig.h"
#import "SSAutoresizeLabelFlow.h"

@interface TableViewCell ()
@property(nonatomic,weak) SSAutoresizeLabelFlow *flow;

@end

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
    SSAutoresizeLabelFlowConfig *config = [SSAutoresizeLabelFlowConfig shareConfig];
    config.backgroundColor = [UIColor lightGrayColor];
    config.textFont = [UIFont fontWithName:@"Times New Roman" size:15];
    NSArray *array = @[@"Adele",@"Alicia Keys",@"Ariana Grande",@"Avril Lavigne",@"Beyoncé",@"Britney Spears",@"Celine Dion",@"Katy Perry",@"Rihanna"];
    SSAutoresizeLabelFlow *flow = [[SSAutoresizeLabelFlow alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-20, 100) titles:array selectedHandler:^(NSUInteger index, NSString *title) {
        NSLog(@"%lu %@",index,title);
    }];
    [self.contentView addSubview:flow];
    self.flow = flow;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
//    [self.flow reloadAllWithTitles:@[@"Adele",@"Alicia Keys",@"Ariana Grande",@"Avril Lavigne",@"Beyoncé",@"Britney Spears",@"Celine Dion",@"Katy Perry",@"Rihanna"]];
    CGRect f = self.flow.frame;
    f.size.width = [UIScreen mainScreen].bounds.size.width-20;
    f.origin.x = 10;
    self.flow.frame = f;
}

- (void)setItem:(TableCellItem *)item
{
    _item = item;
    NSLog(@"item.titles:%@",item.titles);
    [self.flow reloadAllWithTitles:item.titles];
    [self layoutIfNeeded];
    NSLog(@"frame:%@",NSStringFromCGRect(self.flow.frame) );
    _item.cellHeight = self.flow.frame.size.height + 20;
}

@end
