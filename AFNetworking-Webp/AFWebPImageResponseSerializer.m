//
//  AFWebPImageResponseSerializer.m
//  AFNetworking Webp
//
//  Created by Brandon on 5/20/15.
//  Copyright (c) 2015 Brandon Schlenker. All rights reserved.
//

#import "AFWebPImageResponseSerializer.h"
#import <UIImage+WebP.h>

@implementation AFWebPImageResponseSerializer

- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    NSMutableSet *contentTypes = [self.acceptableContentTypes mutableCopy];
    [contentTypes addObject:@"image/webp"];
    self.acceptableContentTypes = contentTypes;
    
    return self;
}

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error
{
    
    if ([response.MIMEType isEqualToString:@"image/webp"]) {
        return [UIImage imageWithWebPData:data];
    }
    
    return [super responseObjectForResponse:response data:data error:error];
}

@end
