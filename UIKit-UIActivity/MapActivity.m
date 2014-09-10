//
//  MapActivity.m
//  UIKit-UIActivity
//
//  Created by 王钱钧 on 14-9-10.
//  Copyright (c) 2014年 王钱钧. All rights reserved.
//

#import<MapKit/MapKit.h>
#import "MapActivity.h"

@interface MapActivity ()

@property (nonatomic, copy)NSArray *mapItems;

@end

@implementation MapActivity

// override methods

- (NSString *)activityType
{
    return @"cn.nanking.yoho.mapsActivity";
}

- (NSString *)activityTitle
{
    return @"打开地图";
}

- (UIImage *)activityImage
{
    return [UIImage imageNamed:@"map-icon.png"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    for (id obj in activityItems) {
        if ([obj isKindOfClass:[MKMapItem class]]) {
            return YES;
        }
    }
    
    return NO;
    
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
    NSMutableArray *mapItems = [NSMutableArray array];
    for (id obj in activityItems) {
        if ([obj isKindOfClass:[MKMapItem class]]) {
            [mapItems addObject:obj];
        }
    }
    self.mapItems = mapItems;
}

- (void)performActivity
{
    [MKMapItem openMapsWithItems:self.mapItems launchOptions:nil];
    [self activityDidFinish:YES];
}



@end
