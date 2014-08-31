//
//  IGLDropDownItem.m
//  IGLDropDownMenuDemo
//
//  Created by Galvin Li on 8/30/14.
//  Copyright (c) 2014 Galvin Li. All rights reserved.
//

#import "IGLDropDownItem.h"

@interface IGLDropDownItem ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation IGLDropDownItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _paddingLeft = 5;
        [self initView];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    [self.bgView setFrame:self.bounds];
    
    [self updateLayout];
}

- (void)initView
{
    self.bgView = [[UIView alloc] init];
    self.bgView.userInteractionEnabled = NO;
    self.bgView.backgroundColor = [UIColor whiteColor];
    self.bgView.layer.shadowColor = [UIColor grayColor].CGColor;
    self.bgView.layer.shadowOffset = CGSizeMake(0, 0);
    self.bgView.layer.shadowOpacity = 0.2;
    self.bgView.layer.shouldRasterize = YES;
    [self.bgView setFrame:self.bounds];
    [self addSubview:self.bgView];
    
    self.iconImageView = [[UIImageView alloc] init];
    self.iconImageView.contentMode = UIViewContentModeCenter;
    [self addSubview:self.iconImageView];
    
    self.textLabel = [[UILabel alloc] init];
    self.textLabel.numberOfLines = 1;
    self.textLabel.textColor = [UIColor grayColor];
    [self addSubview:self.textLabel];
    
    [self updateLayout];
    
}

- (void)setIconImage:(UIImage *)iconImage
{
    _iconImage = iconImage;
    [self.iconImageView setImage:self.iconImage];
    
    [self updateLayout];
}

- (void)updateLayout
{
    
    CGFloat selfWidth = CGRectGetWidth(self.bounds);
    CGFloat selfHeight = CGRectGetHeight(self.bounds);
    
    [self.iconImageView setFrame:CGRectMake(self.paddingLeft, 0, selfHeight, selfHeight)];
    if (self.iconImage) {
        [self.textLabel setFrame:CGRectMake(CGRectGetMaxX(self.iconImageView.frame), 0, selfWidth - CGRectGetMaxX(self.iconImageView.frame), selfHeight)];
    } else {
        [self.textLabel setFrame:CGRectMake(self.paddingLeft, 0, selfWidth - CGRectGetMaxX(self.iconImageView.frame), selfHeight)];
    }
}

- (void)setPaddingLeft:(CGFloat)paddingLeft
{
    _paddingLeft = paddingLeft;
    
    [self updateLayout];
}

- (void)setText:(NSString *)text
{
    _text = text;
    self.textLabel.text = self.text;
}

@end
