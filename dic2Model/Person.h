//
//  Person.h
//  dic2Model
//
//  Created by hong on 17/5/23.
//  Copyright © 2017年 hong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Other.h"
#import "Book.h"

@interface Person : NSObject

@property (nonatomic ,copy) NSString *age;
@property (nonatomic ,copy) NSString *height;
@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,strong) Other *other;
@property (nonatomic ,strong) NSArray <Book *>*Book;

@end
