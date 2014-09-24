//
//  FloatingWindow.h
//
//  Created by Julio Carrettoni on 11/18/11.
//  Copyright 2011 FDV Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GestureKit.h"
#import "GK_CanvasView.h"

@interface GK_FloatingWindow : UIWindow  <GK_VisorProtocol, GK_HelpVisor, UICollectionViewDataSource, UICollectionViewDelegate>{
    
    IBOutlet GK_CanvasView *canvasForDrawing;
    
    IBOutlet UIView *helpView;
    IBOutlet UICollectionView *helpCollectionView;
    IBOutlet UIImageView *gkLogoImageView;
}

+ (GK_FloatingWindow*) showFloatingView;

@property (nonatomic, retain) UIColor* masterTintColor;
@property (nonatomic, assign) CGPoint pos;

@property (nonatomic, retain) IBOutlet GK_CanvasView *canvasForDrawing;
@property (nonatomic, retain) IBOutlet UIView *helpView;
@property (nonatomic, retain) IBOutlet UICollectionView *helpCollectionView;
@property (nonatomic, retain) IBOutlet UIImageView *gkLogoImageView;

- (void) showHelpView;
- (void) hideHelpView;

- (void) showStaticLogo;
- (void) showErrorLogo;
- (void) showLoadingLogo;

- (void) setGesturesArrayForHelp:(NSArray*) array;


@end
