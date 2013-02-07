//
//  Comment.m
//  Weibuu
//
//  Created by zhang andy on 13-2-6.
//  Copyright (c) 2013年 com.andy. All rights reserved.
//

#import "Comment.h"

@implementation Comment

+ (NSMutableArray *)commentsWithJson:(id)json
{
    NSMutableArray *commentsArray = [[NSMutableArray alloc] initWithCapacity:20];
    NSArray *comments = [json objectForKey:@"comments"];
    for (id commentJson in comments) {
        Comment *commentEntity = [[Comment alloc] init];
        commentEntity.createdAt = [commentJson objectForKey:@"created_at"];
        commentEntity.id = [commentJson objectForKey:@"id"];
        commentEntity.text = [commentJson objectForKey:@"text"];
        commentEntity.source = [commentJson objectForKey:@"source"];
        commentEntity.mid = [commentJson objectForKey:@"mid"];
        
        NSDictionary *userDict = [commentJson objectForKey:@"user"];
        User *userEntity = [[User alloc] init];
        
        userEntity.idNo = [[userDict objectForKey:@"id"] intValue];
        userEntity.name = [userDict objectForKey:@"name"];
        userEntity.profileImageUrl = [userDict objectForKey:@"profile_image_url"];
        userEntity.verified = [[userDict objectForKey:@"verified"] boolValue];
        
        commentEntity.user = userEntity;
        
        [commentsArray addObject:commentEntity];
    }
    return commentsArray;
}
@end
