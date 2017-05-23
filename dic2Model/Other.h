//
//  Other.h
//  dic2Model
//
//  Created by hong on 17/5/23.
//  Copyright © 2017年 hong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Relative.h"

@interface Other : NSObject
@property (nonatomic ,copy) NSString *company;
@property (nonatomic ,copy) NSString *school;
@property (nonatomic ,strong) Relative *relative;




@end
