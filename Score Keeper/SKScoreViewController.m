//
//  SKViewController.m
//  Score Keeper
//
//  Created by Christian Monson on 2/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "SKScoreViewController.h"

static CGFloat heightForView = 64;
static CGFloat margin = 15;

@interface SKViewController () <UITextFieldDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *scoreLabels;

@end

@implementation SKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64)];
    [self.view addSubview:scrollView];
    UINavigationItem *navItem = self.navigationItem;
    navItem.title = @"Score Keeper";
    self.scrollView = scrollView;
    
    self.scoreLabels = [NSMutableArray new];
    
    for (int i = 0; i < 4; i++) {
        [self addScoreView:i];
    }
}

- (void)addScoreView:(int)index {
    
    CGFloat width = self.view.frame.size.width;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, index * heightForView, width, heightForView)];
    
    UITextField *name = [[UITextField alloc] initWithFrame:CGRectMake(margin, margin, width / 3 , heightForView)];
    name.placeholder = @"name";
    name.delegate = self;
    
    UILabel *score = [[UILabel alloc] initWithFrame:CGRectMake(margin + width / 4, margin, width / 3, heightForView)];
    score.text = [NSString stringWithFormat:@"%d", 0];
    score.textColor = [UIColor magentaColor];
    score.textAlignment = NSTextAlignmentCenter;
    
    [self.scoreLabels addObject:score];
    
    UIStepper *button = [[UIStepper alloc] initWithFrame:CGRectMake(width / 3 * 2, margin + 20, width / 3, heightForView)];
    button.minimumValue = 0;
    button.maximumValue = 1000;
    button.tag = index;
    [button addTarget:self action:@selector(scoreStepper:) forControlEvents:UIControlEventValueChanged];
    
    UIView *dividerLine = [[UIView alloc] initWithFrame:CGRectMake(0, margin + heightForView, width, 3)];
    [dividerLine setBackgroundColor:[UIColor cyanColor]];
    
    [view addSubview:name];
    [view addSubview:score];
    [view addSubview:button];
    [view addSubview:dividerLine];
    
    [self.scrollView addSubview:view];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
    
}

- (void)scoreStepper:(id)sender {
    UIStepper *stepper = sender;
    double stepperValue = stepper.value;
    
    UILabel *label = self.scoreLabels[stepper.tag];
    label.text = [NSString stringWithFormat:@"%d", (int) stepperValue];
    
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
