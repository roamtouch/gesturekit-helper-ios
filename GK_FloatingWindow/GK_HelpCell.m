//
//  GK_HelpCell.m
//  RoamTouch
//
//  Created by Julio Andrés Carrettoni on 22/08/13.
//  Copyright (c) 2013 Julio Andrés Carrettoni. All rights reserved.
//

#import "GK_HelpCell.h"

@implementation GK_HelpCell {
    IBOutlet UIImageView *gestureImage;
    IBOutlet UILabel *gestureName;
    IBOutlet UILabel *gestureDescription;
}

- (void) setData:(NSDictionary*) data {
    gestureName.text = data[@"name"];
    gestureDescription.text = data[@"description"];
    gestureImage.image = data[@"img"];
    
    [self addSubview:gestureImage];
    [gestureDescription removeFromSuperview];
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

-(void) initialize {
    gestureImage = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height)];
    gestureImage.alpha = 1.000;
    gestureImage.autoresizesSubviews = YES;
    gestureImage.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    gestureImage.clearsContextBeforeDrawing = YES;
    gestureImage.clipsToBounds = YES;
    gestureImage.contentMode = UIViewContentModeScaleAspectFit;
    gestureImage.hidden = NO;
    gestureImage.highlighted = NO;
    gestureImage.multipleTouchEnabled = NO;
    gestureImage.opaque = YES;
    gestureImage.userInteractionEnabled = NO;
    
    gestureDescription = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height)];
    gestureDescription.alpha = 1.000;
    gestureDescription.autoresizesSubviews = YES;
    gestureDescription.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    gestureDescription.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    gestureDescription.clearsContextBeforeDrawing = YES;
    gestureDescription.clipsToBounds = YES;
    gestureDescription.contentMode = UIViewContentModeLeft;
    gestureDescription.enabled = YES;
    gestureDescription.hidden = NO;
    gestureDescription.multipleTouchEnabled = NO;
    gestureDescription.numberOfLines = 0;
    gestureDescription.opaque = NO;
    gestureDescription.shadowOffset = CGSizeMake(0.0, 0.0);
    gestureDescription.text = @"";
    gestureDescription.textAlignment = NSTextAlignmentCenter;
    gestureDescription.textColor = [UIColor whiteColor];
    gestureDescription.userInteractionEnabled = NO;
    gestureDescription.font = [UIFont systemFontOfSize:15.0];
    gestureDescription.minimumScaleFactor = 0.1;
    gestureDescription.adjustsFontSizeToFitWidth = NO;
    gestureDescription.backgroundColor = [UIColor clearColor];
    
    [self addSubview:gestureImage];
    
    self.layer.masksToBounds = YES;
}

- (void) toggleGestureDescription {
    UIView* fromView = gestureImage;
    UIView* toView = gestureDescription;
    if (gestureDescription.superview != nil) {
        fromView = gestureDescription;
        toView = gestureImage;
    }
    
    [UIView transitionFromView:fromView
                        toView:toView
                      duration:0.35
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    completion:^(BOOL finished) {
                        
                    }];
}

@end
