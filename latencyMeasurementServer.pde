import processing.serial.*;

Serial mSerial;
//int serialRate = 28800;
int serialRate = 9600;
int recieveBuffer;
char recieveChar;
boolean endMeasure = false;

void setup() {
  size(410, 100);
  mSerial = new Serial(this, "/dev/cu.usbmodem1421", serialRate);
}

void draw() {
  background(255);
  for (int i = 0; i < recieveBuffer + 1; i++) {
    fill(0);
    rect(10 + i * 40, 10, 30, 80);
  }
}

void serialEvent(Serial port) {
  if (!endMeasure) {
    recieveBuffer = port.read();
    print("P:");
    println(recieveBuffer);
    mSerial.write(recieveBuffer);
  } else {
    recieveChar = port.readChar();
    print(recieveChar);
  }

  if (recieveBuffer == 9) {
    endMeasure = true;
  }
}

