//
//  DLAlertView.h
//  DLAlertViewDemo
//
//  Created by John on 2016/10/26.
//  Copyright © 2016年 lingda. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DLAlertViewDelegate <NSObject>

- (void)dlAlertViewEnterButtonClick;
- (void)dlAlertViewCancelButtonClick;

@end
@interface DLAlertView : UIView

@property (strong, nonatomic) UIView *alertView;
@property (assign, nonatomic) id<DLAlertViewDelegate> delegate;
@property (strong, nonatomic) UIImageView *topImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *subTitleLabel;
@property (strong, nonatomic) UITextView *contentTextView;
@property (strong, nonatomic) UIButton *enterButton;
@property (strong, nonatomic) UIButton *cancelButton;

+ (instancetype)alertViewWithTitle:(NSString *)title subTitle:(NSString *)subTitle contentText:(NSString *)contentText cancelButton:(NSString *)cancelText enterButton:(NSString *)enterText;

- (void)show;

@end
