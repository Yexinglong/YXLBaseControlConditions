//
//  UIView+YXLBaseControlConditions.m
//  mm
//
//  Created by ZHY on 16/5/19.
//  Copyright © 2016年 叶星龙. All rights reserved.
//

#import "UIView+YXLBaseControlConditions.h"
@interface UIView ()

@end

@implementation UIView (YXLBaseControlConditions)

- (UIView * (^)(id color))kBorderColor{
    return ^id(id color) {
        if ([color isKindOfClass:[UIColor class]]) {
            self.layer.borderColor=[color CGColor];
        }else if([color isKindOfClass:[NSString class]]){
            self.layer.borderColor=[[self colorWithHexString:color alpha:1]CGColor];
        }
        return self;
    };
}

- (UIView * (^)(CGFloat borderWidth))kBorderWidth{
    return ^id(CGFloat borderWidth) {
        self.layer.borderWidth=borderWidth;
        return self;
    };
}

- (UIView * (^)(CGPoint center))kCenter{
    return ^id(CGPoint center) {
        self.center=center;
        return self;
    };
}

- (UIView * (^)(CGFloat x,CGFloat y))kCenterXY{
    return ^id(CGFloat x,CGFloat y) {
        self.center=CGPointMake(x, y);
        return self;
    };
}


- (UIView * (^)(id color))kBackgroundColor{
    return ^id(id color) {
        if ([color isKindOfClass:[UIColor class]]) {
            self.backgroundColor=color;
        }else if([color isKindOfClass:[NSString class]]){
            self.backgroundColor=[self colorWithHexString:color alpha:1];
        }
        return self;
    };
}



- (UIView * (^)(CGFloat x,CGFloat y,CGFloat w,CGFloat h))kFrameXYWH{
        [self sizeToFit];
    return ^id(CGFloat x,CGFloat y,CGFloat w,CGFloat h){
        [self setFrame:(CGRect){x,y,w,h}];
        return self;
    };
}

- (UIView * (^)(CGRect frame))kFrame{
        [self sizeToFit];
    return ^id(CGRect frame){
        [self setFrame:frame];
        return self;
    };
}



- (UIView * (^)(id target ,SEL action ,UIViewEvents events))kAddTargetAction{
    return ^id(id target ,SEL action ,UIViewEvents events){
        self.userInteractionEnabled=YES;
        [self addTarget:target action:action forControlEvents:events];
        return self;
    };
}


-(void)addTarget:(id)target action:(SEL)action forControlEvents:(UIViewEvents)controlEvents{
    @synchronized(self){
        if (controlEvents == UpInside) {
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
            [self addGestureRecognizer:tapGesture];
        }
    }
}

