//
//  IGLDropDownItem.h
//  IGLDropDownMenuDemo
//
//  Created by Galvin Li on 8/30/14.
//  Copyright (c) 2014 Galvin Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IGLDropDownItem : UIControl

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) id object;

@property (nonatomic, strong, readonly) UIView *customView;

@property (nonatomic, strong) UIImage *iconImage;
@property (nonatomic, strong, readonly) UILabel *textLabel;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) BOOL showBackgroundShadow;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, assign) CGFloat paddingLeft;

- (instancetype)initWithCustomView:(UIView*)customView;

@end
