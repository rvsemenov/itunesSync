//
//  FileMng.hpp
//  itunesSync
//
//  Created by Roman Semenov on 27.12.15.
//  Copyright © 2015 Roman. All rights reserved.
//

#ifndef FileMng_hpp
#define FileMng_hpp

#include <stdio.h>
#include "ItunesParser.hpp"
#include <set>

typedef std::vector<std::string> Files;

class FileMng
{
    CC_SYNTHESIZE(std::string, _SDFolder, SDFolder);
    CC_SYNTHESIZE(std::string, _plKey, PlKey);
public:
    bool init(ItunesParser* p);
    void scan();
    void sync(bool isDebug);
    void updatePlaylists();
    void createPlaylist(ItunesPlaylist* pList);
private:
    bool icompare(const std::string& a,const std::string& b, bool& flag);
    void saveTrack(ItunesTrack* t, bool isEmpty);
    void getFilesFromPathRecursively(std::vector<std::string>& files, const std::string& path);
    
    ItunesParser* parser;
    
    Files _filesToDelete;
    Files _playlistToDelete;
    std::set<ItunesTrack*> _tracks;
    ItunesPlaylists playlists;
    int _fileToCopyCount;
};
#endif /* FileMng_hpp */
