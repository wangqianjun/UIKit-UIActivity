//
//  ViewController.m
//  UIKit-UIActivity
//
//  Created by 王钱钧 on 14-9-5.
//  Copyright (c) 2014年 王钱钧. All rights reserved.
//

#import "ViewController.h"
#import "MapActivity.h"
#import "Landmark.h"


@interface ViewController ()
{
    NSArray *_landmarks;
    NSMutableIndexSet *_selectedIndices;
}

@end

@implementation ViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle: style];
    if (self) {
        //31.9731338759,118.7570571899
        _landmarks = @[
                       [Landmark landmarkWithName:@"南京有货" latitude:31.9731338759 longitude:118.7570571899],
                       
                       //39.9097362345,116.3960266113
                       [Landmark landmarkWithName:@"北京有货" latitude:39.9097362345 longitude:116.3960266113],
                       
                       //31.2198482262,121.5032958984
                       [Landmark landmarkWithName:@"上海有货" latitude:31.2198482262 longitude:121.5032958984]
                       ];
        _selectedIndices = [[NSMutableIndexSet alloc] init];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"YOHO!";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(handleActionButton:)];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_landmarks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    Landmark *landmark = [_landmarks objectAtIndex:indexPath.row];
    [[cell textLabel] setText:[landmark name]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    if ([_selectedIndices containsIndex:indexPath.row]) {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    } else {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([_selectedIndices containsIndex:indexPath.row]) {
        [_selectedIndices removeIndex:indexPath.row];
    } else {
        [_selectedIndices addIndex:indexPath.row];
    }
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
}
// ---------------------------------------------------------
#pragma mark - Private methods
// ---------------------------------------------------------

- (void)handleActionButton:(id)sender
{
    NSMutableArray *activityItems = [NSMutableArray array];
    [_landmarks enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([_selectedIndices containsIndex:idx]) {
            [activityItems addObject:[(Landmark*)obj mapItem]];
        }
    }];
    
    if ([activityItems count] > 0) {
        NSArray *applicationActivities = @[
                [[MapActivity alloc]init]
                                           ];
        UIActivityViewController *avc = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:applicationActivities];
        [self presentViewController:avc animated:YES completion:NULL];
    }
}

@end
