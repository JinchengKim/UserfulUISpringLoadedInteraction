//
//  UIView+SpringLoading.m
//  DragAndDropDemo
//
//  Created by 李金 on 2017/8/2.
//  Copyright © 2017年 kingandyoga. All rights reserved.
//

#import "UIView+SpringLoading.h"
#import <objc/runtime.h>

static void *kSpringLoadedInteraction;
static void *kCanSpringLoaded;
static void *kHandelViewActivationBlock;
@implementation UIView (SpringLoading)
- (void)addSpringLoadingInteraction{
    if ([self getCanSpringLoaded]) {
        if (![self.interactions containsObject:[self getSpringLoadedInteraction]]) {
            self.userInteractionEnabled = YES;
            [self addInteraction:[self getSpringLoadedInteraction]];
        }
   }
}

- (void)removeSpringLoadingInteraction{
    [self removeInteraction:[self getSpringLoadedInteraction]];
}

#pragma mark - @Getter & Setter
- (UISpringLoadedInteraction *)getSpringLoadedInteraction{
    UISpringLoadedInteraction *springInteraction = objc_getAssociatedObject(self, &kSpringLoadedInteraction);
    if (springInteraction == nil) {
        __weak __typeof(self) weakSelf = self;
        springInteraction = [[UISpringLoadedInteraction alloc] initWithActivationHandler:^(UISpringLoadedInteraction * _Nonnull interaction, id<UISpringLoadedInteractionContext>  _Nonnull context) {
            HandleViewActivationBlock block = [weakSelf getHandleViewActivationBlock];
            if (block) {
                block();
            }
        }];
    }
    return springInteraction;
}

- (void)setSpringLoadedInteraction:(UISpringLoadedInteraction *)springLoadedInteraction{
    objc_setAssociatedObject(self, &kSpringLoadedInteraction, springLoadedInteraction, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)getCanSpringLoaded{
    NSNumber *getCanSpringLoaded = objc_getAssociatedObject(self, &kCanSpringLoaded);
    if (getCanSpringLoaded == nil) {
        getCanSpringLoaded = [NSNumber numberWithBool:YES];
        objc_setAssociatedObject(self, &kCanSpringLoaded, getCanSpringLoaded, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return [getCanSpringLoaded boolValue];
}

- (void)setCanSpringLoaded:(BOOL)canSpringLoaded{
    objc_setAssociatedObject(self, &kCanSpringLoaded, [NSNumber numberWithBool:canSpringLoaded], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HandleViewActivationBlock)getHandleViewActivationBlock{
    return objc_getAssociatedObject(self, &kHandelViewActivationBlock);
}

- (void)setHandleViewActivationBlock:(HandleViewActivationBlock )block{
    objc_setAssociatedObject(self, &kHandelViewActivationBlock, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
