//
//  main.m
//  noaa-metar
//
//  Created by Thiago Elias Rezende Silva on 16/03/15.
//  Copyright (c) 2015 Thiago Elias Rezende Silva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Noaa.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSString *icao = nil;
        char icaoChar[4];
        
        printf("ICAO: ");
        scanf("%s", icaoChar);
        
        icao = [NSString stringWithCString:icaoChar encoding:NSUTF8StringEncoding];
        
        if (icao) {
            Noaa *noaa = [[Noaa alloc] init];
            noaa.icao = icao;
            
            NSString *metarString = [noaa getMetar];
            NSString *tafString = [noaa getTAF];
            
            if (metarString) {
               NSLog(@"METAR: %@", metarString);
            }
            
            if (tafString) {
                NSLog(@"TAF: %@", tafString);
            }
        }
        
    }
    return 0;
}
