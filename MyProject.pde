// Class: CS 3451
// Semester: Fall 20
// Project number: 2
// Project title: Homework on Points and Vectors
// Student(s): Kaushi Chandraratna

//======================= My global variables
PImage PictureOfMyFace; // picture of author's face, should be: data/pic.jpg in sketch folder
PImage PictureOfBanner; // picture of banner, should be: data/pic.jpg in sketch folder

boolean lerp=true, spiral=true; // toggles to display vector interpoations
float b=0, c=0.5, d=1; // initial knots
int partShown = 1;
//String [] PartTitle = new String[10];
String [] PartTitle = {"?","?","?","?","?","?","?","?","?","?"};


int numberOfParts = PartTitle.length;
PNTS DrawnPoints = new PNTS(); // class containing array of points, used to standardize GUI
PNTS SmoothenedPoints = new PNTS(); // class containing array of points, used to standardize GUI
DUCKS DucksRow = new DUCKS(20);

//**************************** My text  ****************************
String title ="Class: 3451, Year: 2020, Project 02",            
       name ="Student: Kaushi CHANDRARATNA";
String subtitle = "4 exercises using points and vectors";    
String guide="MyProject keys: '0' through '9' to select project parts, 'a' to start/stop animation "; // help info

//======================= my setup, executed once at the beginning 
void mySetup()
  {
  DrawnPoints.declare(); // declares all ControlPoints. MUST BE DONE BEFORE ADDING POINTS 
  SmoothenedPoints.declare(); // declares all ControlPoints. MUST BE DONE BEFORE ADDING POINTS 
  DrawnPoints.empty(); // reset pont list P
  SmoothenedPoints.empty(); // reset pont list P
  //initDucklings(); // creates Ducling[] points
  }

//======================= called in main() and executed at each frame to redraw the canvas
void showMyProject(PNT A, PNT B, PNT C, PNT D) // four points used to define 3 vectors
  {
  if(0<=partShown && partShown<numberOfParts)
    {
    switch(partShown) 
      {
      case 0: showPart0(A,B,C,D); break;
      case 1: showPart1(A,B,C,D); break;
      case 2: showPart2(A,B,C,D); break;
      case 3: showPart3(A,B,C,D); break;
      case 4: showPart4(A,B,C,D); break;
      case 5: showPart5(A,B,C,D); break;
      case 6: showPart6(A,B,C,D); break;
      case 7: showPart7(A,B,C,D); break;
      case 8: showPart8(A,B,C,D); break;
      case 9: showPart9(A,B,C,D); break;
      }
    }
  }

//====================================================================== PART 0
void showPart0(PNT A, PNT B, PNT C, PNT D) //
  {
  PartTitle[0] = "Sandbox";
  guide="MyProject keys: '0' through '9' to select project, 'a' to start/stop animation ";
  if(showIDs) { A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); } // D.circledLabel("D");
  }

//====================================================================== PART 1
void showPart1(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[1] =   "Right Turn (RT) test"; // https://en.wikipedia.org/wiki/Parallelogram
  // To position the text of your solution on the canvas: 
  // Place your mouse-arrow and press 'C', which prints 2 lines in the botom pane. Copy then here:
  //StartClip = P(143,493);
  //EndClip = P(197,409);
  StartClip = P(301,490);
  EndClip = P(396,457);
  // Add  your solution  to the MyText String below
  MyText="RT(A,B,C):= det(V(A,B), V(B,C)) > 0"; 
  PNT X = Mouse();
  if(animate) X = P(C);
  if(RT(A,B,X)) { MyText = MyText + " is TRUE"; cwF(dgreen,3); }
  else { MyText = MyText + " is FALSE"; cwF(dred,3); }
  show(A,B,X);
  guide="MyProject keys: '0' through '9' to select project, 'a' to start/stop animation ";
  if(showIDs) { A.circledLabel("A"); B.circledLabel("B"); X.circledLabel("C"); } // D.circledLabel("D");
  }
