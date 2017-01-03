//
//  UIView+EnlargeTouch.m
//  SDHitTest
//
//  Created by pub on 17/1/3.
//  Copyright © 2017年 pub. All rights reserved.
//

#import "UIView+EnlargeTouch.h"
#import <objc/runtime.h>

@implementation UIView (EnlargeTouch)

static char *topKey;
static char *leftKey;
static char *rightKey;
static char *bottomKey;

-(void)setEnlargeEdge:(CGFloat)edge{
    [self setEnlargeWithTop:edge right:edge bottom:edge left:edge];
}

-(void)setEnlargeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left{
    objc_setAssociatedObject(self, &topKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargedRect{
    NSNumber* topEdge = objc_getAssociatedObject(self, &topKey);
    NSNumber* rightEdge = objc_getAssociatedObject(self, &leftKey);
    NSNumber* bottomEdge = objc_getAssociatedObject(self, &rightKey);
    NSNumber* leftEdge = objc_getAssociatedObject(self, &bottomKey);
    if (topEdge && rightEdge && leftEdge && leftEdge) {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue, self.bounds.origin.y - topEdge.floatValue, self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue, self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    }else{
        return self.bounds;
    }
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    CGRect rect = [self enlargedRect];
    return CGRectContainsPoint(rect, point) ? self:nil;
}

@end