#pragma -mark  UIImageView
- (UIView * (^)(id image))kImage{
    return ^id(id image){
        if([self isKindOfClass:[UIImageView class]]){
            if ([image isKindOfClass:[NSString class]]) {
                [(UIImageView *)self setImage:[UIImage imageNamed:image]];
            }else if ([image isKindOfClass:[UIImage class]]){
                [(UIImageView *)self setImage:image];
            }
        }else if ([self isKindOfClass:[UIButton class]]){
            if ([image isKindOfClass:[NSString class]]) {
                [(UIButton *)self setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
            }else if ([image isKindOfClass:[UIImage class]]){
                [(UIButton *)self setImage:image forState:UIControlStateNormal];
            }
        }
        return self;
    };
}

- (UIView * (^)(id image))kHighlightedImage{
    return ^id(id image){
        if([self isKindOfClass:[UIImageView class]]){
            if ([image isKindOfClass:[NSString class]]) {
                [(UIImageView *)self setHighlightedImage:[UIImage imageNamed:image]];
            }else if ([image isKindOfClass:[UIImage class]]){
                [(UIImageView *)self setHighlightedImage:image];
            }
        }else if ([self isKindOfClass:[UIButton class]]){
            if ([image isKindOfClass:[NSString class]]) {
                [(UIButton *)self setImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];
            }else if ([image isKindOfClass:[UIImage class]]){
                [(UIButton *)self setImage:image forState:UIControlStateHighlighted];
            }
        }
        return self;
    };
}

- (UIView * (^)(id image))kSelectedImage{
    return ^id(id image){
        if ([self isKindOfClass:[UIButton class]]){
            if ([image isKindOfClass:[NSString class]]) {
                [(UIButton *)self setImage:[UIImage imageNamed:image] forState:UIControlStateSelected];
            }else if ([image isKindOfClass:[UIImage class]]){
                [(UIButton *)self setImage:image forState:UIControlStateSelected];
            }
        }
        return self;
    };
}



#pragma -mark  UILabel
- (UIView * (^)(NSString *text))kText{
    return ^id(NSString *text){
        if([self isKindOfClass:[UILabel class]]){
            [(UILabel *)self setText:text];
        }else if ([self isKindOfClass:[UIButton class]]){
            UIButton *btn =(UIButton *)self;
            [btn setTitle:text forState:UIControlStateNormal];
        }
        return self;
    };
}

- (UIView * (^)(NSString *text))kSelectedText{
    return ^id(NSString *text){
        if([self isKindOfClass:[UILabel class]]){
            [(UILabel *)self setText:text];
        }else if ([self isKindOfClass:[UIButton class]]){
            UIButton *btn =(UIButton *)self;
            [btn setTitle:text forState:UIControlStateSelected];
        }
        return self;
    };
}

- (UIView * (^)(id font))kFont{
    return ^id(id font){
        if([self isKindOfClass:[UILabel class]]){
            if ([font isKindOfClass:[UIFont class]]) {
                [(UILabel *)self setFont:font];
            }else if ([font isKindOfClass:[NSNumber class]]){
                [(UILabel *)self setFont:[UIFont systemFontOfSize:[font floatValue]]];
            }
        }else if([self isKindOfClass:[UIButton class]]){
            UIButton *btn =(UIButton *)self;
            if ([font isKindOfClass:[UIFont class]]) {
                btn.titleLabel.font=font;
            }else if ([font isKindOfClass:[NSNumber class]]){
                btn.titleLabel.font=[UIFont systemFontOfSize:[font floatValue]];
            }
        }
        return self;
    };
}

- (UIView * (^)(id textColor))kTextColor{
    return ^id(id textColor){
        if([self isKindOfClass:[UILabel class]]){
            if ([textColor isKindOfClass:[UIColor class]]) {
                [(UILabel *)self setTextColor:textColor];
            }else if([textColor isKindOfClass:[NSString class]]){
                [(UILabel *)self setTextColor:[self colorWithHexString:textColor alpha:1]];
            }
        }else if ([self isKindOfClass:[UIButton class]]){
            if ([textColor isKindOfClass:[UIColor class]]) {
                [(UIButton *)self setTitleColor:textColor forState:UIControlStateNormal];
            }else if([textColor isKindOfClass:[NSString class]]){
                [(UIButton *)self setTitleColor:[self colorWithHexString:textColor alpha:1] forState:UIControlStateNormal];
            }
        }
        return self;
    };
}

- (UIView * (^)(id shadowColor))kShadowColor{
    return ^id(id shadowColor){
        if([self isKindOfClass:[UILabel class]]){
            if ([shadowColor isKindOfClass:[UIColor class]]) {
                [(UILabel *)self setShadowColor:shadowColor];
            }else if([shadowColor isKindOfClass:[NSString class]]){
                [(UILabel *)self setShadowColor:[self colorWithHexString:shadowColor alpha:1]];
            }
        }
        return self;
    };
}


- (UIView * (^)(NSTextAlignment textAlignment))kTextAlignment{
    return ^id(NSTextAlignment textAlignment){
        if([self isKindOfClass:[UILabel class]]){
            [(UILabel *)self setTextAlignment:textAlignment];
        }else if ([self isKindOfClass:[UIButton class]]){
            UIButton *btn =(UIButton *)self;
            [btn.titleLabel setTextAlignment:textAlignment];
        }
        return self;
    };
}


- (UIView * (^)(id textColor))kHighlightedTextColor{
    return ^id(id textColor){
        if([self isKindOfClass:[UILabel class]]){
            if ([textColor isKindOfClass:[UIColor class]]) {
                [(UILabel *)self setHighlightedTextColor:textColor];
            }else if([self isKindOfClass:[NSString class]]){
                [(UILabel *)self setHighlightedTextColor:[self colorWithHexString:textColor alpha:1]];
            }
        }else if ([self isKindOfClass:[UIButton class]]){
            UIButton *btn =(UIButton *)self;
            if ([textColor isKindOfClass:[UIColor class]]) {
                [btn setTitleColor:textColor forState:UIControlStateHighlighted];
            }else if([self isKindOfClass:[NSString class]]){
                [btn setTitleColor:[self colorWithHexString:textColor alpha:1] forState:UIControlStateHighlighted];
            }
        }
        return self;
    };
}

- (UIView * (^)(id textColor))kSelectedTextColor{
    return ^id(id textColor){
         if ([self isKindOfClass:[UIButton class]]){
            UIButton *btn =(UIButton *)self;
            if ([textColor isKindOfClass:[UIColor class]]) {
                [btn setTitleColor:textColor forState:UIControlStateSelected];
            }else if([self isKindOfClass:[NSString class]]){
                [btn setTitleColor:[self colorWithHexString:textColor alpha:1] forState:UIControlStateSelected];
            }
        }
        return self;
    };
}



- (UIView * (^)(NSString *text,id color,UIControlState state))kTitleAndColorAndState{
    return ^id(NSString *text,id color,UIControlState state){
        [(UIButton *)self setTitle:text forState:state];
        if ([color isKindOfClass:[UIColor class]]) {
            [(UIButton *)self setTitleColor:color forState:state];
        }else if([color isKindOfClass:[NSString class]]){
            [(UIButton *)self setTitleColor:[self colorWithHexString:color alpha:1] forState:state];
        }
        return self;
    };
}

- (UIView * (^)(id color,UIControlState state))kTitleShadowColorAndState{
    return ^id(id color,UIControlState state){
        if ([color isKindOfClass:[UIColor class]]) {
            [(UIButton *)self setTitleShadowColor:color forState:state];
        }else if([color isKindOfClass:[NSString class]]){
            [(UIButton *)self setTitleShadowColor:[self colorWithHexString:color alpha:1] forState:state];
        }
        return self;
    };
}

- (UIView * (^)(id image,UIControlState state))kImageAndState{
    return ^id(id image,UIControlState state){
        if ([image isKindOfClass:[NSString class]]) {
            [(UIButton *)self setImage:[UIImage imageNamed:image] forState:state];
        }else if([image isKindOfClass:[UIImage class]]){
            [(UIButton *)self setImage:image forState:state];
        }
        return self;
    };
}


- (UIView * (^)(id imageBackground,UIControlState state))kImageBackgroundAndState;{
    return ^id(id imageBackground,UIControlState state){
        if ([imageBackground isKindOfClass:[NSString class]]) {
            [(UIButton *)self setBackgroundImage:[UIImage imageNamed:imageBackground] forState:state];
        }else if([imageBackground isKindOfClass:[UIImage class]]){
            [(UIButton *)self setBackgroundImage:imageBackground forState:state];
        }
        return self;
    };
}

- (UIView * (^)(NSAttributedString * attributedTitle,UIControlState state))kAttributedTitleAndState{
    return ^id(NSAttributedString *attributedTitle,UIControlState state){
        if ([attributedTitle isKindOfClass:[NSAttributedString class]]) {
            [(UIButton *)self setAttributedTitle:attributedTitle forState:state];
        }
        return self;
    };
}

- (UIView * (^)(id target ,SEL action))kAddButtonTouchUpInside{
    return ^id(id target ,SEL action ){
    if ([self isKindOfClass:[UIButton class]]) {
        UIButton *btn =(UIButton *)self;
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
};
}


- (UIView * (^)(id target ,SEL action ,UIControlEvents events))kAddButtonTargetAction{
    return ^id(id target ,SEL action ,UIControlEvents events){
        if ([self isKindOfClass:[UIButton class]]) {
            UIButton *btn =(UIButton *)self;
            [btn addTarget:target action:action forControlEvents:events];
        }
        return self;
    };
}
- (UIView * (^)(id target ,SEL action ,UIControlEvents events))kRemoveButtonTargetAction{
    return ^id(id target ,SEL action ,UIControlEvents events){
        if ([self isKindOfClass:[UIButton class]]) {
            UIButton *btn =(UIButton *)self;
            [btn removeTarget:target action:action forControlEvents:events];
        }
        return self;
    };
}


- (UIView * (^)(UIEdgeInsets edge))kContentEdgeInsets{
    return ^id(UIEdgeInsets edge){
        if ([self isKindOfClass:[UIButton class]]) {
            UIButton *btn =(UIButton *)self;
            [btn setContentEdgeInsets:edge];
        }
        return self;
    };
}

- (UIView * (^)(CGFloat t,CGFloat l,CGFloat b,CGFloat r))kContentEdgeInsetsTLBR{
    return ^id(CGFloat t,CGFloat l,CGFloat b,CGFloat r){
        if ([self isKindOfClass:[UIButton class]]) {
            UIButton *btn =(UIButton *)self;
            [btn setContentEdgeInsets:UIEdgeInsetsMake(t, l, b, r)];
        }
        return self;
    };
}

- (UIView * (^)(UIEdgeInsets edge))kTitleEdgeInsets{
    return ^id(UIEdgeInsets edge){
        if ([self isKindOfClass:[UIButton class]]) {
            UIButton *btn =(UIButton *)self;
            [btn setTitleEdgeInsets:edge];
        }
        return self;
    };
}

- (UIView * (^)(CGFloat t,CGFloat l,CGFloat b,CGFloat r))kTitleEdgeInsetsTLBR{
    return ^id(CGFloat t,CGFloat l,CGFloat b,CGFloat r){
        if ([self isKindOfClass:[UIButton class]]) {
            UIButton *btn =(UIButton *)self;
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(t, l, b, r)];
        }
        return self;
    };
}

- (UIView * (^)(UIEdgeInsets edge))kImageEdgeInsets{
    return ^id(UIEdgeInsets edge){
        if ([self isKindOfClass:[UIButton class]]) {
            UIButton *btn =(UIButton *)self;
            [btn setImageEdgeInsets:edge];
        }
        return self;
    };
}

- (UIView * (^)(CGFloat t,CGFloat l,CGFloat b,CGFloat r))kImageEdgeInsetsTLBR{
    return ^id(CGFloat t,CGFloat l,CGFloat b,CGFloat r){
        if ([self isKindOfClass:[UIButton class]]) {
            UIButton *btn =(UIButton *)self;
            [btn setImageEdgeInsets:UIEdgeInsetsMake(t, l, b, r)];
        }
        return self;
    };
}


- (UIView * (^)(id color))kTintColor{
    return ^id(id color){
        if ([self isKindOfClass:[UIButton class]]) {
            if ([color isKindOfClass:[UIColor class]]) {
                [(UIButton *)self setTintColor:color];
            }else if([color isKindOfClass:[NSString class]]){
                [(UIButton *)self setTintColor:[self colorWithHexString:color alpha:1]];
            }
        }
        return self;
    };
}

#pragma -mark UIScrollView

- (UIView * (^)(CGPoint point))kContentOffset{
    return ^id(CGPoint point){
        if ([self isKindOfClass:[UIScrollView class]]) {
            [(UIScrollView *)self setContentOffset:point];;
        }
        return self;
    };
}
- (UIView * (^)(CGFloat x,CGFloat y))kContentOffsetXY{
    return ^id(CGFloat x,CGFloat y){
        if ([self isKindOfClass:[UIScrollView class]]) {
            [(UIScrollView *)self setContentOffset:CGPointMake(x, y)];
        }
        return self;
    };
}

- (UIView * (^)(CGSize size))kContentSize{
    return ^id( CGSize size){
        if ([self isKindOfClass:[UIScrollView class]]) {
            [(UIScrollView *)self setContentSize:size];
        }
        return self;
    };
}
- (UIView * (^)(CGFloat w,CGFloat h))kContentSizeXY{
    return ^id(CGFloat w,CGFloat h ){
        if ([self isKindOfClass:[UIScrollView class]]) {
            [(UIScrollView *)self setContentSize:CGSizeMake(w, h)];
        }
        return self;
    };
}

- (UIView * (^)(UIEdgeInsets edge))kContentInset{
    return ^id( UIEdgeInsets edge){
        if ([self isKindOfClass:[UIScrollView class]]) {
            [(UIScrollView *)self setContentInset:edge];;
        }
        return self;
    };
}
- (UIView * (^)(CGFloat t,CGFloat l,CGFloat b,CGFloat r))kContentInsetTLBR{
    return ^id( CGFloat t,CGFloat l,CGFloat b,CGFloat r){
        if ([self isKindOfClass:[UIScrollView class]]) {
            [(UIScrollView *)self setContentInset:UIEdgeInsetsMake(t, l, b, r)];;
        }
        return self;
    };
}


- (UIView * (^)(UIEdgeInsets edge))kScrollIndicatorInsets{
    return ^id( UIEdgeInsets edge){
        if ([self isKindOfClass:[UIScrollView class]]) {
            [(UIScrollView *)self setScrollIndicatorInsets:edge];
        }
        return self;
    };
}
- (UIView * (^)(CGFloat t,CGFloat l,CGFloat b,CGFloat r))kScrollIndicatorInsetsTLBR{
    return ^id(CGFloat t,CGFloat l,CGFloat b,CGFloat r ){
        if ([self isKindOfClass:[UIScrollView class]]) {
            [(UIScrollView *)self setScrollIndicatorInsets:UIEdgeInsetsMake(t, l, b, r)];
        }
        return self;
    };
}


- (UIView * (^)(CGPoint point,BOOL animated))kContentOffsetAndAnimated{
    return ^id( CGPoint point,BOOL animated){
        if ([self isKindOfClass:[UIScrollView class]]) {
            [(UIScrollView *)self setContentOffset:point animated:animated];
        }
        return self;
    };
}
- (UIView * (^)(CGFloat x,CGFloat y,BOOL animated))kContentOffsetAndAnimatedXY{
    return ^id( CGFloat x,CGFloat y,BOOL animated){
        if ([self isKindOfClass:[UIScrollView class]]) {
            [(UIScrollView *)self setContentOffset:CGPointMake(x, y) animated:animated];
        }
        return self;
    };
}

- (UIView * (^)(CGRect frame,BOOL animated))kScrollRectToVisibleAndAnimated{
    return ^id(CGRect frame,BOOL animated ){
        if ([self isKindOfClass:[UIScrollView class]]) {
            [(UIScrollView *)self scrollRectToVisible:frame animated:animated];;
        }
        return self;
    };
}

- (UIView * (^)(CGFloat x,CGFloat y,CGFloat w,CGFloat h,BOOL animated))kScrollRectToVisibleAndAnimatedXYWH{
    return ^id( CGFloat x,CGFloat y,CGFloat w,CGFloat h,BOOL animated){
        if ([self isKindOfClass:[UIScrollView class]]) {
            [(UIScrollView *)self scrollRectToVisible:(CGRect){x,y,w,h} animated:animated];;
        }
        return self;
    };
}

- (UIView * (^)(CGFloat zoomScale))kZoomScale{
    return ^id(CGFloat zoomScale ){
        if ([self isKindOfClass:[UIScrollView class]]) {
           [(UIScrollView *)self setZoomScale:zoomScale];
        }
        return self;
    };
}

- (UIView * (^)(CGFloat scale,BOOL animated))kSetZoomScaleAndAnimated{
    return ^id( CGFloat scale,BOOL animated){
        if ([self isKindOfClass:[UIScrollView class]]) {
            [(UIScrollView *)self setZoomScale:scale animated:animated];
        }
        return self;
    };
}

- (UIView * (^)(CGRect frame,BOOL animated))kZoomToRectAndAnimated{
    return ^id(CGRect frame,BOOL animated){
        if ([self isKindOfClass:[UIScrollView class]]) {
            [(UIScrollView *)self zoomToRect:frame animated:animated];
        }
        return self;
    };
}

- (UIView * (^)(CGFloat x,CGFloat y,CGFloat w,CGFloat h,BOOL animated))kZoomToRectAndAnimatedXYWH{
    return ^id( CGFloat x,CGFloat y,CGFloat w,CGFloat h,BOOL animated){
        if ([self isKindOfClass:[UIScrollView class]]) {
            [(UIScrollView *)self zoomToRect:(CGRect){x,y,w,h} animated:animated];
        }
        return self;
    };
}

#pragma -mark UITableView

- (UIView * (^)(UIEdgeInsets edge))kSeparatorInset{
    return ^id(UIEdgeInsets edge){
        if ([self isKindOfClass:[UITableView class]]) {
            [(UITableView *)self setSeparatorInset:edge];
        }
        return self;
    };
}
- (UIView * (^)(CGFloat t,CGFloat l,CGFloat b,CGFloat r))kSeparatorInsetTLBR{
    return ^id(CGFloat t,CGFloat l,CGFloat b,CGFloat r){
        if ([self isKindOfClass:[UITableView class]]) {
            [(UITableView *)self setSeparatorInset:UIEdgeInsetsMake(t, l, b, r)];
        }
        return self;
    };
}


- (UIView * (^)(BOOL editing))kEditing{
    return ^id(BOOL editing){
        if ([self isKindOfClass:[UITableView class]]) {
            [(UITableView *)self setEditing:editing];
        }
        return self;
    };
}
- (UIView * (^)(BOOL editing,BOOL animated))kEditingAndAnimated{
    return ^id(BOOL editing,BOOL animated){
        if ([self isKindOfClass:[UITableView class]]) {
            [(UITableView *)self setEditing:editing animated:animated];
        }
        return self;
    };
}

- (UIView * (^)(BOOL highlighted))kHighlightedBOOL{
    return ^id(BOOL highlighted){
        if ([self isKindOfClass:[UILabel class]]) {
            [(UILabel *)self setHighlighted:highlighted];
        }else if([self isKindOfClass:[UIImageView class]]){
            [(UIImageView *)self setHighlighted:highlighted];
        }else if ([self isKindOfClass:[UIButton class]]){
            [(UIButton *)self setHighlighted:highlighted];
        }
        return self;
    };
}




/**
 *  字符串转成UIColor
 */
-(UIColor *)colorWithHexString: (NSString *)color alpha:(CGFloat)alpha{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}

@end
