public class MyCode extends vrml.node.Script
{
  private vrml.field.SFBool flag;
  private vrml.field.SFColor color_changed;

  public void initialize()
  {
    flag = (vrml.field.SFBool)getField("flag");
    color_changed = (vrml.field.SFColor)getEventOut("color_changed");
  }

  public void processEvent(vrml.Event event)
  {
    if (event.getName().equals("isActive"))
    {
      vrml.field.ConstSFBool isActive = (vrml.field.ConstSFBool)event.getValue();
      //System.out.println("isActive(" + isActive.getValue() + ")"); // Debug output
      if (isActive.getValue() == true)
      {
        if (flag.getValue() == false)
        {
          flag.setValue(true);
          //System.out.println("color is green"); // Debug output
          color_changed.setValue(0, 1, 0);
        }
        else
        {
          flag.setValue(false);
          //System.out.println("color is red"); // Debug output
          color_changed.setValue(1, 0, 0);
        }
      }
    }
  }
}
