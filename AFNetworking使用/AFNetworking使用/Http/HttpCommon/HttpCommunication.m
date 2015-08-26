//
//  HttpCommunication.m
//  AFNetworkingDemo
//
//  Created by bruce on 15/8/25.
//  Copyright (c) 2015年 bruce. All rights reserved.
//

#import "HttpCommunication.h"
#import "HttpConnect.h"
//
#import "HttpLoginRequest.h"





@implementation HttpCommunication

static HttpCommunication* mInstance;
+ (HttpCommunication *)shareInstance {
    if(!mInstance) {
        mInstance = [[HttpCommunication alloc] init];
    }
    return mInstance;
}

- (void)doHttpCommunicationWithType:(HttpCommunicationType)cType delegate:(id<HttpResultProtocol>)delegate {
    [self doHttpCommunicationWithType:cType delegate:delegate object:nil];
}

- (void)doHttpCommunicationWithType:(HttpCommunicationType)cType delegate:(id<HttpResultProtocol>)delegate object:(NSObject*)object {
    HttpConnect *httpConnect = nil;
    switch (cType) {
        case ctLogin:{
            httpConnect = [[HttpLoginRequest alloc] init] ;
            [httpConnect requestWithObject:object andDelegate:delegate andType:cType];
            
            break;
        }
        default:
            break;
    }
    
    
}

@end
