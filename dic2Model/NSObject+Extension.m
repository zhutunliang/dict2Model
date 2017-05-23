//
//  NSObject+Extension.m
//  dic2Model
//
//  Created by hong on 17/5/23.
//  Copyright © 2017年 hong. All rights reserved.
//

#import "NSObject+Extension.h"
#import <objc/runtime.h>

@implementation NSObject (Extension)


-(void) setdict:(NSDictionary *)dict
{
    Class c = self.class;
    while (c && c != [NSObject class] ) {
        unsigned int outCout = 0;
      Ivar *ivars =   class_copyIvarList(c, &outCout);
        for (NSInteger i = 0 ; i < outCout; i ++) {
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivars[i])];
           key =  [key substringFromIndex:1];
            id value = dict[key];
            if (!value) {
                continue;
            }
            NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivars[i])];
    //            NSRange range = [type rangeOfString:@"@"];                // 是对象
//                type = [type substringFromIndex:2];
            type = [type substringWithRange:NSMakeRange(2, type.length - 3)];
                if (![type hasPrefix:@"NS"]) {
                    // 不是系统对象
                    Class someClass = NSClassFromString(type);
                  value =   [self someClass:someClass Dict:value];
                }
            else if ([type isEqualToString:@"NSArray"])
            {
                // 是数组
                NSLog(@"%@",key);
                Class someClass = NSClassFromString(key);
                NSMutableArray *resultArray = [NSMutableArray array];
                NSArray *array = (NSArray*)value;
                
                for (NSInteger  i = 0; i < array.count ;  i ++) {
                  [resultArray addObject: [self someClass:someClass Dict:array[i]]];
                }
                value = resultArray;
            }
            [self setValue:value forKey:key];
        }
        c = [c superclass];
        free(ivars);
    }
}

-(instancetype) someClass:(Class) someClass Dict :(NSDictionary *) dict
{
    id obj = [[someClass alloc] init];
    [obj setdict:dict];
    return obj;
}


@end
