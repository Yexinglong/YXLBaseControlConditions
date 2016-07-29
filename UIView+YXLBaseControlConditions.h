//
//  UIView+YXLBaseControlConditions.h
//  mm
//
//  Created by ZHY on 16/5/19.
//  Copyright © 2016年 叶星龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, UIViewEvents) {
    UpInside
};

@interface UIView (YXLBaseControlConditions)

/**
 *  背景颜色 支持十六进制字符串(@"0xffffff") UIColor([UIColor blackColor])
 示例
    view.kBackgroundColor(@"0xffffff").kBackgroundColor([UIColor blackColor])
 */
- (UIView * (^)(id color))kBackgroundColor;

/**
 *  设置控件坐标大小 
  示例
    view.kFrame(view.frame);
 */
- (UIView * (^)(CGRect frame))kFrame;
/**
 示例
    kFrameXYWH(0,0,0,0);
 */
- (UIView * (^)(CGFloat x,CGFloat y,CGFloat w,CGFloat h))kFrameXYWH;

/**
 *  给当前控件添加点击事件，点击返回手势:UITapGestureRecognizer 可自己添加需要的手势进去
 示例 
    view.kAddTargetAction(self,@selector(tap),UpInside);
 */
- (UIView * (^)(id target ,SEL action ,UIViewEvents events))kAddTargetAction;
/**
 *  给UIButton  添加正常点击手势
 示例 
    button.kAddButtonTouchUpInside(self,@selector(tap));
 */
- (UIView * (^)(id target ,SEL action))kAddButtonTouchUpInside;


/**
 *  Layer边层的颜色 支持十六进制字符串(@"0xffffff") UIColor([UIColor blackColor])
 示例
    view.kBorderColor(@"0xffffff").kBorderColor([UIColor blackColor])
 */
- (UIView * (^)(id color))kBorderColor;

/**
 *  中心
 示例 
    view.kCenter(view.center);
 */
- (UIView * (^)(CGPoint center))kCenter;
/**
 *  X-Y
 示例 
    view.kCenterXY(0,0);
 */
- (UIView * (^)(CGFloat x,CGFloat y))kCenterXY;

/**
 *  <UIImageView UIButton >  支持 NSString UIimage
 示例 
    imageView.kImage(@"icon").kImage(UIImage);
 
    button.kImage(@"icon").kImage(UIImage); 默认Normal
 */
- (UIView * (^)(id image))kImage;

/**
 *  <UIImageView UIButton > 支持 NSString UIimage
 示例
    imageView.kImage(@"icon").kImage(UIImage);
 
    button.kImage(@"icon").kImage(UIImage); 默认Highlighted
 */
- (UIView * (^)(id image))kHighlightedImage;

/**
 *  <UIButton Selected图片> 设置选中 支持 NSString UIimage
 示例
    imageView.kImage(@"icon").kImage(UIImage);
 
    button.kImage(@"icon").kImage(UIImage); 默认Selected
 */
- (UIView * (^)(id image))kSelectedImage;

/**
 *  <UIButton UIImageView UILabel> 是否高亮图片 and 是否高亮文字颜色 and 是否高亮按钮
 示例
    imageView.kHighlightedBOOL(YES);
 
    label.kHighlightedBOOL(YES)
 
    button.kHighlightedBOOL(YES) 默认Highlighted
 */
- (UIView * (^)(BOOL highlighte))kHighlightedBOOL;

/**
 *  <UILabel UIButton > 文本
 示例
    label.kText(@"我是大帅哥");
 
    button.kText(@"我是大帅哥"); 默认Normal
 */
- (UIView * (^)(NSString *text))kText;

/**
 *  <UIButton Selected> 文本
 示例
    button.kText(@"我是大帅哥"); 默认Selected
 */
- (UIView * (^)(NSString *text))kSelectedText;

/**
 *  <UILabel UIButton> 字体大小  kFont([UIFont systemFontOfSize:13]) and kFont(@13)
 示例
    button.kFont([UIFont systemFontOfSize:13]).kFont(@13);
 
    label.kFont([UIFont systemFontOfSize:13]).kFont(@13);

 */
- (UIView * (^)(id font))kFont;

