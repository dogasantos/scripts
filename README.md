
parseuri usage and expected output: <br>
urllist.txt content: <br>
http://www.hosturl.here:8080/any/path/here.html  <br>
https://ww2.other.here/secret/dir/with/secret/stuff.js <br>
 <br>
<br>
  cat urllist.txt | parseuri <br>
  http    www.hosturl.here  8080   /any/path/here.html <br>
  https   ww2.other.here    80    /secret/dir/with/secret/stuff.js <br>
  ... <br>

hostformuri usage and expected output:
  urllist.txt content:
  http://www.hosturl.here:8080/any/path/here.html
  https://ww2.other.here/secret/dir/with/secret/stuff.js
  ...

  cat urllist.txt | hostformuri
  www.hosturl.here
  ww2.other.here
  ...
