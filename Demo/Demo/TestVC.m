//
//  TestVC.m
//  Demo
//
//  Created by 温敬亮 on 16/3/30.
//  Copyright © 2016年 expai. All rights reserved.
//

#import "TestVC.h"
#import "TableViewCell.h"
#import "TableCellItem.h"

@interface TestVC () <UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,copy) NSArray *dataList;

@end

@implementation TestVC




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  ((TableCellItem *)self.dataList[indexPath.row]).cellHeight;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return self.dataList.count;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *ID = @"TableViewCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:nil options:nil] lastObject];
    }
    
    cell.item = self.dataList[indexPath.row];
    return cell;
    
}

- (NSArray *)dataList
{
    if (!_dataList) {
        
        TableCellItem *item = [[TableCellItem alloc]init];
        item.titles = @[@"AAAAAAAAA",@"AAAA",@"AAA",@"aaaaaaaaaa",@"a",@"aaaaaaaaaaaa"];
        
        TableCellItem *item2 = [[TableCellItem alloc]init];
        item2.titles = @[@"bb",@"aaffafadsfadsfasdf",@"asdfas",@"bb",@"bbbbbbb",@"adf",@"bb",@"aaffafadsfadsfasdf",@"asdfas",@"bb",@"bbbbbbb",@"adf",@"bb",@"aaffafadsfadsfasdf",@"asdfas",@"bb",@"bbbbbbb",@"adf"];
        
        TableCellItem *item3 = [[TableCellItem alloc]init];
        item3.titles = @[@"c",@"AAAA",@"AAA",@"aaaaaaaaaa",@"a",@"cc"];
        
        TableCellItem *item4 = [[TableCellItem alloc]init];
        item4.titles = @[@"dd",@"AAAA",@"AAA",@"aaaaaaaaaa",@"a",@"aaaaaaaaaaaa"];
        
        TableCellItem *item5 = [[TableCellItem alloc]init];
        item5.titles = @[@"fffff",@"AAAA",@"AAA",@"eeee",@"a",@"aaaaaaaaaaaa",@"fffff",@"AAAA",@"AAA",@"eeee",@"a",@"aaaaaaaaaaaa",
                         @"fffff",@"AAAA",@"AAA",@"eeee",@"a",@"aaaaaaaaaaaa",
                         @"fffff",@"AAAA",@"AAA",@"eeee",@"a",@"aaaaaaaaaaaa",@"fffff",@"AAAA",@"AAA",@"eeee",@"a",@"aaaaaaaaaaaa"];
        _dataList = @[item,item2,item3,item4,item5];
    }
    
    return  _dataList;
}

@end
