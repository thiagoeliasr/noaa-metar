//
//  Noaa.m
//  noaa-metar
//
//  Created by Thiago Elias Rezende Silva on 16/03/15.
//  Copyright (c) 2015 Thiago Elias Rezende Silva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Noaa.h"

@implementation Noaa

NSString *BASE_URL_METAR = @"http://weather.noaa.gov/pub/data/observations/metar/stations/";
NSString *BASE_URL_DECODED = @"http://weather.noaa.gov/pub/data/observations/metar/decoded/";
NSString *BASE_URL_TAF = @"http://weather.noaa.gov/pub/data/forecasts/taf/stations/";

NSString *TYPE_METAR = @"METAR";
NSString *TYPE_DECODED = @"DECODED";
NSString *TYPE_TAF = @"TAF";

- (NSString*)getInformation:(NSString *)type;
{
    NSString *strMetar = nil;
    NSString *strUrl = nil;
    NSError *err = nil;
    
    if(_icao) {
        if ([type isEqualToString:TYPE_METAR])
            strUrl = BASE_URL_METAR;
        else if ([type isEqualToString:TYPE_DECODED])
            strUrl = BASE_URL_DECODED;
        else if ([type isEqualToString:TYPE_TAF])
            strUrl = BASE_URL_TAF;
        else
            NSLog(@"Invalid type");
        
        if (strUrl) {
            NSURL *finalURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@.TXT",
                                                strUrl,[_icao uppercaseString]]];
        
            if(finalURL) {
                strMetar = [NSString stringWithContentsOfURL:finalURL
                                                encoding:NSUTF8StringEncoding error:&err];
                if (err) {
                    strMetar = nil;
                    NSLog(@"An error ocurred while trying to fetch Metar for [%@]", _icao);
                }
            }
        }
        
    } else {
        NSLog(@"Airport ICAO is necessary to fetch METAR information.");
    }
    
    return strMetar;
}

- (NSString *)getMetar;
{
    return [self getInformation:TYPE_METAR];
}

- (NSString *)getDecoded;
{
    return [self getInformation:TYPE_DECODED];
}

- (NSString *)getTAF;
{
    return [self getInformation:TYPE_TAF];
}

@end