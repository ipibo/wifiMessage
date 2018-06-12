# WifiMessage

WifiMessage is a way to spread hidden messages by using SSIDS to spread this messages
![image](images/image1.JPG)

Video  Video  Video  Video  Video  Video  Video  Video  Video  Video  Video  Video  Video  Video  Video  Video  Video  Video  Video  Video  Video  Video  Video  Video  Video  Video  Video  Video  Video  Video  Video  Video  Video  Video  Video 

---

### Requirements:

##### Hardware
* ESP8266

![wemos](https://ae01.alicdn.com/kf/HTB17wPunamWBuNjy1Xaq6xCbXXa5/WEMOS-D1-mini-Pro-V1-1-0-16-M-bytes-externe-antenne-connector-ESP8266-WIFI-Internet.jpg_640x640.jpg)

(tested on a Wemos d1 mini pro, not tested on other ESP8266 modules)

* Android smartphone
* Powerbank

![powerbank](https://images.hema.nl/products/usb-20-powerbank-200-mah-39500008-productzoom_rd.jpg)
(I used [this](https://goo.gl/5Dv75q) powerbank, mainly because it was small)

* USB cable to power the ESP8266
* (Strong) Magnet

![Magnet](https://www.magnetenkopen.nl/wp-content/uploads/2015/05/076_0083_klein.jpg)

(I used [this](https://goo.gl/87LW1D) magnet, because it was the right size compared to my powerbank)

##### Software:

* Arduino IDE
* Processing IDE (with Android mode installed & enabled)

---

### Included in this git:

<!-- (Still have to change this names) -->

**test_wifif_ssids_with_prefix**

To generate the message to for the ESP8266

**wifiMessage_ESP8266**

The ESP8266 Sketch

**wifiMessage**

This is the app itself.

---

### How to install:

### Generate the prefixes

### On the ESP8266

Open *wifiMessage_ESP8266* with the Arduino environment

Use this instructions on [this](https://github.com/esp8266/Arduino#installing-with-boards-manager) Github to be install the ESP8266 board into the Arduino IDE.

After installation of the board go *tools -> boards* and select **Wemos D1 Mini Pro**

On top of the file change "\*ssids[10]" variable with the *SSIDS* generated by the Processing/python(?) sketch.

---

The format has to be like:

```
char *ssids[10] = {":/pF-0-56752048756e6", ":/pF-1-56e6365642074", ":/pF-2-7965617220696", ":/pF-3-f6e2e20687474", ":/pF-4-77772e66726f6", ":/pF-5-46566656e6465", ":/pF-6-2f656e2f63617", ":/pF-7-16e2d72696768", ":/pF-8-656e6465722d7", ":/pF-9-72d6172726573"};
 ```

Change the number inside of the "[]" to match the number of *SSIDS*. For this instance it is 10

Now upload the sketch to the *ESP 8266*.

### For the App

First enable *Android Mode* in Processing by clicking on the *JAVA* dropdown button in the upper right corner of the screen.

Open the "wifiMessage" Processing Sketch and make sure you have enabled *Android Mode*.

On your Android phone go to Settings -> About this Phone. And tap a couple of times on *Build number*. You now have enabled the so called *Developer options*.

Now go back to your setting, and here you see a new tab popped up called *Developer options*. Go to Developer options and enable "USB debugging".

Connect your phone to the computer and press on the upload button in the Processing IDE. This installs a new app on your phone called *wifiMessage*. 

This app does not work immidiately, you first have to give permissions to the app. To do this go to settings -> Apps -> wifiMessage. Here press the *Permissions* button, and allow it to use *Your location*.



<!--
1. Generate the SSIDS with the "test_wifif_ssids_with_prefix" Processing sketch.
2. Open wifiMessage_ESP8266 with the Arduino environment





. -->
