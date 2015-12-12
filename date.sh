#!/bin/bash

ad=`git log -1 --date=short --format="format:%ad"`
#echo ${ad}
if [ `uname` = "Linux" ]; then
	ru_ad=`LC_ALL=ru_RU.utf8 date -d ${ad} "+%e %B %Y"`
else
	# I'm gonna cry here
	ru_ad=`LANG=ru_RU date -jf "%Y-%m-%d" ${ad} "+%e %B %Y"`
fi
#echo ${ru_ad}
echo "\\gdef\\GITAuthorDate{"${ru_ad}"}"
