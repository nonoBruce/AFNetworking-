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
#import "HttpImagesRequest.h"





@implementation HttpCommunication

static HttpCommunication* mInstance;
+ (HttpCommunication *)shareInstance {
    if(!mInstance) {
        mInstance = [[HttpCommunication alloc] init];
    }
    return mInstance;
}

- (void)doHttpCommunicationWithType:(HttpCommunicationType)cType delegate:(id<HttpResultProtocol>)delegate {
    [self doHttpCommunicationWithType:cType delegate:delegate params:nil headerParams:nil];
}

- (void)doHttpCommunicationWithType:(HttpCommunicationType)cType delegate:(id<HttpResultProtocol>)delegate params:(NSObject *)params {
    [self doHttpCommunicationWithType:cType delegate:delegate params:params headerParams:nil];
    
    
}

- (void)doHttpCommunicationWithType:(HttpCommunicationType)cType delegate:(id<HttpResultProtocol>)delegate params:(NSObject*)params headerParams:(NSObject *)headerParams {
    HttpConnect *httpConnect = nil;
    switch (cType) {
        case ctLogin: {
//            httpConnect = [[HttpLoginRequest alloc] init] ;
//            [httpConnect requestWithObject:params andDelegate:delegate andType:cType];
            
            break;
        }
        case ctImages: {
            httpConnect = [[HttpImagesRequest alloc] init] ;
            [httpConnect requestWithType:cType delegate:delegate params:params headerParams:headerParams];
//            httpConnect reque
        }
        default:
            break;
    }
    
}

@end
