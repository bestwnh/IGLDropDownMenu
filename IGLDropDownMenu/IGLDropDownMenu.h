//
//  IGLDropDownMenu.h
//  IGLDropDownMenuDemo
//
//  Created by Galvin Li on 8/30/14.
//  Copyright (c) 2014 Galvin Li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IGLDropDownItem.h"

typedef NS_ENUM(NSUInteger, IGLDropDownMenuRotate) {
    IGLDropDownMenuRotateNone,
    IGLDropDownMenuRotateLeft,
    IGLDropDownMenuRotateRight,
    IGLDropDownMenuRotateRandom
};

typedef NS_ENUM(NSUInteger, IGLDropDownMenuType) {
    IGLDropDownMenuTypeNormal,
    IGLDropDownMenuTypeStack,
    IGLDropDownMenuTypeSlidingInBoth,
    IGLDropDownMenuTypeSlidingInFromLeft,
    IGLDropDownMenuTypeSlidingInFromRight
};

@protocol IGLDropDownMenuDelegate <NSObject>

- (void)selectedItemAtIndex:(NSInteger)index;

@end

@interface IGLDropDownMenu : UIControl

@property (nonatomic, strong, readonly) IGLDropDownItem *menuButton;
@property (nonatomic, copy) NSString* menuText;
@property (nonatomic, strong) UIImage *menuIconImage;
@property (nonatomic, copy) NSArray* dropDownItems;
@property (nonatomic, assign) CGSize itemSize;
@property (nonatomic, assign, readonly) NSInteger selectedIndex;

@property (nonatomic, assign) CGFloat paddingLeft;

@property (nonatomic, assign) CGFloat animationDuration;
@property (nonatomic, assign) UIViewAnimationOptions animationOption;
@property (nonatomic, assign) CGFloat itemAnimationDelay;
@property (nonatomic, assign) IGLDropDownMenuRotate rotate;
@property (nonatomic, assign) IGLDropDownMenuType type;
@property (nonatomic, assign) CGFloat slidingInOffset;
@property (nonatomic, assign) CGFloat gutterY;
@property (nonatomic, assign) CGFloat alphaOnFold;
@property (nonatomic, assign, getter = isExpanding) BOOL expanding;
@property (nonatomic, assign, getter = shouldFlipWhenToggleView) BOOL flipWhenToggleView;

@property (nonatomic, assign) id<IGLDropDownMenuDelegate> delegate;


- (void)reloadView;
- (void)resetParams;

@end
