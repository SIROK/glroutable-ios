//
//  Routable.h
//  Routable
//
//  Created by Clay Allsopp on 4/3/13.
//  Copyright (c) 2013 TurboProp Inc. All rights reserved.
//  Edited by Katsutoshi Tabata on 5/8/15
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class GLRouter;


typedef void (^RouterOpenCallback)(NSDictionary *params);


@interface GLRouterOptions : NSObject

+ (instancetype)routerOptionsWithPresentationStyle: (UIModalPresentationStyle)presentationStyle
                                   transitionStyle: (UIModalTransitionStyle)transitionStyle
                                     defaultParams: (NSDictionary *)defaultParams
                                            isRoot: (BOOL)isRoot
                                           isModal: (BOOL)isModal;

+ (instancetype)routerOptions;

+ (instancetype)routerOptionsAsModal;

+ (instancetype)routerOptionsWithPresentationStyle:(UIModalPresentationStyle)style;

+ (instancetype)routerOptionsWithTransitionStyle:(UIModalTransitionStyle)style;

+ (instancetype)routerOptionsForDefaultParams:(NSDictionary *)defaultParams;

+ (instancetype)routerOptionsAsRoot;

+ (instancetype)modal;

+ (instancetype)withPresentationStyle:(UIModalPresentationStyle)style;

+ (instancetype)withTransitionStyle:(UIModalTransitionStyle)style;

+ (instancetype)forDefaultParams:(NSDictionary *)defaultParams;

+ (instancetype)root;

- (GLRouterOptions *)modal;

- (GLRouterOptions *)withPresentationStyle:(UIModalPresentationStyle)style;

- (GLRouterOptions *)withTransitionStyle:(UIModalTransitionStyle)style;

- (GLRouterOptions *)forDefaultParams:(NSDictionary *)defaultParams;

- (GLRouterOptions *)root;

@property (readwrite, nonatomic, getter=isModal) BOOL modal;

@property (readwrite, nonatomic) UIModalPresentationStyle presentationStyle;

@property (readwrite, nonatomic) UIModalTransitionStyle transitionStyle;

@property (readwrite, nonatomic, strong) NSDictionary *defaultParams;

@property (readwrite, nonatomic, assign) BOOL shouldOpenAsRootViewController;

@end

@interface GLRouter : NSObject

@property (readwrite, nonatomic, strong) UINavigationController *navigationController;

- (void)setRootUrl:(NSString *)argUrl;


- (void)pop;


- (void)popViewControllerFromRouterAnimated:(BOOL)animated;

- (void)pop:(BOOL)animated;


@property (readwrite, nonatomic, assign) BOOL ignoresExceptions;

- (void)map:(NSString *)format toCallback:(RouterOpenCallback)callback;

- (void)map:(NSString *)format toCallback:(RouterOpenCallback)callback withOptions:(GLRouterOptions *)options;

- (void)map:(NSString *)format toController:(Class)controllerClass;

- (void)map:(NSString *)format toController:(Class)controllerClass withOptions:(GLRouterOptions *)options;

- (void)openExternal:(NSString *)url;

- (void)openUrl:(NSURL *)givenUrl;
- (void)openUrl:(NSURL *)givenUrl animated:(BOOL)animated;
- (void)openUrl:(NSURL *)givenUrl
       animated:(BOOL)animated
    extraParams:(NSDictionary *)extraParams;

- (void)open:(NSString *)url;

- (void)open:(NSString *)url animated:(BOOL)animated;

- (void)open:(NSString *)url animated:(BOOL)animated extraParams:(NSDictionary *)extraParams;

- (NSDictionary*)paramsOfUrl:(NSString*)url;

@end


@interface Routable : GLRouter

+ (instancetype)sharedRouter;


@end
