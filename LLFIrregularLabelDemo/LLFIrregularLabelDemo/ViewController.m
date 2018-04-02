//
//  ViewController.m
//  LLFIrregularLabelDemo
//
//  Created by Gary-刘林飞 on 2018/4/2.
//  Copyright © 2018年 LiuLinFei. All rights reserved.
//

#import "ViewController.h"
#import "IrregularLabel.h"

@interface ViewController ()

@property (nonatomic, strong) IrregularLabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label = [[IrregularLabel alloc] initWithFrame:CGRectMake(90, 90, 200, 40)];
    [self.view addSubview:self.label];
    self.label.text = @"这是一个不规则label";
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.backgroundColor = [UIColor redColor];
    self.label.textColor = [UIColor whiteColor];
    self.label.font = [UIFont boldSystemFontOfSize:16];
}



@end
