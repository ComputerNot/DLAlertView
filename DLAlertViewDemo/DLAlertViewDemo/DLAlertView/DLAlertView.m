//
//  DLAlertView.m
//  DLAlertViewDemo
//
//  Created by John on 2016/10/26.
//  Copyright © 2016年 lingda. All rights reserved.
//

#import "DLAlertView.h"
#define DLALERTVIEW_WIDTH   [UIScreen mainScreen].bounds.size.width
#define DLALERTVIEW_HEIGHT   [UIScreen mainScreen].bounds.size.height

#define SHOW_VIEW_WIDTH    280
#define TEXT_VIEW_DEFAULT_HEIGTH    23

//#define kZLPhotoBrowserSrcName(file) [@"ZLPhotoBrowser.bundle" stringByAppendingPathComponent:file]
//#define kZLPhotoBrowserFrameworkSrcName(file) [@"Frameworks/ZLPhotoBrowser.framework/ZLPhotoBrowser.bundle" stringByAppendingPathComponent:file]
//kZLPhotoBrowserSrcName(file) 为通过copy文件夹方式获取图片路径的宏
//kZLPhotoBrowserFrameworkSrcName(file) 为通过cocoapods下载安装获取图片路径的宏
@implementation DLAlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        [self addSubview:self.alertView];
    }
    return self;
}

#pragma mark - Get
- (UIView *)alertView
{
    if (!_alertView) {
        _alertView = [[UIView alloc] init];
        _alertView.bounds = CGRectMake(0, 0, SHOW_VIEW_WIDTH, 188);
        _alertView.backgroundColor = [UIColor whiteColor];
        _alertView.center = self.center;
        _alertView.layer.cornerRadius = 10;
        [_alertView addSubview:self.topImageView];
        [_alertView addSubview:self.titleLabel];
        [_alertView addSubview:self.subTitleLabel];
        [_alertView addSubview:self.contentTextView];
        [_alertView addSubview:self.cancelButton];
        [_alertView addSubview:self.enterButton];
    }
    return _alertView;
}

- (UIImageView *)topImageView
{
    if (!_topImageView) {
        NSBundle *currentBundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[self class]] pathForResource:@"resource" ofType:@"bundle"]];
        UIImage *topImage = [[UIImage imageWithContentsOfFile:[currentBundle pathForResource:@"image_prompt@3x" ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _topImageView = [[UIImageView alloc] initWithImage:topImage];
        _topImageView.frame = CGRectMake(0, 0, _alertView.frame.size.width, 205);
    }
    return _topImageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 24, _alertView.frame.size.width, 20)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:22];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel
{
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_titleLabel.frame.origin.x, _titleLabel.frame.origin.y+_titleLabel.frame.size.height+10, _titleLabel.frame.size.width, 15)];
        _subTitleLabel.textAlignment = NSTextAlignmentCenter;
        _subTitleLabel.textColor = [UIColor whiteColor];
        _subTitleLabel.font = [UIFont systemFontOfSize:16];
    }
    return _subTitleLabel;
}

- (UITextView *)contentTextView
{
    if (!_contentTextView) {
        _contentTextView = [[UITextView alloc] initWithFrame:CGRectMake(12, _topImageView.frame.origin.y+_topImageView.frame.size.height-110, _alertView.frame.size.width-12*2, TEXT_VIEW_DEFAULT_HEIGTH)];
//        _contentTextView.backgroundColor = [UIColor redColor];
        _contentTextView.font = [UIFont systemFontOfSize:14];
        _contentTextView.textAlignment = NSTextAlignmentJustified;
    }
    return _contentTextView;
}

