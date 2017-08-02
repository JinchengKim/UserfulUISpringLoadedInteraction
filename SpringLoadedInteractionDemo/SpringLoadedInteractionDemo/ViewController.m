//
//  ViewController.m
//  SpringLoadedInteractionDemo
//
//  Created by 李金 on 2017/8/2.
//  Copyright © 2017年 kingandyoga. All rights reserved.
//

#import "ViewController.h"
#import "UIView+SpringLoading.h"
#import "TabBarViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonItem;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableViewCell *tableViewCell;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISwitch *switchBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self openSpring];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)openSpring{
    self.barButtonItem.springLoaded = YES;
    
    [self.stepper setCanSpringLoaded:YES];
    [self.stepper setHandleViewActivationBlock:^{
        NSLog(@"click stepper");
    }];
    
    [self.segmentedControl setCanSpringLoaded:YES];
    [self.segmentedControl setHandleViewActivationBlock:^{
        NSLog(@"click segmentedControl");
    }];
    
    [self.textField setCanSpringLoaded:YES];
    [self.textField setHandleViewActivationBlock:^{
        NSLog(@"click textField");
    }];
    
    [self.tableViewCell setCanSpringLoaded:YES];
    [self.tableViewCell setHandleViewActivationBlock:^{
        NSLog(@"click tableViewCell");
    }];
    
    [self.stepper setCanSpringLoaded:YES];
    [self.stepper setHandleViewActivationBlock:^{
        NSLog(@"click stepper");
    }];
    
    [self.label setCanSpringLoaded:YES];
    [self.label setHandleViewActivationBlock:^{
        NSLog(@"click label");
    }];
    
    [self.button setCanSpringLoaded:YES];
    [self.button setHandleViewActivationBlock:^{
        NSLog(@"click button");
    }];
    
    [self.imageView setCanSpringLoaded:YES];
    [self.imageView setHandleViewActivationBlock:^{
        NSLog(@"click imageView");
    }];
    
    TabBarViewController *tabVC = (TabBarViewController *)self.tabBarController;
    [tabVC.tabBar setCanSpringLoaded:YES];
    [tabVC.tabBar setHandleViewActivationBlock:^{
        NSLog(@"click UITabBar");
    }];
}

- (void)closeSpring{
    self.barButtonItem.springLoaded = NO;
    
    [self.stepper setCanSpringLoaded:NO];
    
    [self.segmentedControl setCanSpringLoaded:NO];
    
    [self.textField setCanSpringLoaded:NO];
    
    [self.tableViewCell setCanSpringLoaded:NO];

    [self.stepper setCanSpringLoaded:NO];

    [self.label setCanSpringLoaded:NO];
    
    [self.button setCanSpringLoaded:NO];

    [self.imageView setCanSpringLoaded:NO];

    TabBarViewController *tabVC = (TabBarViewController *)self.tabBarController;
    [tabVC.tabBar setCanSpringLoaded:NO];
}

- (IBAction)clickSwitchBtn:(id)sender {
    if(self.switchBtn.on == YES){
        [self openSpring];
    }else{
        [self closeSpring];
    }
}


@end
