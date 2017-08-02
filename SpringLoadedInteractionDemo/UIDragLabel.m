//
//  UIDragLabel.m
//  DragAndDropCategoryDemo
//
//  Created by 李金 on 2017/7/29.
//  Copyright © 2017年 kingandyoga. All rights reserved.
//

#import "UIDragLabel.h"
#import <MobileCoreServices/MobileCoreServices.h>

@implementation UIDragLabel
- (instancetype)init{
    self = [super init];
    if (self){
        [self addDragInteraction];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self addDragInteraction];
}

- (void)addDragInteraction{
    UIDragInteraction *dragInteraction = [[UIDragInteraction alloc] initWithDelegate:self];
    dragInteraction.enabled = YES;
    dragInteraction.allowsSimultaneousRecognitionDuringLift = YES;
    self.userInteractionEnabled = YES;
    [self addInteraction:dragInteraction];
}

#pragma mark - @Item Manager
- (NSArray<UIDragItem *> *)createDragItemsForInteraction:(UIDragInteraction *)interaction session:(id<UIDragSession>)session{
    NSItemProvider *provider = [[NSItemProvider alloc] init];
    NSString *content;
    if (self.attributedText) {
        content = [self.attributedText string];
    }else{
        content = self.text;
    }
    for (UIDragItem *item in session.items) {
        if ([item.localObject isEqualToString:content]) {
            return nil;
        }
    }
    if (content){
        [provider registerItemForTypeIdentifier:(NSString *)kUTTypePlainText loadHandler:^(NSItemProviderCompletionHandler  _Null_unspecified completionHandler, Class  _Null_unspecified __unsafe_unretained expectedValueClass, NSDictionary * _Null_unspecified options) {
            completionHandler(self.attributedText,nil);
        }];
    }else{
        return nil;
    }
    UIDragItem *dragItem = [[UIDragItem alloc] initWithItemProvider:provider];
    dragItem.localObject = content;
    return @[dragItem];
}


#pragma mark - @Delegate UIDragInteractionDelegate
#pragma mark - @Overwrite
- (NSArray<UIDragItem *> *)dragInteraction:(UIDragInteraction *)interaction itemsForBeginningSession:(id<UIDragSession>)session{
    
    return [self createDragItemsForInteraction:interaction session:session];
}

- (void)dragInteraction:(UIDragInteraction *)interaction sessionDidMove:(id<UIDragSession>)session{
    
}

- (void)dragInteraction:(UIDragInteraction *)interaction sessionWillBegin:(id<UIDragSession>)session{
    
}

- (void)dragInteraction:(UIDragInteraction *)interaction sessionDidTransferItems:(id<UIDragSession>)session{
    
}

- (BOOL)dragInteraction:(UIDragInteraction *)interaction sessionAllowsMoveOperation:(id<UIDragSession>)session{
    return YES;
}

- (void)dragInteraction:(UIDragInteraction *)interaction session:(id<UIDragSession>)session didEndWithOperation:(UIDropOperation)operation{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 1;
    }];
}

- (UITargetedDragPreview *)dragInteraction:(UIDragInteraction *)interaction previewForLiftingItem:(UIDragItem *)item session:(id<UIDragSession>)session{
    UILabel *label = [[UILabel alloc] init];
    label.text = self.attributedText ? [self.attributedText string] : self.text;
    label.textAlignment = NSTextAlignmentCenter;
    CGFloat width = self.frame.size.width < [[UIScreen mainScreen] bounds].size.width/2? [[UIScreen mainScreen] bounds].size.width/2: self.frame.size.width;
    CGFloat height = self.frame.size.height < 35 ? 35 : self.frame.size.height;

    label.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, height);
    
    label.layer.cornerRadius = 10;
    UIDragPreviewTarget *target = [[UIDragPreviewTarget alloc] initWithContainer:self.superview center:self.center];
    
    return [[UITargetedDragPreview alloc] initWithView:label parameters:[UIDragPreviewParameters new] target:target];
}

- (BOOL)dragInteraction:(UIDragInteraction *)interaction prefersFullSizePreviewsForSession:(id<UIDragSession>)session{
    return NO;
}

- (void)dragInteraction:(UIDragInteraction *)interaction item:(UIDragItem *)item willAnimateCancelWithAnimator:(id<UIDragAnimating>)animator{
    [animator addAnimations:^{
        self.alpha = 1;
    }];
}

- (void)dragInteraction:(UIDragInteraction *)interaction session:(id<UIDragSession>)session willAddItems:(NSArray<UIDragItem *> *)items forInteraction:(UIDragInteraction *)addingInteraction{
    
}

- (void)dragInteraction:(UIDragInteraction *)interaction willAnimateLiftWithAnimator:(id<UIDragAnimating>)animator session:(id<UIDragSession>)session{
    [animator addAnimations:^{
        self.alpha = 0.5;
    }];
}

- (UITargetedDragPreview *)dragInteraction:(UIDragInteraction *)interaction previewForCancellingItem:(UIDragItem *)item withDefault:(UITargetedDragPreview *)defaultPreview{
    return defaultPreview;
}

- (id<UIDragSession>)dragInteraction:(UIDragInteraction *)interaction sessionForAddingItems:(NSArray<id<UIDragSession>> *)sessions withTouchAtPoint:(CGPoint)point{
    return nil;
}

- (NSArray<UIDragItem *> *)dragInteraction:(UIDragInteraction *)interaction itemsForAddingToSession:(id<UIDragSession>)session withTouchAtPoint:(CGPoint)point{
    return [self createDragItemsForInteraction:interaction session:session];
}

- (BOOL)dragInteraction:(UIDragInteraction *)interaction sessionIsRestrictedToDraggingApplication:(id<UIDragSession>)session{
    return NO;
}

@end
