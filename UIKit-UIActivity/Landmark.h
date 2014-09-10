//
//  Landmark.h
//  UIKit-UIActivity
//
//  Created by 王钱钧 on 14-9-10.
//  Copyright (c) 2014年 王钱钧. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <Foundation/Foundation.h>

@interface Landmark : NSObject

@property (nonatomic) CGFloat latitude;
@property (nonatomic) CGFloat longigude;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, readonly) MKMapItem *mapItem;

+ (instancetype)landmarkWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude;

@end
