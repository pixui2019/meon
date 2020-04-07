iconv -c -f utf-8 -t GBK "list.html">test.html
sed -i "s/target=_blank>C:\page\/target=_blank>/g" test.html
move /y test.html list.html
start "" list.html