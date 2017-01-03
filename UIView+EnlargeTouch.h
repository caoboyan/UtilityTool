//
//  UIView+EnlargeTouch.h
//  SDHitTest
//
//  Created by pub on 17/1/3.
//  Copyright © 2017年 pub. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIView (EnlargeTouch)

- (void) setEnlargeEdge:(CGFloat)edge;

- (void) setEnlargeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

@end