boolean RT(PNT A, PNT B, PNT C) {
  if (det(V(A,B), V(B,C)) > 0){
    return true; 
  }
  else {
    return false;
  }
} // EDIT THIS

//====================================================================== PART 2
void showPart2(PNT A, PNT B, PNT C, PNT D) //   
  {
  PartTitle[2] = "Point-in-Triangle (PiT) test"; 
  StartClip = P(638,589);
  EndClip = P(591,501);
  // Add  your solution  to the MyText String below
  MyText="PiT(A,B,C,D):= ABxAX, BCxBX and CAxCX all same sign"; 
  PNT X = Mouse();
  if(animate) X = P(D);
  if(PiT(X,A,B,C)) { MyText = MyText + " is TRUE"; cwf(black,3,red); }
  else { MyText = MyText + " is FALSE"; cwf(black,3,green); }
  showLoop(A,B,C);  
  guide="MyProject keys: '0' through '9' to select project, 'a' to start/stop animation ";
  if(showIDs) { A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C");  X.circledLabel("D"); }
  }
boolean PiT(PNT X, PNT A, PNT B, PNT C) {
  float cp1 = det(V(A,B), V(A,X));
  float cp2 = det(V(B,C), V(B,X));
  float cp3 = det(V(C,A), V(C,X));
  if (cp1 >= 0 && cp2 >= 0 && cp3 >=0){
    return true;
  } else if (cp1 <= 0 && cp2 <= 0 && cp3 <=0){
    return true;
  } else {
    return false;
  }
} // EDIT THIS



//====================================================================== PART 3
void showPart3(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[3] =   "Edge-Edge Intersection test (ExE) and point"; // https://pin.it/7wgYDeq 
  StartClip = P(156,632);
  EndClip = P(175,534);  // Add  your solution  to the MyText String below
  MyText="ExE(A,B,C,D):= X = A + sAB"; 
  cwf(black,3,yellow); show(A,B); show(C,D);
  if(ExE(A,B,C,D))
    {
    PNT X = LiL(A,B,C,D);
    cwf(blue,1,blue); show(X,6);
    if(showIDs) X.circledLabel("X");
    MyText=MyText+" is TRUE";
    }
  guide="MyProject keys: '0' through '9' to select project, 'a' to start/stop animation ";
  if(showIDs) { A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C");  D.circledLabel("D"); }
  }
boolean  ExE(PNT A, PNT B, PNT C, PNT D)
  {
    float cp1 = det(V(A,B), V(A,C));
    float cp2 = det(V(A,B), V(A,D));
    float cp3 = det(V(C,D), V(C,A));
    float cp4 = det(V(C,D), V(C,B));

    if ((cp1 < 0 && cp2 > 0) && (cp3 > 0 && cp4 < 0)){
      return true;
    } else if ((cp1 > 0 && cp2 < 0) && (cp3 < 0 && cp4 > 0)){
      return true;
    }else {
      return false;
    }
  }

PNT LiL(PNT A, PNT B, PNT C, PNT D)
  {
    float s = -1 * (det(V(C,D),V(C,A))/det(V(C,D), V(A,B)));
    PNT X = P(A,s, V(A,B));
    return X;
  }

//====================================================================== PART 4
void showPart4(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[4] = "Projection on Triangle (POT)"; 
  StartClip = P(638,589);
  EndClip = P(591,501);
  // Add  your solution  to the MyText String below
  MyText="PiT(A,B,C,D):= see slides"; 
  PNT X = Mouse();
  if(animate) X = P(D);
  cwf(black,3,yellow); showLoop(A,B,C); 
  cwf(blue,1,blue); show(X,6);
  PNT P = PoT(X,A,B,C); 
  guide="MyProject keys: '0' through '9' to select project, 'a' to start/stop animation ";
  if(showIDs) { A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C");  X.circledLabel("D"); }
  if(PiT(X,A,B,C)) cwf(red,1,red); else cwf(green,1,green); 
  show(P,6); show(P,X);
  }
PNT PoT(PNT X, PNT A, PNT B, PNT C) 
  {
  if (PiT(X,A,B,C)){
    if (det(V(A,B),V(A,C)) > 0){
     float s = det(U(A,B),V(A,X));
     float t = det(U(C,A),V(C,X));
     float u = det(U(B,C),V(B,X));
      if (s < t && s < u){
        s = dot(V(A,X),V(A,B))/dot(V(A,B),V(A,B));
          if (s > 1){
            s = 1;
          } else if (s < 0){
            s = 0;
        }
        X = P(A,s,V(A,B));
      } else if (t < s && t < u){
          t = dot(V(C,X),V(C,A))/dot(V(C,A),V(C,A));
          if (t > 1){
            t = 1;
          }
          X = P(C,t,V(C,A));
      } else if (u < t && u < s){
          u = dot(V(B,X),V(B,C))/dot(V(B,C),V(B,C));
          if (u < 0){
            u = 0;
          } else if (u > 1){
            u = 1;
          }
          X = P(B,u,V(B,C));
      }
    } else {
       float s = det(U(B,A),V(B,X));
       float t = det(U(A,C),V(A,X));
       float u = det(U(C,B),V(C,X));
        if (s < t && s < u){
          s = dot(V(B,X),V(B,A))/dot(V(B,A),V(B,A));
            if (s > 1){
              s = 1;
            } else if (s < 0){
              s = 0;
          }
          X = P(B,s,V(B,A));
        } else if (t < s && t < u){
            t = dot(V(A,X),V(A,C))/dot(V(A,C),V(A,C));
            if (t > 1){
              t = 1;
            }
            X = P(A,t,V(A,C));
        } else if (u < t && u < s){
            u = dot(V(C,X),V(C,B))/dot(V(C,B),V(C,B));
            if (u < 0){
              u = 0;
            } else if (u > 1){
              u = 1;
            }
            X = P(C,u,V(C,B));
        }
    }
  } else {
    if (det(V(A,B),V(A,C)) < 0){
      if (RT(C,A,X)){
        float s = dot(V(C,X),V(C,A))/dot(V(C,A),V(C,A));
        if (s > 1){
          s = 1;
        }
        X = P(C,s,V(C,A));
      } 
      if (RT(A,B,X)){
        float s = dot(V(A,X),V(A,B))/dot(V(A,B),V(A,B));
        if (s > 1){
          s = 1;
        } else if (s < 0){
          s = 0;
        }
        X = P(A,s,V(A,B));
      }
      if (RT(B,C,X)){
        float s = dot(V(B,X),V(B,C))/dot(V(B,C),V(B,C));
        if (s < 0){
          s = 0;
        } else if (s > 1){
          s = 1;
        }
        X = P(B,s,V(B,C));
      } 
    } else {
      if (RT(C,B,X)){
        float s = dot(V(C,X),V(C,B))/dot(V(C,B),V(C,B));
        if (s > 1){
          s = 1;
        }
        X = P(C,s,V(C,B));
      } 
      if (RT(B,A,X)){
        float s = dot(V(B,X),V(B,A))/dot(V(B,A),V(B,A));
        if (s > 1){
          s = 1;
        } else if (s < 0){
          s = 0;
        }
      X = P(B,s,V(B,A));
      }
      if (RT(A,C,X)){
        float s = dot(V(A,X),V(A,C))/dot(V(A,C),V(A,C));
        if (s < 0){
          s = 0;
        } else if (s > 1){
          s = 1;
        }
      X = P(A,s,V(A,C));
      } 
    }
  }
    return X; // edit this, feel free to use other helper functions to make your code simple and elegant (not necessarily fastest)
  }


//====================================================================== PART 5
void showPart5(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[5] =   "Michell truss";
  int k=11, r=11;
  PNT[][] T = new PNT[r][k];
  PNT O = ScreenCenter();
  VCT V = V(O,A);
  for(int i=0; i<k; i++) T[0][i]=P(O,R(V,TWO_PI*i/k));
  cw(green,2);
  
  
  // six lines of code
  
  
 
  guide="MyProject keys: '0' through '9' to select project, 'a' to start/stop animation ";
  //A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }
  
//====================================================================== PART 6
int recursionDepth=9;  
void showPart6(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[6] =   "Recursive tree growth";
  PNT E = P(A,V(B,C));

  if(showIDs)
    {
    E.circledLabel("E");
    A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
    }
  guide="I:display IDs, ,/.:recursion depth";
  //A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }

  
  
//====================================================================== PART 7
void showPart7(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[7] =   "Cubic interpolating motion";
  cwF(cyan,5); show(A,B,C,D);
  cwF(red,3); drawNeville(A,B,C,D);
 
  guide="MyProject keys: '0' through '9' to select project, 'a' to start/stop animation ";
  A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }
void drawNeville(PNT A, PNT B, PNT C, PNT D)
  {
  beginShape();
  
  
  endShape();
  }

  
//====================================================================== PART 8
void showPart8(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[8] =   "Polyline smoothing";
  cwF(black,3); ControlPoints.drawPolyline(); // draws polyline joining control points
  ControlPoints.drawAllVerticesInColor(3,red); // draw dots at vertices
  //if(showIDs) {cwF(blue,1); ControlPoints.writeIDsInEmptyDisks(); }
  if(showIDs) showArrowIDs();
  cwF(red,1); ControlPoints.showPickedPoint(25);
  int n = ControlPoints.pointCount();
  if(keyPressed && key=='f' && n>4)
    {
 
    }
  guide="f:iterate smoothing, I:show/hide IDs";
  //A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }
    
//====================================================================== PART 9
void showPart9(PNT A, PNT B, PNT C, PNT D) //    
  {
  PartTitle[9] =   "Smoothing while I draw";
  guide="Place. Press RMB to erase&start. Hold LMB & drag. Wait till all ducks arrive. Release.";
  PNT SmoothP = DucksRow.move(Mouse());
  if(mousePressed && (mouseButton == RIGHT))
    {
    DrawnPoints.empty(); 
    SmoothenedPoints.empty(); 
    DucksRow.init(Mouse());
    }
  if(mousePressed && (mouseButton == LEFT))
    {
    DrawnPoints.addPoint(Mouse()); 
    SmoothenedPoints.addPoint(SmoothP); 
    }
  cwF(orange,3); DrawnPoints.drawCurve();
  cwF(blue,5); SmoothenedPoints.drawCurve(); 
  DucksRow.showRow();
  //A.circledLabel("A"); B.circledLabel("B"); C.circledLabel("C"); D.circledLabel("D");
  }
  
  


    
//======================= called when a key is pressed
void myKeyPressed()
  {
  //int k = int(key); if(47<k && k<58) partShown=int(key)-48;
  if(key=='<') {DucksRow.decrementCount(); }
  if(key=='>') {DucksRow.incrementCount(); }
  }
  
//======================= called when the mouse is dragged
void myMouseDragged()
  {
  if (keyPressed) 
    {
    //if (key=='b') b+=2.*float(mouseX-pmouseX)/width;  // adjust knot value b    
    //if (key=='c') c+=2.*float(mouseX-pmouseX)/width;  // adjust knot value c    
    //if (key=='d') d+=2.*float(mouseX-pmouseX)/width;  // adjust knot value a 
    }
  }

//======================= called when the mouse is pressed 
void myMousePressed()
  {
  if (!keyPressed) 
    {
    if(partShown==2 || partShown==3)
      {
      }
    }
  }
  
