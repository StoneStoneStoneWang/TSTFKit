//
//  NSString+CaculateHeight.m
//  JiuTouZhu
//
//  Created by three stone 王 on 2018/7/21.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "NSString+CaculateHeight.h"

@implementation NSString (CaculateHeight)

- (CGFloat)caculateHeightWith:(CGSize)size andFontSize:(CGFloat)fontSize andLineSpace:(CGFloat)lineSpace {
    
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    
    style.lineSpacing = lineSpace;
    
    CGFloat h = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize] ,NSParagraphStyleAttributeName: style} context:nil].size.height;
    
    return h;
}
- (CGFloat)caculateTwoRowsHeightWith:(CGSize)size andFontSize:(CGFloat)fontSize andLineSpace:(CGFloat)lineSpace {
    
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    
    style.lineSpacing = lineSpace;
    
    CGFloat h = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize] ,NSParagraphStyleAttributeName: style} context:nil].size.height;
    
    NSString *t1 = @"你好";
    
    NSString *t2 = @"你好\n你好";
    
    CGFloat singleH = [t1 caculateHeightWith:size andFontSize:fontSize andLineSpace:lineSpace];
    
    CGFloat doubleH = [t2 caculateHeightWith:size andFontSize:fontSize andLineSpace:lineSpace];
    
    CGFloat lineSpaceH = singleH * 2 - doubleH;
    
    if (h == singleH) {
        
        return h - lineSpace;
    } else {
        
        return MIN(doubleH, h);
    }
}
- (CGFloat )caculateWidthWith:(CGSize )size andFontSize:(CGFloat )fontSize andLineSpace:(CGFloat )lineSpace {
    
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    
    style.lineSpacing = lineSpace;
    
    CGFloat w = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize] ,NSParagraphStyleAttributeName: style} context:nil].size.width;
    
    return w;
}
@end
