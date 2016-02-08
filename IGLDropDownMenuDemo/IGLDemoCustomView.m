//
//  IGLDemoCustomView.m
//  IGLDropDownMenuDemo
//
//  Created by Galvin Li on 2016-02-08.
//  Copyright © 2016 Galvin Li. All rights reserved.
//

#import "IGLDemoCustomView.h"

@interface IGLDemoCustomView ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation IGLDemoCustomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    [self initView];
}

- (void)initView
{
    self.layer.borderColor = [UIColor colorWithRed:0.18 green:0.59 blue:0.69 alpha:1.0].CGColor;
    self.layer.borderWidth = 2.0;
    self.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor whiteColor];
    self.alpha = 0.8;
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.contentMode = UIViewContentModeCenter;
    [self addSubview:imageView];
    self.imageView = imageView;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    self.imageView.image = image;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    self.imageView.frame = self.bounds;
    self.layer.cornerRadius = frame.size.height / 2.0;
}

@end
