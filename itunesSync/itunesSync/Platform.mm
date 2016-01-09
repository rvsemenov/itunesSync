//
//  Platform.cpp
//  itunesSync
//
//  Created by Roman Semenov on 27.12.15.
//  Copyright © 2015 Roman. All rights reserved.
//

#include "Platform.h"
#import <Foundation/Foundation.h>

void urlToPath(std::string& urlStr)
{
    NSURL* url = [NSURL URLWithString:[NSString stringWithUTF8String:urlStr.c_str()]];
    urlStr = [[url path] UTF8String];
}

void createFolders(const std::string& urlStr)
{
    NSFileManager* fm = [[NSFileManager alloc] init];
    [fm createDirectoryAtPath:[NSString stringWithUTF8String:urlStr.c_str()]
  withIntermediateDirectories:YES
                   attributes:nil
                        error:nil];
}

void scanPath(std::vector<std::string>& files, const std::string& path)
{
    NSString* sPath = [NSString stringWithUTF8String:path.c_str()];
    
    BOOL isDir;
    [[NSFileManager defaultManager] fileExistsAtPath:sPath isDirectory:&isDir];
    if (isDir) {
        NSArray *contentOfDirectory=[[NSFileManager defaultManager] contentsOfDirectoryAtPath:sPath error:NULL];
        
        int contentcount = [contentOfDirectory count];
        int i;
        for(i=0;i<contentcount;i++)
        {
            NSString *fileName = [contentOfDirectory objectAtIndex:i];
            NSString *path = [sPath stringByAppendingFormat:@"%@%@",@"/",fileName];
            
            if([[NSFileManager defaultManager] isDeletableFileAtPath:path])
            {
                scanPath(files, [path UTF8String]);
            }
        }
    }else{
        files.push_back(path);
    }
}

void copyFile(const std::string& sorce, const std::string& sdFolder)
{
//    NSString* sorceStr = [NSString stringWithUTF8String:sorce.c_str()];
//    NSLog(@"sorceStr =%@",sorceStr);
//    
//    NSURL* sUrl = [NSURL URLWithString:sorceStr];
//    
//    NSString* srt = @"Itunes/Music/";
//    
//    NSRange range = [sorceStr rangeOfString:srt options:NSLiteralSearch];
//    range.length += range.location;
//    range.location = 0;
//    
//    NSLog(@"location %lu length=%lu",(unsigned long)range.location,(unsigned long)range.length);
//    
//    NSString* dest = [NSString stringWithUTF8String:sdFolder.c_str()];
//    dest = [dest stringByAppendingString:@"/"];
//    
//    NSLog(@"dest =%@",dest);
//    NSLog(@"add =%@",[sorceStr stringByReplacingCharactersInRange:range withString:@""]);
//    dest = [dest stringByAppendingString:[sorceStr stringByReplacingCharactersInRange:range withString:@""]];
//    
//    NSLog(@"2dest =%@",dest);
//    //[sorceStr
//     
//     NSURL* destination = [NSURL URLWithString:dest];
//    
//    NSLog(@"url dest =%@",[destination absoluteString ]);
//    [[NSFileManager defaultManager] copyItemAtURL:sUrl toURL:destination error:nil];
    [[NSFileManager defaultManager] copyItemAtPath:[NSString stringWithUTF8String:sorce.c_str()] toPath:[NSString stringWithUTF8String:sdFolder.c_str()] error:nil];
}