//
//  UIButton+AgoerBlock.h
//  AgoerUIKitDemo
//
//  Created by chanli on 16/8/5.
//  Copyright © 2016年 Beijing ChunFengShiLi Technology Co., Ltd. All rights
//  reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ButtonBlock)(UIButton *btn);

@interface UIButton (AgoerBlock)

- (void)addAction:(ButtonBlock)block
  forControlEvent:(UIControlEvents)controlEvent;

- (void)removeAllActionForControlEvent:(UIControlEvents)controlEvent;

@end
