import android.net.wifi.WifiManager;
import android.content.Context;
import android.net.wifi.ScanResult;
import java.util.List;

WifiManager wifi;     
List<ScanResult> results;

void setup() {
  fullScreen();
  wifi = (WifiManager) this.getActivity().getApplicationContext().getSystemService(Context.WIFI_SERVICE);
  results = wifi.getScanResults();
  fill(255);
}

int last_scan;

void draw() {
  if (millis() - last_scan > 1000) {
    results = wifi.getScanResults();
    last_scan = millis();
  }

  background(0);
  textAlign(LEFT);

  float y = 50;
  textSize(20);
  text("ssids: " + results.size(), 50, y+=50);
  String[] ssids = new String[results.size()];

  int counter = 0;
  fill(200, 100);
  for (ScanResult s : results) {
    text(s.SSID, 50, y+=40);
    ssids[counter++] = s.SSID;
  }

  getTheText(ssids);

  String theMessage = getTheText(ssids);
  theMessage= theMessage.replaceAll("[^a-zA-Z0-9]", "");
  String realMessage = convertHexToString(theMessage);

  if (theMessage.equals("nomessageFound")) {
    fill(255, 50);
    textSize(45);
    for (int i =0; i < height; i+=40) {
      text("NO MESSAGE FOUND YET", -20, i);
      text("NO MESSAGE FOUND YET", 460, i);
      text("NO MESSAGE FOUND YET", 940, i);
    }
  }

  if (realMessage != "foutje") {
    fill(255);
    textSize(55);
    text("The message", 100, 100);
    text(theMessage, 100, 200, width-200, 500);
    text(realMessage, 100, 800, width-200, height-100);
  } else {

    fill(255, 50);
    textSize(45);
    for (int i =0; i < height+40; i+=40) {
      text("NO MEANING FOUND YET", 20, i);
      text("NO MEANING FOUND YET", 500, i);
      text("NO MEANING FOUND YET", 980, i);
    }
  }


  if (mousePressed) {
    background(255, 0, 0);
    textAlign(CENTER);
    textSize(100);
    fill(255,100);
    text("RELOAD",width/2,height/2);
    results = wifi.getScanResults();
  }
}
