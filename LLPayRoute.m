//
//  LLPayRoute.m
//  PayTestDemo
//
//  Created by MAC on 17/3/29.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "LLPayRoute.h"

static LLPayRoute *__llPayRoute;
static NSMutableDictionary *__routeDictionary;

@interface LLPayRoute ()

@property (nonatomic,strong) NSMutableDictionary *routeDictionary;

@end

@implementation LLPayRoute

+ (LLPayRoute *)llPayRoute {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __llPayRoute = [[LLPayRoute alloc]init];
        __routeDictionary = [NSMutableDictionary dictionary];
    });
    return __llPayRoute;
}

+ (PayRoute *)routeWihtNameSpace:(NSString *)nameSpace{
    if (!nameSpace) {
        NSLog(@"\n=================\n%@\n================",@"nameSpace Not Null");
        return nil;
    }
    NSDictionary *routDic = [[LLPayRoute llPayRoute] routeDictionary];
    PayRoute *route = routDic[nameSpace];
    if (!route) {
        NSLog(@"\n=================\n%@\n================",@"route Not Exist");
        return nil;
    }
    return route;
}

- (void)monitorRouteWithNameSpace:(NSString *)nameSpace routeType:(NSString *)routeType handler:(handlerSuccess)handleSuccess{
    if (!nameSpace) {
        NSLog(@"\n=================\n%@\n================",@"nameSpace Not Null");
        return;
    }
    PayRoute *payRoute = [[PayRoute alloc]init];
    [__routeDictionary setObject:payRoute forKey:nameSpace];
    payRoute.handlerSuccess = handleSuccess;
    payRoute.routeType = routeType;
}

- (NSMutableDictionary *)routeDictionary {
    return __routeDictionary;
}


- (void)showingRouteDescribe {
    NSLog(@"\n=================\nRoute:%@\n================",__routeDictionary.allKeys);

}


@end
