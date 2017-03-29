//
//  payRoute.m
//  PayTestDemo
//
//  Created by MAC on 17/3/29.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "PayRoute.h"

@interface PayRoute ()

@property (nonatomic,strong) NSArray *keysArray;

@property (nonatomic,strong) NSMutableDictionary *paramsDictionary;

@end

@implementation PayRoute


- (void)sendRouteURLString:(NSString *)url {
    if ([url containsString:@"://"]) {
        NSArray *valuesArray = [url componentsSeparatedByString:@"://"];
        if (valuesArray.count > 1) {
            [self handleUrl:valuesArray[1]];
        }else {
            NSLog(@"\n=================\n%@\n================",@"values is NULL");
        }
    }else {
        [self handleUrl:url];
    }
}

- (NSMutableDictionary *)paramsDictionary {
    if (!_paramsDictionary) {
        _paramsDictionary = [NSMutableDictionary dictionary];
    }
    return _paramsDictionary;
}

//PayTest://viewController&payCount&name

- (void)handleUrl:(NSString *)url {
    NSArray *valuesArray = [url componentsSeparatedByString:@"&"];
    if (self.keysArray.count == valuesArray.count) {
        for (int i = 0;i < self.keysArray.count; i ++) {
            [self.paramsDictionary setObject:valuesArray[i] forKey:self.keysArray[i]];
        }
        if (self.handlerSuccess) {
            self.handlerSuccess(self.paramsDictionary);
        }
    }
    
}

- (void)setRouteType:(NSString *)routeType {
    if (!routeType) {
        return;
    }
    BOOL hasNameSpac = [routeType containsString:@"://"];
    if (hasNameSpac) {
        NSArray *nameSpaceArray = [routeType componentsSeparatedByString:@"://"];
        if (nameSpaceArray.count >1) {
            [self routeKeysArrayWithKeysString:nameSpaceArray[1]];
        }
    }else {
        [self routeKeysArrayWithKeysString:routeType];
    }
}

- (void)routeKeysArrayWithKeysString:(NSString *)keysString {
    NSArray *keysArray = [keysString componentsSeparatedByString:@"&"];
    if (keysArray.count) {
        self.keysArray = keysArray;
    }
}



@end
