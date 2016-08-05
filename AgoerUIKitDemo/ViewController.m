//
//  ViewController.m
//  AgoerUIKitDemo
//
//  Created by chanli on 16/8/5.
//  Copyright © 2016年 Beijing ChunFengShiLi Technology Co., Ltd. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+AgoerBlock.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    
    [button addAction:^(UIButton *btn) {
        
        NSLog(@"button Pressed!!!");
        
    } forControlEvent:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