- (UIButton *)enterButton
{
    if (!_enterButton) {
        CGFloat buttonSpace = 18;
        CGFloat buttonHeight = 40;
        CGFloat alertWidth = _alertView.frame.size.width;
        CGFloat buttonWidth = (alertWidth - buttonSpace * 3)/2;
        _enterButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _enterButton.frame = CGRectMake(buttonSpace*2+buttonWidth, _alertView.frame.size.height-buttonHeight-10, buttonWidth, buttonHeight);
        _enterButton.backgroundColor = [UIColor redColor];
        _enterButton.titleLabel.font = [UIFont boldSystemFontOfSize:18];
        _enterButton.layer.cornerRadius = buttonHeight/2;
//        223，90，101
        _enterButton.backgroundColor = [UIColor colorWithRed:252/255.0 green:91/255.0 blue:105/255.0 alpha:1];
        [_enterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_enterButton addTarget:self action:@selector(enterButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        _enterButton.layer.shadowColor = _enterButton.backgroundColor.CGColor;//shadowColor阴影颜色
        _enterButton.layer.shadowOffset = CGSizeMake(2,2);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
        _enterButton.layer.shadowOpacity = 0.6;//阴影透明度，默认0
        _enterButton.layer.shadowRadius = 4;//阴影半径，默认3
    }
    return _enterButton;
}

- (UIButton *)cancelButton
{
    if (!_cancelButton) {
        CGFloat buttonSpace = 18;
        CGFloat buttonHeight = 40;
        CGFloat alertWidth = _alertView.frame.size.width;
        CGFloat buttonWidth = (alertWidth - buttonSpace * 3)/2;
        _cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _cancelButton.frame = CGRectMake(buttonSpace, _alertView.frame.size.height-buttonHeight-10, buttonWidth, buttonHeight);
        _cancelButton.layer.borderWidth = .7;
        _cancelButton.layer.borderColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1].CGColor;
        _cancelButton.layer.cornerRadius = buttonHeight/2;
        _cancelButton.titleLabel.font = [UIFont boldSystemFontOfSize:18];
        [_cancelButton setTitleColor:[UIColor colorWithRed:187/255.0 green:187/255.0 blue:187/255.0 alpha:1] forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(cancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}
#pragma mark - Button Click
- (void)cancelButtonClick
{
    if ([self.delegate respondsToSelector:@selector(dlAlertViewCancelButtonClick)]) {
        [self.delegate dlAlertViewCancelButtonClick];
        [self hide];
    }
}

- (void)enterButtonClick
{
    if ([self.delegate respondsToSelector:@selector(dlAlertViewEnterButtonClick)]) {
        [self.delegate dlAlertViewEnterButtonClick];
        [self hide];
    }
}
#pragma mark - Control
- (void)show
{
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    [window addSubview:self];
//    [window bringSubviewToFront:self];
}

- (void)hide
{
    [self removeFromSuperview];
}

#pragma mark - view Layout
- (void)layoutSubviews
{
    [super layoutSubviews];
//    self.bounds = CGRectMake(0, 0, DLALERTVIEW_WIDTH, DLALERTVIEW_HEIGHT);
    _alertView.center = self.center;
    CGFloat buttonSpace = 18;
    CGFloat buttonHeight = 40;
    CGFloat alertWidth = _alertView.frame.size.width;
    CGFloat buttonWidth = (alertWidth - buttonSpace * 3)/2;
    _enterButton.frame = CGRectMake(buttonSpace*2+buttonWidth, _alertView.frame.size.height-buttonHeight-10, buttonWidth, buttonHeight);
    _cancelButton.frame = CGRectMake(buttonSpace, _alertView.frame.size.height-buttonHeight-10, buttonWidth, buttonHeight);
}

#pragma mark - + Method
+ (instancetype)alertViewWithTitle:(NSString *)title subTitle:(NSString *)subTitle contentText:(NSString *)contentText cancelButton:(NSString *)cancelText enterButton:(NSString *)enterText
{
    DLAlertView *alertView = [[DLAlertView alloc] initWithFrame:CGRectMake(0, 0, DLALERTVIEW_WIDTH, DLALERTVIEW_HEIGHT)];
    alertView.backgroundColor = [UIColor colorWithWhite:.2 alpha:.5];
    alertView.titleLabel.text = title;
    alertView.subTitleLabel.text = subTitle;
    alertView.contentTextView.text = contentText;
    [alertView.enterButton setTitle:enterText forState:UIControlStateNormal];
    [alertView.cancelButton setTitle:cancelText forState:UIControlStateNormal];
    CGFloat textViewHeight = [self viewHeightWithText:contentText textFont:alertView.contentTextView.font viewWidth:alertView.contentTextView.frame.size.width];
    NSLog(@"文本的高度为：%f", textViewHeight);
    //17,100
    CGFloat rowHeight = 17;
    alertView.contentTextView.scrollEnabled = NO;
    if (textViewHeight > 220) {
        textViewHeight = 220;
        alertView.contentTextView.scrollEnabled = YES;
    }
    if (textViewHeight > rowHeight) {
        CGFloat contentViewX = alertView.contentTextView.frame.origin.x;
        CGFloat contentViewY = alertView.contentTextView.frame.origin.y;
        alertView.contentTextView.frame = CGRectMake(contentViewX, contentViewY, alertView.contentTextView.frame.size.width, alertView.contentTextView.frame.size.height + textViewHeight - rowHeight + 5);
        alertView.alertView.bounds = CGRectMake(0, 0, alertView.alertView.frame.size.width, alertView.alertView.frame.size.height+textViewHeight - rowHeight);
    }
    return alertView;
}


+ (CGFloat)viewHeightWithText:(NSString *)textString textFont:(UIFont *)font viewWidth:(CGFloat)viewWidth
{
    CGSize size = CGSizeMake(viewWidth-5, 0);
    NSDictionary *attribute = @{NSFontAttributeName:font};
    
    CGSize retSize = [textString boundingRectWithSize:size
                                              options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                           attributes:attribute
                                              context:nil].size;
    return retSize.height + 6;
}

@end
