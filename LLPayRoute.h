//
//  LLPayRoute.h
//  PayTestDemo
//
//  Created by MAC on 17/3/29.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PayRoute.h"

typedef void(^handlerSuccess)(NSDictionary <NSString *,NSString *>* params);

@interface LLPayRoute : NSObject

+ (LLPayRoute *)llPayRoute;

+ (PayRoute *)routeWihtNameSpace:(NSString *)nameSpace;
- (void)monitorRouteWithNameSpace:(NSString *)nameSpace routeType:(NSString *)routeType handler:(handlerSuccess)handleSuccess;
- (NSMutableDictionary *)routeDictionary;
@end
