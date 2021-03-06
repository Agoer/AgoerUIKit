//
//  UIButton+AgoerBlock.m
//  AgoerUIKitDemo
//
//  Created by chanli on 16/8/5.
//  Copyright © 2016年 Beijing ChunFengShiLi Technology Co., Ltd. All rights
//  reserved.
//

#import "UIButton+AgoerBlock.h"
#import <objc/runtime.h>

@implementation UIButton (AgoerBlock)

#pragma mark - Public
- (void)addAction:(ButtonBlock)block
  forControlEvent:(UIControlEvents)controlEvent {
  if (controlEvent <= 1 << 8) {
    NSMutableArray *keyArray = [self actionsArrayForControlEvent:controlEvent];
    [keyArray addObject:block];
    SEL selector = [self selectorForControlEvent:controlEvent];
    [self addTarget:self action:selector forControlEvents:controlEvent];
  }
}

- (void)removeAllActionForControlEvent:(UIControlEvents)controlEvent {
  NSMutableArray *keyArray = [self actionsArrayForControlEvent:controlEvent];
  [keyArray removeAllObjects];
}
#pragma mark - Private
- (SEL)selectorForControlEvent:(UIControlEvents)controlEvent {
  NSString *arrayKey = [self blocksArrayKeyForControlEvent:controlEvent];
  SEL key = NSSelectorFromString(arrayKey);
  return key;
}
- (NSString *)blocksArrayKeyForControlEvent:(UIControlEvents)controlEvent {
  return [NSString
      stringWithFormat:@"tagArrayKey%lu", (unsigned long)controlEvent];
}
- (NSMutableArray *)actionsArrayForControlEvent:(UIControlEvents)controlEvent {
  SEL key = [self selectorForControlEvent:controlEvent];
  NSMutableArray *tags = (NSMutableArray *)objc_getAssociatedObject(self, key);
  if (!tags) {
    tags = [NSMutableArray new];
    objc_setAssociatedObject(self, key, tags,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  }
  return tags;
}

- (void)tagArrayKey0 {
  UIControlEvents event = UIControlEventTouchDown;
  [self excuteBlockForControlEvetn:event];
}
- (void)tagArrayKey2 {
  UIControlEvents event = UIControlEventTouchDownRepeat;
  [self excuteBlockForControlEvetn:event];
}
- (void)tagArrayKey4 {
  UIControlEvents event = UIControlEventTouchDragInside;
  [self excuteBlockForControlEvetn:event];
}
- (void)tagArrayKey8 {
  UIControlEvents event = UIControlEventTouchDragOutside;
  [self excuteBlockForControlEvetn:event];
}
- (void)tagArrayKey16 {
  UIControlEvents event = UIControlEventTouchDragEnter;
  [self excuteBlockForControlEvetn:event];
}
- (void)tagArrayKey32 {
  UIControlEvents event = UIControlEventTouchDragExit;
  [self excuteBlockForControlEvetn:event];
}
- (void)tagArrayKey64 {
  UIControlEvents event = UIControlEventTouchUpInside;
  [self excuteBlockForControlEvetn:event];
}
- (void)tagArrayKey128 {
  UIControlEvents event = UIControlEventTouchUpOutside;
  [self excuteBlockForControlEvetn:event];
}
- (void)tagArrayKey256 {
  UIControlEvents event = UIControlEventTouchCancel;
  [self excuteBlockForControlEvetn:event];
}

- (void)excuteBlockForControlEvetn:(UIControlEvents)controlEvent {
  NSMutableArray *blockArray = [self actionsArrayForControlEvent:controlEvent];
  if (blockArray.count > 0) {
    for (ButtonBlock blockAction in blockArray) {
      if (blockAction) {
        blockAction(self);
      }
    }
  }
}

@end
