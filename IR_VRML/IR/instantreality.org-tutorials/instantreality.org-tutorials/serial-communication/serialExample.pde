void setup()
{
  Serial.begin(9600);
  pinMode(13, OUTPUT);
}

void loop()
{
  if (Serial.available() > 0)
  {
    int incoming = Serial.read();
    
    if ((char)incoming == '1')
    {
      digitalWrite(13, HIGH);
      Serial.println("On");
    }
    else if ((char)incoming == '2')
    {
      digitalWrite(13, LOW);
      Serial.println("Off");
    }
  }
}
2
