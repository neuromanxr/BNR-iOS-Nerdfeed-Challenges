//
//  BNRWebViewController.m
//  BNR-iOS-Nerdfeed
//
//  Created by Kelvin Lee on 8/10/14.
//  Copyright (c) 2014 Kelvin. All rights reserved.
//

#import "BNRWebViewController.h"

@interface BNRWebViewController () <UIWebViewDelegate>

@property (nonatomic) UIWebView *webView;

@end

@implementation BNRWebViewController

- (void)loadView
{
    self.webView = [[UIWebView alloc] init];
    self.webView.scalesPageToFit = YES;
    self.webView.delegate = self;
    self.view = self.webView;
    
}

- (void)viewDidAppear:(BOOL)animated
{
    // silver challenge ch21
    
    [[self navigationController] setToolbarHidden:NO];
    [self makeButtons];
    [[self navigationController].toolbar setItems:self.buttons animated:YES];
    
//    self.toolbar = [[UIToolbar alloc] init];
//    self.toolbar.frame = CGRectMake(0, self.navigationController.navigationBar.frame.size.height + self.navigationController.navigationBar.frame.origin.y, self.view.frame.size.width, 44);
    
//    [self makeButtons];
//    [self.toolbar setItems:self.buttons animated:YES];
//    [self.view addSubview:self.toolbar];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self updateToolbar];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self updateToolbar];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self updateToolbar];
}

// silver challenge ch21
- (void)makeButtons
{
    UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(prevPage)];
    UIBarButtonItem *forward = [[UIBarButtonItem alloc] initWithTitle:@"Forward" style:UIBarButtonItemStylePlain target:self action:@selector(nextPage)];
    
    if (!_buttons) {
        _buttons = [[NSMutableArray alloc] init];
    }
    [self.buttons removeAllObjects];
    
    if (self.webView.canGoBack == YES) {
        [self.buttons addObject:back];
    }
    [self.buttons addObject:flex];
    
    if (self.webView.canGoForward == YES) {
        [self.buttons addObject:forward];
    }
}

- (void)updateToolbar
{
//    self.toolbar.frame = CGRectMake(0, self.navigationController.navigationBar.frame.size.height + self.navigationController.navigationBar.frame.origin.y, self.view.frame.size.width, 44);
    [self makeButtons];
    [[self navigationController].toolbar setItems:self.buttons animated:YES];
    [[self navigationController].toolbar setNeedsLayout];
}

- (void)prevPage
{
    [self.webView goBack];
}

- (void)nextPage
{
    [self.webView goForward];
}
// silver challenge ch21 end

- (void)setURL:(NSURL *)URL
{
    _URL = URL;
    if (_URL) {
        NSURLRequest *req = [NSURLRequest requestWithURL:_URL];
        [(UIWebView *)self.view loadRequest:req];
    }
}

@end
