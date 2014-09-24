//
//  GK_CanvasView.h
//  RoamTouch
//
//  Created by FDV Solutions on 7/26/13.
//  Copyright (c) 2013 Julio Andrés Carrettoni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GK_CanvasView : UIView
- (void) touchEvent:(NSInteger) pointID beganFromPoint:(CGPoint) point;
- (void) touchEvent:(NSInteger) pointID movedToPoint:(CGPoint) point;
- (void) touchEvent:(NSInteger) pointID endedAtPoint:(CGPoint) point;

@property (nonatomic, retain) UIColor *lineColor;
@property (nonatomic, assign) CGFloat lineSize;

@end
