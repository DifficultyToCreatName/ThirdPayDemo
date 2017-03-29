//
//  payRoute.h
//  PayTestDemo
//
//  Created by MAC on 17/3/29.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^handlerSuccess)(NSDictionary <NSString *,NSString *>* params);

@interface PayRoute : NSObject

@property (nonatomic,copy) handlerSuccess handlerSuccess;

@property (nonatomic,strong) NSString *routeType;

- (void)sendRouteURLString:(NSString *)url;

@end