/**
 *  <UILabel UIButton > 文字颜色 支持十六进制字符串(@"0xffffff")
 示例
    label.kTextColor(@"0xffffff").kTextColor([UIColor blackColor])
    
    button.kTextColor(@"0xffffff").kTextColor([UIColor blackColor]) 默认Normal
 */
- (UIView * (^)(id textColor))kTextColor;

/**
 *  <UILabel UIButton> 高亮字体颜色 支持十六进制字符串(@"0xffffff") UIColor([UIColor blackColor])
 示例
    label.kHighlightedTextColor(@"0xffffff").kHighlightedTextColor([UIColor blackColor])
 
    button.kHighlightedTextColor(@"0xffffff").kHighlightedTextColor([UIColor blackColor]) 默认Highlighted
 */
- (UIView * (^)(id textColor))kHighlightedTextColor;

/**
 *  <UIButton > 选中文字颜色 支持十六进制字符串(@"0xffffff") UIColor([UIColor blackColor])
 示例
    button.kSelectedTextColor(@"0xffffff").kSelectedTextColor([UIColor blackColor]) 默认Selected
 */
- (UIView * (^)(id textColor))kSelectedTextColor;

/**
 *  <UILabel> 阴影颜色 支持十六进制字符串(@"0xffffff") UIColor([UIColor blackColor])
 示例
    label.kSelectedTextColor(@"0xffffff").kSelectedTextColor([UIColor blackColor])
 */
- (UIView * (^)(id shadowColor))kShadowColor;

/**
 *  <UILabel UIButton> TextAlignment
 示例
    label.kTextAlignment(NSTextAlignmentCenter).kTextAlignment(1)
 
    button.kTextAlignment(NSTextAlignmentCenter).kTextAlignment(1)
 */
- (UIView * (^)(NSTextAlignment textAlignment))kTextAlignment;

#pragma -mark UIButton
/**
 *   <UIButton> 按钮 文本  文本颜色  状态 支持十六进制字符串(@"0xffffff") UIColor([UIColor blackColor])
 示例
    button.kTitleAndColorAndState(@"我是大帅哥",@"0xffffff",UIControlStateNormal)
 
    button.kTitleAndColorAndState(@"我是大帅哥",[UIColor blackColor],UIControlStateNormal);
 */
- (UIView * (^)(NSString *text,id color,UIControlState state))kTitleAndColorAndState;

/**
 *  <UIButton> 按钮 文字阴影颜色 支持十六进制字符串(@"0xffffff") UIColor([UIColor blackColor])
 示例
    button.kTitleShadowColorAndState(@"0xffffff",UIControlStateNormal)
 
    button.kTitleShadowColorAndState([UIColor blackColor],UIControlStateNormal);
 */
- (UIView * (^)(id color,UIControlState state))kTitleShadowColorAndState;

/**
 *  <UIButton> 按钮 图片 支持 NSString UIimage
 示例
    button.kImageAndState(@"icon",UIControlStateNormal)
 
    button.kImageAndState(UIImage,UIControlStateNormal);
 */
- (UIView * (^)(id image,UIControlState state))kImageAndState;

/**
 *  <UIButton> 按钮 背景图片 状态  支持 NSString UIimage
 示例
    button.kImageBackgroundAndState(@"icon",UIControlStateNormal)
 
    button.kImageBackgroundAndState(UIImage,UIControlStateNormal);
 */
- (UIView * (^)(id imageBackground,UIControlState state))kImageBackgroundAndState;

/**
 *  <UIButton> 按钮 AttributedTitle 状态
 示例
    button.kAttributedTitleAndState(@"我是大帅哥",UIControlStateNormal)
 
 */
- (UIView * (^)(NSAttributedString *attributedTitle,UIControlState state))kAttributedTitleAndState;

/**
 *  <UIButton> 按钮 添加手势
 示例
    button.kAddButtonTargetAction(self,@selector(tap),UIControlEventTouchUpInside)
 
    button.kRemoveButtonTargetAction(self,@selector(tap),UIControlEventTouchUpInside)
 */
- (UIView * (^)(id target ,SEL action ,UIControlEvents events))kAddButtonTargetAction;
- (UIView * (^)(id target ,SEL action ,UIControlEvents events))kRemoveButtonTargetAction;

/**
 *  default is UIEdgeInsetsZero  uibutton
 示例
    button.kContentEdgeInsets(UIEdgeInsets)
 
    button.kContentEdgeInsetsTLBR(0,0,0,0)
 */
