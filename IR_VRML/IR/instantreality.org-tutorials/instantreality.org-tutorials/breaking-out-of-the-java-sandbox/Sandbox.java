import vrml.*;
import vrml.field.*;
import vrml.node.*;

public class Sandbox extends vrml.node.Script
{
  // This method gets called when loading the scene
  public void initialize()
  {
    // Get the Text node from "text" field of the Script node
    SFNode textField = (SFNode)getField("text");
    Node textNode = (Node)textField.getValue();

    // Get the "string" exposed field of the Text node
    MFString stringField = (MFString)textNode.getExposedField("string");

    // Get the name of the user. This is a privileged method call that
    // will throw an AccessControlException when we do not give this
    // script the right to read that property.
    String username = System.getProperty("user.name");

    // Write the user name into the "string" field of the Text node
    stringField.set1Value(1, username);
  }
}
