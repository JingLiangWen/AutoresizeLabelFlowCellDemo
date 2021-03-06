//
//  DemoViewController.m
//  Demo
//
//  Created by Mrss on 16/1/25.
//  Copyright © 2016年 expai. All rights reserved.
//

#import "DemoViewController.h"
#import "SSAutoresizeLabelFlow.h"
#import "SSAutoresizeLabelFlowConfig.h"
#import "TestVC.h"

@interface DemoViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *animatedSwitch;
@property (nonatomic,strong) SSAutoresizeLabelFlow *flow;

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    SSAutoresizeLabelFlowConfig *config = [SSAutoresizeLabelFlowConfig shareConfig];
    config.backgroundColor = [UIColor lightGrayColor];
    config.textFont = [UIFont fontWithName:@"Times New Roman" size:15];
    NSArray *array = @[@"Adele",@"Alicia Keys",@"Ariana Grande",@"Avril Lavigne",@"Beyoncé",@"Britney Spears",@"Celine Dion",@"Katy Perry",@"Rihanna"];
    self.flow = [[SSAutoresizeLabelFlow alloc]initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width-20, 0) titles:array selectedHandler:^(NSUInteger index, NSString *title) {
        NSLog(@"%lu %@",index,title);
    }];
    [self.view addSubview:self.flow];
}

- (IBAction)insert:(id)sender {
    [self.flow insertLabelWithTitle:@"Taylor Swift" atIndex:1 animated:self.animatedSwitch.isOn];
}

- (IBAction)delete:(id)sender {
    [self.flow deleteLabelAtIndex:1 animated:self.animatedSwitch.isOn];
}

- (IBAction)reload:(id)sender {
    NSArray *array = @[@"Akon",@"Bob Dylan",@"Chris Brown",@"Eminem",@"James Blunt",@"Jason Mraz",@"Jay-Z",@"John Lennon",@"Justin Timberlake",@"Robbie Williams",@"Sam Smith",@"Usher",@"Justin Bieber"];
    [self.flow reloadAllWithTitles:array];
}

- (IBAction)batchInsert:(id)sender {
    NSMutableIndexSet *set = [NSMutableIndexSet indexSet];
    [set addIndex:1];
    [set addIndex:3];
    [self.flow insertLabelsWithTitles:@[@"Taylor Swift",@"Lana Del Rey"] atIndexes:set animated:self.animatedSwitch.isOn];

}

- (IBAction)batchDelete:(id)sender {
    NSMutableIndexSet *set = [NSMutableIndexSet indexSet];
    [set addIndex:0];
    [set addIndex:2];
    [self.flow deleteLabelsAtIndexes:set animated:self.animatedSwitch.isOn];
}

- (IBAction)test:(id)sender {
    TestVC *vc = [[TestVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
