//
//  SKViewController.m
//  Score Keeper
//
//  Created by Christian Monson on 2/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "SKScoreViewController.h"

static CGFloat heightForView = 40;
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

- (void)addScoreView:(int)index {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, heightForView)];
    UITextField *name = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width / 3 , heightForView)];
    name.placeholder = @"name";
    UILabel *score = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 3, 0, self.view.frame.size.width / 3, heightForView)];
    UIStepper *button = [[UIStepper alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 3 *2, 0, self.view.frame.size.width / 3, heightForView)];
    button.minimumValue = 0;
    button.maximumValue = 1000;
    [view addSubview:name];
    [view addSubview:score];
    [view addSubview:button];
    
    [self.scrollView addSubview:view];
    
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
