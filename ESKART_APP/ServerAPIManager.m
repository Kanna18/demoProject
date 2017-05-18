//
//  ServerAPIManager.m
//  Tripanzee
//
//  Created by Chandrika on 01/10/14.
//  Copyright (c) 2014 Raju Solutions. All rights reserved.
//

#import "ServerAPIManager.h"
#import "AFHTTPRequestOperationManager.h"

enum HTTPMethod {
    HTTPGet = 1729,
    HTTPPost,
    HTTPPut,
    HTTPDelete
};

@implementation ServerAPIManager



+ (instancetype)sharedinstance {
    static dispatch_once_t once;
    static ServerAPIManager *serverAPI = nil;
    dispatch_once(&once,^{
        serverAPI = [[ServerAPIManager alloc] init];
        
    });
    return serverAPI;
}

#define hostPath @"http://eskart.in/services/"

-(void)processRequest:(NSString*)path params:(id)params requestType:(NSString *)type successBlock:(NetworkManagerCompletionBlock)reqSuccessDic andErrorBlock:(NetworkManagerFailureBlock)reqErrorDic
{
    path=[NSString stringWithFormat:@"%@%@",hostPath,path];
    
    
      AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",@""]]];
    manager.securityPolicy= [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    manager.securityPolicy.allowInvalidCertificates=YES;
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer.acceptableContentTypes=[manager.responseSerializer.acceptableContentTypes setByAddingObject:@"application/json"];

    
   // NSLog(@"%@",manager.requestSerializer.HTTPRequestHeaders);
    
    if ([type isEqualToString:@"POST"]) {
        [manager POST:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [self completedWithResponse:operation.response error:nil data:responseObject withSuccessBlock:reqSuccessDic ErrorBlock:reqErrorDic];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [self completedWithResponse:operation.response error:error data:nil withSuccessBlock:reqSuccessDic ErrorBlock:reqErrorDic];
            NSLog(@"Error: %@", error);
         }];
    } else if ([type isEqualToString:@"GET"]){
        [manager GET:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [self completedWithResponse:operation.response error:nil data:responseObject withSuccessBlock:reqSuccessDic ErrorBlock:reqErrorDic];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
            [self completedWithResponse:operation.response error:error data:nil withSuccessBlock:reqSuccessDic ErrorBlock:reqErrorDic];
        }];
    } else if ([type isEqualToString:@"PUT"]){
        [manager PUT:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [self completedWithResponse:operation.response error:nil data:responseObject withSuccessBlock:reqSuccessDic ErrorBlock:reqErrorDic];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
            [self completedWithResponse:operation.response error:error data:nil withSuccessBlock:reqSuccessDic ErrorBlock:reqErrorDic];
        }];
    }
    else{
        [manager  DELETE:path parameters:path success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [self completedWithResponse:operation.response error:nil data:responseObject withSuccessBlock:reqSuccessDic ErrorBlock:reqErrorDic];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
            [self completedWithResponse:operation.response error:error data:nil withSuccessBlock:reqSuccessDic ErrorBlock:reqErrorDic];
        }];
    }
    manager=nil;
    
}



 
 - (void)completedWithResponse:(NSHTTPURLResponse *)response error:(NSError *)error data:(NSDictionary *)returnDict withSuccessBlock:(NetworkManagerCompletionBlock)completeSuccessBlock ErrorBlock:(NetworkManagerFailureBlock)completeErrorBlock
{
     if (response.statusCode == 200)
    {
        completeSuccessBlock(returnDict);
    }
    else
    {
        completeErrorBlock(error);
    }
}

 

 

@end
