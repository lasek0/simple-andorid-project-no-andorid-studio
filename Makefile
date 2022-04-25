TOOLS_DIR=/usr/lib/android-sdk/build-tools/29.0.3
PLATFORM_DIR=/usr/lib/android-sdk/platforms/android-23

AAPT2=$(TOOLS_DIR)/aapt2
AAPT=$(TOOLS_DIR)/aapt
ZIPALING=$(TOOLS_DIR)/zipalign
DX=$(TOOLS_DIR)/dx
JAVA=java
JAVAC=javac
JAR=jar

#keytool -genkey -v -keystore my-release-key.keystore -alias alias_name -keyalg RSA -keysize 2048 -validity 10000
KEYSTORE="./my-release-key.keystore"
KS_PASS="123456"


all: clean link make

link:
	# clean directory
	mkdir -p build
	# compile resources
	$(AAPT2) compile -o ./build/res.zip --dir ./res/
	# generate R.java
	$(AAPT2) link --java ./build/ -o ./build/unaligned.apk --manifest ./AndroidManifest.xml -I $(PLATFORM_DIR)/android.jar ./build/res.zip

make:
	# compile sources
	$(JAVAC) -source 8 -target 8 -classpath $(PLATFORM_DIR)/android.jar -d ./build/ $(shell find ./src/ -name *.java) $(shell find ./build/ -name *.java)
	$(JAR) --create --file ./build/proj.jar -C ./build/ .
	# compile classes into DEX bytecode
	$(DX) --dex --output=./build/classes.dex ./build/proj.jar
	# create apk
	cp ./build/classes.dex .
	$(AAPT) add ./build/unaligned.apk classes.dex
	rm classes.dex
	$(ZIPALING) -f 4 ./build/unaligned.apk ./build/aligned.apk
	# sign apk
	$(JAVA) -Xmx1024M -Xss1m -jar $(TOOLS_DIR)/apksigner.jar sign --ks $(KEYSTORE) --ks-pass "pass:$(KS_PASS)" --min-sdk-version 15 --out ./build/app.apk ./build/aligned.apk

clean:
	rm -rf ./build/

