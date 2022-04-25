# simple-andorid-project-no-andorid-studio
Simple Andorid Project - No Andorid Studio

please generate key first before use make
```
keytool -genkey -v -keystore my-release-key.keystore -alias alias_name -keyalg RSA -keysize 2048 -validity 10000
```
use password 123456, You can change password in Makefile


Baised on another project:
`https://github.com/jbendtsen/tiny-android-template`


finished build apk is located in: `./build/app.apk`
