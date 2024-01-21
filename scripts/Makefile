.ONESHELL:
.SILENT:
help:
	cat ../README.md
meta:
	cd ../tmp
	../scripts/meta.sh 
plex:
	../scripts/plexsort.sh ${loc}/music
	cd ../

download:
	cd ../
	mkdir tmp
	cd tmp
	yt-dlp --write-info-json --ignore-no-formats-error https://youtube.com/playlist?list=${id} -x --audio-format mp3 --cache-dir ../cache
	rm 'Trail Mix'*
external:
	
missing:
	cd ../tmp
	../scripts/verify.sh > missing
	echo "You are missing $$(../scripts/verify.sh | wc -l) songs." >> count
	echo "Here is the list of the songs you are missing along with the YouTube Video ID:" >> count
	cat missing >> count
	echo "Please obtain the songs and place them in ext/. Then run make external." >> count
	echo "If you cannot find the songs, it simply was not meant to be. Please remove it from the playlist and sync." >> count
	echo "The list of missing songs was moved to ${loc}/missing" >> count
	cat count | less
	rm count
	mv missing ..
clean:
	rm -rf tmp
