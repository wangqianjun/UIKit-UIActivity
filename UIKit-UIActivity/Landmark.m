//
//  Landmark.m
//  UIKit-UIActivity
//
//  Created by 王钱钧 on 14-9-10.
//  Copyright (c) 2014年 王钱钧. All rights reserved.
//

#import <AddressBook/AddressBook.h>
#import "Landmark.h"

@implementation Landmark

+ (instancetype)landmarkWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude
{
    Landmark *landmark = [[Landmark alloc] init];
    [landmark setName:name];
    [landmark setLatitude:latitude];
    [landmark setLongigude:longitude];
    
    return landmark;
}

- (MKMapItem *)mapItem
{
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake([self latitude], [self longigude]);
    NSDictionary *addressDic = @{(__bridge NSString *)kABPersonAddressStreetKey: [self name]};
    return [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:coordinate addressDictionary:addressDic]];
}
@end
