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




To test apk on Your andorid phone, You can copy app.apk file into phone memory (via usb, or via SDcard).
To install it successfully, You need to enable third party apps in security settings, and disable Play Protect (or just allow that single instalation when promped)

In case when You reinstall apk and You have an error "apk not installed" please uninstall this apk in application settings first, then try again.


tested on real andorid phone: Oppo A15s (Andorid 10)
