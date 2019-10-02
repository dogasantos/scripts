# scripts
workflow scripts and tools


# parseuri usage and expected output:
urllist.txt content:
http://www.hosturl.here:8080/any/path/here.html
https://ww2.other.here/secret/dir/with/secret/stuff.js


cat urllist.txt | parseuri
http    www.hosturl.here  8080   /any/path/here.html
https   ww2.other.here    80    /secret/dir/with/secret/stuff.js
...

# hostformuri usage and expected output:
urllist.txt content:
http://www.hosturl.here:8080/any/path/here.html
https://ww2.other.here/secret/dir/with/secret/stuff.js
...

cat urllist.txt | hostformuri
www.hosturl.here
ww2.other.here
...
