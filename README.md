# perplexer
A Plex Server Builder

 - Are you sick and tired of plex not picking up the song artists or album covers correctly?
 - Are you forced into downloading songs from sketchy websites?
 - Do you have that one playlist with 200+ songs that you just want to work on Plex?
If you answered yes to one of those questions, then boy do I have the script for you!
# What?
You read that right! Perplexer can download, and sort your playlists into folders Plex will accept. As a failsafe, Perplexer will inject metadata from YouTube. What? You don't have a YouTube playlist? That is fine! Just use tunemymusic.com (#NOTSPON) to convert the playlist! Then, simply download our scripts folder and place it where ever! Just run 
```
export id='[YouTube-Playlist-ID]' // You can find the playlist id after &list: https://www.youtube.com/watch?v=XXXXXXXXXXX&list=PL*
export loc='[Plex-Library-Location or Output-Path]'
make download // Downloads playlist
make missing // Lists missing songs
make meta // Inject Metadata
make plex // Sort mp3s into folder layout Plex can read
```
However, If you happen to have other songs from external media, place them in a folder named ext/ and run make external

# Expected folder layout
The scripts expect the files to be in this layout:
```
. // 
├── ext // External Media
├── missing // File that contains missing songs
├── music // Plex Library Folder (If Plex is used) 
├── scripts // Folder where scripts are
└── tmp // Folder used while downloading songs or if Plex isn't used.
```
