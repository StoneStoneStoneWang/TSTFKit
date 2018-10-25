//
//  AppStoreUtil.h
//  TS_ToolKit
//
//  Created by three stone 王 on 2018/7/26.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppStoreUtil : NSObject

+ (instancetype)util;

- (void)regForAppId:(NSString *)appId;

@property (nonatomic ,copy ,readonly) NSString *appId;

- (void)skipToAppStore;

- (void)skipToEva;
@end
