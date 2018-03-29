# MozCache (Bashscript)
Simple shell script to perform forensic analysis of the Mozilla-Browsers cache (Firefox, Iceweasel and Seamonkey).

The script orders by date the files cached from a browser of the Mozilla family using the Cache 2 version. Together with the name of each file the script generates another file with the suffix "_metadata" with all the metadata information, download URL, size , server response code, HTTP protocol, expiration date, etc.

Run the script and enter a cache directory. If the user has a profile in the standard routes, it will be shown.
```
$ bash mozcache.sh 
Mozilla profiles cache directories found:

2014-08-15 00:47:02.403005545 +0200 /home/user/.cache/mozilla/firefox/4wg8s8jh.default
2018-01-17 19:06:36.788369163 +0100 /home/user/.cache/mozilla/firefox/5cp0rnwg.default
2018-01-17 19:02:44.585044984 +0100 /home/user/.cache/mozilla/firefox/87plgdtd.default
2014-07-05 00:35:11.338496398 +0200 /home/user/.cache/mozilla/firefox/8jj26wgs.default
2018-03-29 02:43:35.700103218 +0200 /home/user/.cache/mozilla/firefox/8wkejxi8.default
2016-02-15 21:55:10.512948007 +0100 /home/user/.cache/mozilla/firefox/czgxbzqe.default
2014-08-14 22:34:37.017763346 +0200 /home/user/.cache/mozilla/firefox/dq3l8pqo.default
2017-06-22 22:15:33.655428291 +0200 /home/user/.cache/mozilla/firefox/enmhte3j.default
2014-07-05 01:53:27.840783875 +0200 /home/user/.cache/mozilla/firefox/fu4s3k7b.default
2014-07-03 21:18:27.438401953 +0200 /home/user/.cache/mozilla/firefox/hs7mylo1.default
2014-07-05 00:38:20.964444484 +0200 /home/user/.cache/mozilla/firefox/i21pueej.default
2016-04-10 17:20:30.987988747 +0200 /home/user/.cache/mozilla/firefox/n78aixv9.default
2014-08-14 22:33:40.041315007 +0200 /home/user/.cache/mozilla/firefox/uha6gavb.default
2016-04-10 17:30:20.899882264 +0200 /home/user/.cache/mozilla/firefox/wnms415y.default
2016-04-10 18:00:19.575033506 +0200 /home/user/.cache/mozilla/firefox/x7uvgkeb.default
2016-10-22 17:04:57.889181389 +0200 /home/user/.cache/mozilla/firefox/z5thphqz.default
2018-03-27 21:31:53.793677603 +0200 /home/user/.cache/mozilla/seamonkey/1j0mk6zq.default
2016-03-02 19:17:19.762833514 +0100 /home/user/.cache/mozilla/seamonkey/zwuryy49.default

Cache directory path to analyze: /home/user/.cache/mozilla/seamonkey/zwuryy49.default
Output directory path (/home/user/mozcache): /home/user/mozcache_zwuryy49.default

$ ls /home/user/mozcache_zwuryy49.default
17-01-2018
22-03-2018
23-03-2018
24-03-2018
25-03-2018
26-03-2018
27-03-2018
28-03-2018
29-03-2018
```