- (UIView * (^)(UIEdgeInsets edge))kContentEdgeInsets;
- (UIView * (^)(CGFloat t,CGFloat l,CGFloat b,CGFloat r))kContentEdgeInsetsTLBR;

/**
 *  default is UIEdgeInsetsZero  uibutton
 示例
    button.kTitleEdgeInsets(UIEdgeInsets)
 
    button.kTitleEdgeInsetsTLBR(0,0,0,0)
 */
- (UIView * (^)(UIEdgeInsets edge))kTitleEdgeInsets;
- (UIView * (^)(CGFloat t,CGFloat l,CGFloat b,CGFloat r))kTitleEdgeInsetsTLBR;

/**
 *  default is UIEdgeInsetsZero   uibutton
 示例
    button.kImageEdgeInsets(UIEdgeInsets)
 
    button.kImageEdgeInsetsTLBR(0,0,0,0)
 */
- (UIView * (^)(UIEdgeInsets edge))kImageEdgeInsets;
- (UIView * (^)(CGFloat t,CGFloat l,CGFloat b,CGFloat r))kImageEdgeInsetsTLBR;

/**
 *  <UIButton> 按钮  颜色 支持十六进制字符串(@"0xffffff") UIColor([UIColor blackColor])
 示例
    button.kTintColor(@"0xffffff")
 
    button.kTintColor([UIColor blackColor])
 */
- (UIView * (^)(id color))kTintColor;


#pragma -mark UIScrollView
/**
 *  default CGPointZero
 */
- (UIView * (^)(CGPoint point))kContentOffset;
- (UIView * (^)(CGFloat x,CGFloat y))kContentOffsetXY;

/**
 *  default CGSizeZero
 */
- (UIView * (^)(CGSize size))kContentSize;
- (UIView * (^)(CGFloat w,CGFloat h))kContentSizeXY;

/**
 *  default UIEdgeInsetsZero. add additional scroll area around content
 */
- (UIView * (^)(UIEdgeInsets edge))kContentInset;
- (UIView * (^)(CGFloat t,CGFloat l,CGFloat b,CGFloat r))kContentInsetTLBR;

/**
 *  default is UIEdgeInsetsZero. adjust indicators inside of insets
 */
- (UIView * (^)(UIEdgeInsets edge))kScrollIndicatorInsets;
- (UIView * (^)(CGFloat t,CGFloat l,CGFloat b,CGFloat r))kScrollIndicatorInsetsTLBR;

/**
 *  // animate at constant velocity to new offset
 */
- (UIView * (^)(CGPoint point,BOOL animated))kContentOffsetAndAnimated;
- (UIView * (^)(CGFloat x,CGFloat y,BOOL animated))kContentOffsetAndAnimatedXY;

/**
 *  scroll so rect is just visible (nearest edges). nothing if rect completely visible
 */
- (UIView * (^)(CGRect frame,BOOL animated))kScrollRectToVisibleAndAnimated;
//  kScrollRectToVisibleAndAnimatedXYWH(0,0,0,0,YES)
- (UIView * (^)(CGFloat x,CGFloat y,CGFloat w,CGFloat h,BOOL animated))kScrollRectToVisibleAndAnimatedXYWH;

/**
 *  default is 1.0
 */
- (UIView * (^)(CGFloat zoomScale))kZoomScale;

- (UIView * (^)(CGFloat scale,BOOL animated))kSetZoomScaleAndAnimated;

- (UIView * (^)(CGRect frame,BOOL animated))kZoomToRectAndAnimated;
//  kZoomToRectAndAnimated(0,0,0,0,YES)
- (UIView * (^)(CGFloat x,CGFloat y,CGFloat w,CGFloat h,BOOL animated))kZoomToRectAndAnimatedXYWH;


#pragma -mark UITableView
/**
 *  allows customization of the frame of cell separators
 */
- (UIView * (^)(UIEdgeInsets edge))kSeparatorInset;
- (UIView * (^)(CGFloat t,CGFloat l,CGFloat b,CGFloat r))kSeparatorInsetTLBR;

/**
 *  default is NO. setting is not animated.
 */
- (UIView * (^)(BOOL editing))kEditing;
- (UIView * (^)(BOOL editing,BOOL animated))kEditingAndAnimated;



@end
