1. This project is build with flutter 2.10.5
2. For android I have test from android 8 to 12.
3. I couldn't test any ios device since my friend who has a mac is affected by corona virus! Hopefully It will work
   well on ios because in this app I used those dependency which support both android and ios.
4. For caching I used shared pref. When cache get expired, new response will load and save this response to cache, if not
   then load from cache. But here behind a another logic. If there is no internet connectivity is available then load expired
   or non-expired cache for ensuring offline browsing. If no internet and no cache is available then an error will show.
5. Three types of filter individually cached.
6. Plug in cached network image is used here ensuring show image in offline.
7. Standard design pattern maintain with dependency injection. 
8. Cubit(which is basically superclass of bloc) is used here.
9. For faster parsing, isolate is used in this application.
10. Application filter config will be saved every time when it changed, so when app is closed it will be saved for next
    start.
11. App can monitor device connection status(like wifi and mobile) & perform it's desired task.
12. Cache duration or api config can be changed from app constant.


Thank you very much for this test !
Mustafa Hamim
