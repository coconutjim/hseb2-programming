function isActive(value)
{
  //print('isActive(' + value + ')'); // Debug output
  if (value == true)
  {
    if (flag == false)
    {
      flag = true;
      //print('color is green'); // Debug output
      color_changed = new SFColor(0, 1, 0);
    }
    else
    {
      flag = false;
      //print('color is red'); // Debug output
      color_changed = new SFColor(1, 0, 0);
    }
  }
}
