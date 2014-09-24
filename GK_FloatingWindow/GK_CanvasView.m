//
//  GK_CanvasView.m
//  RoamTouch
//
//  Created by FDV Solutions on 7/26/13.
//  Copyright (c) 2013 Julio Andrés Carrettoni. All rights reserved.
//

#import "GK_CanvasView.h"

#define MAX_NUMBER_OF_TOUCHES 22

@interface GK_CanvasView()

@end

@implementation GK_CanvasView {
    UIBezierPath *pathlines[MAX_NUMBER_OF_TOUCHES];
    BOOL isActive[MAX_NUMBER_OF_TOUCHES];
    CGPoint startPoint[MAX_NUMBER_OF_TOUCHES];
    CGPoint endPoint[MAX_NUMBER_OF_TOUCHES];
    
    //http://mobile.tutsplus.com/tutorials/iphone/ios-sdk_freehand-drawing/
}
- (id)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}


-(void)awakeFromNib {
    [super awakeFromNib];
    [self initialize];
}

- (void) initialize {
    for (int i = 0; i < MAX_NUMBER_OF_TOUCHES; i++) {
        pathlines[i] = [UIBezierPath bezierPath];
        [pathlines[i] setLineWidth:2.0];
        isActive[i] = NO;
        self.lineSize = 6.0;
    }
}

- (CGPoint) convertPointToLocalReferenceSystem:(CGPoint) point {
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    CGSize localSize = self.frame.size;
    CGPoint offset;
    if (screenSize.width > screenSize.height) {
        localSize.height = (localSize.width/screenSize.width) * screenSize.height;
        offset.x = 0;
        offset.y = self.frame.size.height/2 - localSize.height/2;
    }
    else {
        localSize.width = (localSize.height/screenSize.height) * screenSize.width;
        offset.y = 0;
        offset.x = self.frame.size.width/2 - localSize.width/2;
    }
    
    point.x = offset.x + (point.x * localSize.width) / screenSize.width;
    point.y = offset.y + (point.y * localSize.height) / screenSize.height;
    return point;
}
- (void) touchEvent:(NSInteger) pointID beganFromPoint:(CGPoint) originalPoint{
    CGPoint point = [self convertPointToLocalReferenceSystem:originalPoint];
    [pathlines[pointID] moveToPoint:point];
    isActive[pointID] = YES;
    startPoint[pointID] = point;
    endPoint[pointID] = point;
    [self setNeedsDisplay];
}
- (void) touchEvent:(NSInteger) pointID movedToPoint:(CGPoint) originalPoint{
    CGPoint point = [self convertPointToLocalReferenceSystem:originalPoint];
    [pathlines[pointID] addLineToPoint:point]; // (4)
    endPoint[pointID] = point;
    [self setNeedsDisplay];
}

- (void) touchEvent:(NSInteger) pointID endedAtPoint:(CGPoint) originalPoint{
    [pathlines[pointID] removeAllPoints];
    isActive[pointID] = NO;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, self.bounds);
    
    [self.backgroundColor setFill];
    CGContextFillRect (context, self.bounds);
    
    [self.lineColor setStroke];
    [self.lineColor setFill];
    
    CGFloat size = self.lineSize;
    
    for (int i = 0; i < MAX_NUMBER_OF_TOUCHES; i++) {
        if (isActive[i]) {
            [pathlines[i] setLineWidth:size/2.0];
            [pathlines[i] stroke];
            
            CGRect borderRect = CGRectMake(startPoint[i].x -(size/2.0), startPoint[i].y - (size/2.0), size, size);
            CGContextFillEllipseInRect (context, borderRect);
            CGContextFillPath(context);
            
            borderRect = CGRectMake(endPoint[i].x -(size/2.0), endPoint[i].y - (size/2.0), size, size);
            CGContextFillEllipseInRect (context, borderRect);
            CGContextFillPath(context);
        }
    }
    //http://www.infragistics.com/community/blogs/torrey-betts/archive/2013/05/28/quick-tip-dividing-a-cgrect-using-cgrectdivide-objective-c.aspx/
}


@end