Analyze the contents of the cache. Example with compressed file.
```
## Content and Metadata

$ file /home/user/mozcache_zwuryy49.default/17-01-2018/63F48F4F7F1BC3195F5AB831F9794F3DBA2D30E1
mozcache/17-01-2018/63F48F4F7F1BC3195F5AB831F9794F3DBA2D30E1: gzip compressed data, from Unix

$ zcat /home/user/mozcache_zwuryy49.default/17-01-2018/63F48F4F7F1BC3195F5AB831F9794F3DBA2D30E1
{"action-list":"https://normandy.cdn.mozilla.net/api/v1/action/","action-signed":"https://normandy.cdn.mozilla.net/api/v1/action/signed/","approvalrequest-list":"https://normandy.cdn.mozilla.net/api/v1/approval_request/","classify-client":"https://normandy.cdn.mozilla.net/api/v1/classify_client/","filters":"https://normandy.cdn.mozilla.net/api/v1/filters/","recipe-list":"https://normandy.cdn.mozilla.net/api/v1/recipe/","recipe-signed":"https://normandy.cdn.mozilla.net/api/v1/recipe/signed/","reciperevision-list":"https://normandy.cdn.mozilla.net/api/v1/recipe_revision/"}
gzip: mozcache/17-01-2018/63F48F4F7F1BC3195F5AB831F9794F3DBA2D30E1: decompression OK, trailing garbage ignored


## Metadata.

$ cat /home/user/mozcache_zwuryy49.default/17-01-2018/63F48F4F7F1BC3195F5AB831F9794F3DBA2D30E1_metadata
a,:https://normandy.cdn.mozilla.net/api/v1/
necko:classified
strongly-framed
security-info
FnhllAKWRHGAlo+ESXykKAAAAAAAAAAAwAAAAAAAAEaphjojH6pBabDSgSnsfLHeAAQAAgAAAAAAAAAAAAAAAAAAAAAB4vFIJp5wRkeyPxAQ9RJGKPqbqVvKO0mKuIl8e
request-method
request-Accept
application/json
response-head
HTTP/1.1 200 OK
Allow: GET, HEAD, OPTIONS
Cache-Control: public, max-age=30
Content-Encoding: gzip
Content-Security-Policy: base-uri 'none'; default-src 'self' https://normandy-cloudfront.cdn.mozilla.net/; block-all-mixed-content; worker-src 'none'; form-action 'self'; object-src 'none'; frame-src 'none'; report-uri /__cspreport__
Content-Type: application/json
Date: Wed, 17 Jan 2018 18:05:33 GMT
Public-Key-Pins: max-age=86400; pin-sha256="WoiWRyIOVNa9ihaBciRSC7XHjliYS9VwUGOIud4PB18="; pin-sha256="r/mIkG3eEpVdm+u/ko/cwxzOMo1bk4TyHIlByibiA5E="; pin-sha256="YLh1dUR9y6Kja30RrAn7JKnbQG/uEtLMkBgFF2Fuihg="; pin-sha256="sRHdihwgkaib1P1gxX8HFszlD+7/gTfNvuAybgLPNis=";
strict-transport-security: max-age=31536000; includeSubDomains
Vary: Accept
X-Cached: HIT
x-content-type-options: nosniff
X-Frame-Options: DENY
x-xss-protection: 1; mode=block
Content-Length: 173
original-response-headers
Allow: GET, HEAD, OPTIONS
Cache-Control: public, max-age=30
Content-Encoding: gzip
Content-Security-Policy: base-uri 'none'; default-src 'self' https://normandy-cloudfront.cdn.mozilla.net/; block-all-mixed-content; worker-src 'none'; form-action 'self'; object-src 'none'; frame-src 'none'; report-uri /__cspreport__
Content-Type: application/json
Date: Wed, 17 Jan 2018 18:05:33 GMT
Public-Key-Pins: max-age=86400; pin-sha256="WoiWRyIOVNa9ihaBciRSC7XHjliYS9VwUGOIud4PB18="; pin-sha256="r/mIkG3eEpVdm+u/ko/cwxzOMo1bk4TyHIlByibiA5E="; pin-sha256="YLh1dUR9y6Kja30RrAn7JKnbQG/uEtLMkBgFF2Fuihg="; pin-sha256="sRHdihwgkaib1P1gxX8HFszlD+7/gTfNvuAybgLPNis=";
strict-transport-security: max-age=31536000; includeSubDomains
Vary: Accept
X-Cached: HIT
x-content-type-options: nosniff
X-Frame-Options: DENY
x-xss-protection: 1; mode=block
Content-Length: 173
Connection: keep-alive
net-response-time-onstart
net-response-time-onstop


## Mozilla generates the name of the files using the sha1 hash of the URL.

$ head -n1 /home/user/mozcache_zwuryy49.default/17-01-2018/63F48F4F7F1BC3195F5AB831F9794F3DBA2D30E1_metadata
a,:https://normandy.cdn.mozilla.net/api/v1/

$ echo -n "a,:https://normandy.cdn.mozilla.net/api/v1/" | sha1sum 
63f48f4f7f1bc3195f5ab831f9794f3dba2d30e1  -
```
