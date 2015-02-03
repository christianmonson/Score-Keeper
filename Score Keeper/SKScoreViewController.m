//
//  SKViewController.m
//  Score Keeper
//
//  Created by Christian Monson on 2/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "SKScoreViewController.h"

@interface SKViewController ()

@property (nonatomic, weak) UIScrollView *scrollView;

@end

@implementation SKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    [self.view addSubview:scrollView];
    UINavigationItem *navItem = self.navigationItem;
    navItem.title = @"Score Keeper";
    self.scrollView = scrollView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
