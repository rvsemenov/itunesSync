//
//  Platform.hpp
//  itunesSync
//
//  Created by Roman Semenov on 27.12.15.
//  Copyright © 2015 Roman. All rights reserved.
//

#ifndef Platform_hpp
#define Platform_hpp

#include <stdio.h>
#include <string>
#include <vector>

void urlToPath(std::string& urlStr);
void createFolders(const std::string& urlStr);
void scanPath(std::vector<std::string>& files, const std::string& path);
void copyFile(const std::string& sorce,const std::string& sdFolder);
#endif /* Platform_hpp */