# simple-andorid-project-no-andorid-studio
Simple Andorid Project - No Andorid Studio


Baised on another project:
`https://github.com/jbendtsen/tiny-android-template`



0. install this packages:
```
sudo apt install android-sdk-platform-tools android-sdk-build-tools
```

1. generate keystore
```
keytool -genkey -v -keystore my-release-key.keystore -alias alias_name -keyalg RSA -keysize 2048 -validity 10000
```
use password 123456

You can change password in Makefile


2. make project
```
make
```


3. Finished apk is located in:
```
./build/app.apk
```


