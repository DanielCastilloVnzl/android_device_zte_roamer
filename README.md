CyanogenMod 10.1 device configuration for ZTE Avail.

How to build:
-------------

Initialize repo:

    repo init -u git://github.com/androidarmv6/android.git -b cm-10.1
    repo sync -j8

Compile:

    . build/envsetup.sh
    brunch roamer

Credit to @KonstaT for the original ZTE Blade files
