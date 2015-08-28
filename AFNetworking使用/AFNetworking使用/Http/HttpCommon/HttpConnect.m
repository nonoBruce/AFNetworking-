//
//  HttpConnect.m
//  AFNetworkingDemo
//
//  Created by bruce on 15/8/25.
//  Copyright (c) 2015年 bruce. All rights reserved.
//

#import "HttpConnect.h"

@interface HttpConnect()

@end

@implementation HttpConnect

- (void)requestWithType:(HttpCommunicationType )cType delegate:(id<HttpResultProtocol>)delegate url:(NSString *)urlString httpType:(NSString *)httpType;{
    [self requestWithType:cType delegate:delegate url:urlString params:nil headerParams:nil httpType:httpType];
}

- (void)requestWithType:(HttpCommunicationType )cType delegate:(id<HttpResultProtocol>)delegate url:(NSString *)urlString params:(NSDictionary *)params httpType:(NSString *)httpType;{
    [self requestWithType:cType delegate:delegate url:urlString params:params headerParams:nil httpType:httpType];
}

- (void)requestWithType:(HttpCommunicationType )cType delegate:(id<HttpResultProtocol>)delegate url:(NSString *)urlString params:(NSDictionary *)params headerParams:(NSDictionary *)headerParams httpType:(NSString *)httpType;{
    __block HttpCommunicationResult *result = nil;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //设置头部
    if(headerParams){
        for(NSString *key in headerParams.allKeys){
            [manager.requestSerializer setValue:headerParams[key] forHTTPHeaderField:key];
        }
    }
    if([httpType isEqualToString:@"GET"]){
        [manager GET:urlString parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            //        NSLog(@"JSON: %@", responseObject);
            result = [self parse:responseObject andHttpResult:result];
            
            [delegate requestFinishedSuccess:cType andResult:result];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            result = [[HttpCommunicationResult alloc] init];
            
            //        NSLog(@"Error: %@", error);
            [delegate requestFinishedError:cType andResult:result];
        }];
    }
    else if([httpType isEqualToString:@"POST"]){
        [manager POST:urlString parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSLog(@"JSON: %@", responseObject);
            result = [self parse:responseObject andHttpResult:result];
            
            [delegate requestFinishedSuccess:cType andResult:result];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [delegate requestFinishedError:cType andResult:result];

            NSLog(@"Error: %@", error);
        }];
    }
    
    

}


#pragma mark - 子类使用
- (HttpCommunicationResult *)parse:(NSDictionary *)dic andHttpResult:(HttpCommunicationResult *)httpResult{
    return httpResult;
}

- (void)requestWithType:(HttpCommunicationType )cType delegate:(id<HttpResultProtocol>)delegate {
    
}

- (void)requestWithType:(HttpCommunicationType )cType delegate:(id<HttpResultProtocol>)delegate params:(NSObject *)params {
    
}
- (void)requestWithType:(HttpCommunicationType )cType delegate:(id<HttpResultProtocol>)delegate params:(NSObject *)params headerParams:(NSObject *)headerParams {
    
}
@end

