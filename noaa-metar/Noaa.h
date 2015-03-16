//
//  Noaa.h
//  noaa-metar
//
//  Created by Thiago Elias Rezende Silva on 16/03/15.
//  Copyright (c) 2015 Thiago Elias Rezende Silva. All rights reserved.
//

@interface Noaa : NSObject

@property NSString *icao;
extern const NSString *BASE_URL_METAR;
extern const NSString *BASE_URL_DECODED;
extern const NSString *BASE_URL_TAF;

extern const NSString *TYPE_METAR;
extern const NSString *TYPE_DECODED;
extern const NSString *TYPE_TAF;

- (NSString*)getMetar;
- (NSString *)getDecoded;
- (NSString *)getTAF;

@end;
