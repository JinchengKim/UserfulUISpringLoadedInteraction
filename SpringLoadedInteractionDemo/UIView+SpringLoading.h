//
//  UIView+SpringLoading.h
//  DragAndDropDemo
//
//  Created by 李金 on 2017/8/2.
//  Copyright © 2017年 kingandyoga. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^HandleViewActivationBlock) (void);

@interface UIView (SpringLoading)
- (void)addSpringLoadingInteraction;
- (void)removeSpringLoadingInteraction;
- (void)setHandleViewActivationBlock:(HandleViewActivationBlock )block;
@end
