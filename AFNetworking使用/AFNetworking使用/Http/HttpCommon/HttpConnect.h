//
//  HttpConnect.h
//  AFNetworkingDemo
//
//  Created by bruce on 15/8/25.
//  Copyright (c) 2015年 bruce. All rights reserved.
//

#import "HttpUrlHeader.h"
#import "HttpCommunicationResult.h"
#import "AFNetworking.h"

@protocol HttpConnectDelegate<NSObject>

- (void)parse:(NSDictionary *)dic andHttpResult:(HttpCommunicationResult *)httpResult;

@end


@interface HttpConnect : NSObject<HttpConnectDelegate>


//自己用
- (void)requestWithType:(HttpCommunicationType )cType delegate:(id<HttpResultProtocol>)delegate url:(NSString *)urlString httpType:(NSString *)httpType;;

- (void)requestWithType:(HttpCommunicationType )cType delegate:(id<HttpResultProtocol>)delegate url:(NSString *)urlString params:(NSDictionary *)params httpType:(NSString *)httpType;;

- (void)requestWithType:(HttpCommunicationType )cType delegate:(id<HttpResultProtocol>)delegate url:(NSString *)urlString params:(NSDictionary *)params headerParams:(NSDictionary *)headerParams httpType:(NSString *)httpType;


//子类用
- (HttpCommunicationResult *)parse:(NSDictionary *)dic andHttpResult:(HttpCommunicationResult *)httpResult;

- (void)requestWithType:(HttpCommunicationType )cType delegate:(id<HttpResultProtocol>)delegate;

- (void)requestWithType:(HttpCommunicationType )cType delegate:(id<HttpResultProtocol>)delegate params:(NSObject *)params;
- (void)requestWithType:(HttpCommunicationType )cType delegate:(id<HttpResultProtocol>)delegate params:(NSObject *)params headerParams:(NSObject *)headerParams;
@end
