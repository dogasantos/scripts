
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
<br>
hostformuri usage and expected output:<br>
  urllist.txt content:<br>
  http://www.hosturl.here:8080/any/path/here.html<br>
  https://ww2.other.here/secret/dir/with/secret/stuff.js<br>
  ...<br>
<br>
  cat urllist.txt | hostformuri<br>
  www.hosturl.here<br>
  ww2.other.here<br>
  ...<br>
<br>
