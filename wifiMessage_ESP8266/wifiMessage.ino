#include <ESP8266WiFi.h>

extern "C" {
#include "user_interface.h"
}

//String alfa = "1234567890qwertyuiopasdfghjkklzxcvbnm QWERTYUIOPASDFGHJKLZXCVBNM_";
String alfa = "*";
byte channel;
int number_of_ssids = 12;

//char *ssids[10] = {":/pF-0-56752048756e6", ":/pF-1-56e6365642074", ":/pF-2-7965617220696", ":/pF-3-f6e2e20687474", ":/pF-4-77772e66726f6", ":/pF-5-46566656e6465", ":/pF-6-2f656e2f63617", ":/pF-7-16e2d72696768", ":/pF-8-656e6465722d7", ":/pF-9-72d6172726573"};
//char *ssids[21] = {":/pF-0-56752048756e", ":/pF-1-672073656e74", ":/pF-2-656e63656420", ":/pF-3-746f206f6e65", ":/pF-4-207965617220", ":/pF-5-696e20707269", ":/pF-6-736f6e2e2068", ":/pF-7-747470733a2f", ":/pF-8-2f7777772e66", ":/pF-9-726f6e746c69", ":/pF-10-6e6564656665", ":/pF-11-6e646572732e", ":/pF-12-6f72672f656e", ":/pF-13-2f636173652f", ":/pF-14-68756d616e2d", ":/pF-15-726967687473", ":/pF-16-2d646566656e", ":/pF-17-6465722d7675", ":/pF-18-2d68756e672d", ":/pF-19-617272657374", ":/pF-20-65642"};
//char *ssids[3] = {":/pF-0-73686f727420",":/pF-1-6d6573736167",":/pF-2-6561        "};
char *ssids[12] = {":/pF-0-454947485420",":/pF-1-4d454d424552",":/pF-2-53204f462042",":/pF-3-524f54484552",":/pF-4-484f4f442046",":/pF-5-4f522044454d",":/pF-6-4f4352414359",":/pF-7-20464f554e44",":/pF-8-204755494c54",":/pF-9-5920414e4420",":/pF-10-53454e54454e",":/pF-11-43454       "};


// Beacon Packet buffer
uint8_t packet[128] = { 0x80, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff,     0xff, 0xff, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06,
                        0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0xc0, 0x6c,     0x83, 0x51, 0xf7, 0x8f, 0x0f, 0x00, 0x00, 0x00,
                        0x64, 0x00, 0x01, 0x04, 0x00, 0x14, 0x72, 0x72,     0x72, 0x72, 0x72, 0x72, 0x72, 0x72, 0x72, 0x72,
                        0x72, 0x72, 0x72, 0x72, 0x72, 0x72, 0x72, 0x72,     0x72, 0x72, 0x01, 0x08, 0x82, 0x84, 0x8b, 0x96,
                        0x24, 0x30, 0x48, 0x6c, 0x03, 0x01, 0x04
                      };

void setup() {
  delay(500);
  Serial.begin(115200);
  wifi_set_opmode(STATION_MODE);

  wifi_promiscuous_enable(1);
  Serial.println("Setup done");

}

void loop() {
  // random channel //

  for ( int i = 0 ; i < number_of_ssids; i++) {
    channel = random(1, 12);
    wifi_set_channel(channel);

    // random mac
    packet[10] = packet[16] = random(256);
    packet[11] = packet[17] = random(256);
    packet[12] = packet[18] = random(256);
    packet[13] = packet[19] = random(256);
    packet[14] = packet[20] = random(256);
    packet[15] = packet[21] = random(256);

    // Frases chiquito random
    memcpy( packet + 38, ssids[i], 20 );
    packet[70] = channel;
    wifi_send_pkt_freedom(packet, 71, 0);
    delay(1);
  }
}


