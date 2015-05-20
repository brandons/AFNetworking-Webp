//
//  ViewController.m
//  AFNetworking Webp
//
//  Created by Brandon on 5/20/15.
//  Copyright (c) 2015 Brandon Schlenker. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.imageView setImageWithURL:[NSURL URLWithString:@"http://res.cloudinary.com/yerdle/image/upload/v1432133403/lhfer5lguvi76a9uedez.webp"] placeholderImage:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
