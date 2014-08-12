//
//  BNRWebViewController.h
//  BNR-iOS-Nerdfeed
//
//  Created by Kelvin Lee on 8/10/14.
//  Copyright (c) 2014 Kelvin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRWebViewController : UIViewController

@property (nonatomic) NSURL *URL;
@property (nonatomic, copy) NSMutableArray *buttons;
@property (nonatomic) UIToolbar *toolbar;

@end
