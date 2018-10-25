//
//  AppStoreUtil.m
//  TS_ToolKit
//
//  Created by three stone 王 on 2018/7/26.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "AppStoreUtil.h"
#import "OpenUrl.h"
@interface AppStoreUtil()

@property (nonatomic ,copy ,readwrite) NSString *appId;

@property (nonatomic ,copy) NSString *appStoreUrl;

@property (nonatomic ,copy) NSString *appStoreEvaUrl;

@end
static AppStoreUtil *manager = nil;

@implementation AppStoreUtil

+ (instancetype)util {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [AppStoreUtil new];
    });
    return manager;
}
- (void)regForAppId:(NSString *)appId {
    
    self.appId = appId;
    
    self.appStoreUrl = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@?mt=8",appId];
    
    self.appStoreEvaUrl = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@&pageNumber=0&sortOrdering=2&mt=8",appId];
}

- (void)skipToEva {
    
    [OpenUrl openUrl:self.appStoreEvaUrl];
}
- (void)skipToAppStore {
    
    [OpenUrl openUrl:self.appStoreUrl];
}

@end
