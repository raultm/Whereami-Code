//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Raul Tierno Magro on 26/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WhereamiViewController.h"

@interface WhereamiViewController ()

@end

@implementation WhereamiViewController

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        //Create location manager object
        locationManager = [[CLLocationManager alloc] init];
        
        //There will be a warning from this line of code; ignore it from now
        [locationManager setDelegate:self];
        
        //And we want it to be as accurate as possible regardless of how much time/power it takes
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
        //Set Distance Filter to 50 meters
        [locationManager setDistanceFilter:50];
        
        //Silver - is it ok?
        [locationManager startUpdatingHeading];
        
        //Tell our manager to start looking for its location immediately
        [locationManager startUpdatingLocation];
    }
    return self;
}

- (void) locationManager:(CLLocationManager *)manager 
     didUpdateToLocation:(CLLocation *)newLocation 
            fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@", newLocation);
}

- (void) locationManager:(CLLocationManager *) manager 
        didFailWithError:(NSError *)error
{
    NSLog(@"Could not find location: %@", error);
}

- (void)locationManager:(CLLocationManager *)manager 
       didUpdateHeading:(CLHeading *)newHeading
{
    NSLog(@"%@", newHeading);
}



@end
