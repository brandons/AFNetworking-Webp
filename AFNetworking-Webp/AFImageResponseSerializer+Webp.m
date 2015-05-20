//
//  AFImageResponseSerializer+Webp.m
//  AFNetworking Webp
//
//  Created by Brandon on 5/20/15.
//  Copyright (c) 2015 Brandon Schlenker. All rights reserved.
//

#import "AFImageResponseSerializer+Webp.h"
#import <UIImage+WebP.h>
#import <objc/runtime.h>

@implementation AFImageResponseSerializer (Webp)

+ (void)load
{
    [self swizzleInstanceSelector:@selector(init) toSelector:@selector(swizzle_init)];
    [self swizzleInstanceSelector:@selector(responseObjectForResponse:data:error:) toSelector:@selector(swizzle_responseObjectForResponse:data:error:)];
}

- (instancetype)swizzle_init
{
    AFImageResponseSerializer *serializer = [self swizzle_init];
    NSMutableSet *contentTypes = [self.acceptableContentTypes mutableCopy];
    [contentTypes addObject:@"image/webp"];
    serializer.acceptableContentTypes = contentTypes;
    
    return serializer;
}

- (id)swizzle_responseObjectForResponse:(NSURLResponse *)response
                                   data:(NSData *)data
                                  error:(NSError *__autoreleasing *)error
{
    if ([response.MIMEType isEqualToString:@"image/webp"]) {
        return [UIImage imageWithWebPData:data];
    }
    
    return [self swizzle_responseObjectForResponse:response data:data error:error];
}

+ (void)swizzleInstanceSelector:(SEL)firstSelector toSelector:(SEL)secondSelector;
{
    Method swizzleMethod = class_getInstanceMethod(self, firstSelector);
    Method method = class_getInstanceMethod(self, secondSelector);
    method_exchangeImplementations(method, swizzleMethod);
}

@end
