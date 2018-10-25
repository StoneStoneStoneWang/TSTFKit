//
//  NSString+CaculateHeight.h
//  JiuTouZhu
//
//  Created by three stone 王 on 2018/7/21.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (CaculateHeight)

- (CGFloat )caculateHeightWith:(CGSize )size andFontSize:(CGFloat )fontSize andLineSpace:(CGFloat )lineSpace;

- (CGFloat )caculateTwoRowsHeightWith:(CGSize )size andFontSize:(CGFloat )fontSize andLineSpace:(CGFloat )lineSpace;

- (CGFloat )caculateWidthWith:(CGSize )size andFontSize:(CGFloat )fontSize andLineSpace:(CGFloat )lineSpace;
@end
