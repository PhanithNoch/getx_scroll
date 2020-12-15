enum ScreenSize { small, medium, large }
/*
we define break point as const because
we want to fixed values can't be change
 */
const _breakPoint1 = 600.0; // break point small device
const _breakPoint2 = 840.0; // break point for large device

/*
create a method call get (getScreenSize) that specific datatype as enum above
 */
ScreenSize getScreenSize(double width) {
  print(width);
  /*
  width < _breakpoint1 it's mean mobile screen (small)
   */
  if (width < _breakPoint1) {
    return ScreenSize.small;
  }
  // check to find medium screen
  else if (width >= _breakPoint1 && width <= _breakPoint2) {
    return ScreenSize.medium;
  }
  /*
  end return large
   */
  else {
    return ScreenSize.large;
  }
}
