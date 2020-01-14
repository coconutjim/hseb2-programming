<?xml version="1.0" encoding="UTF-8"?>
<VisionLib2 version='2.0'>
  <ActionPipe category='Action' name='main'>
    <VideoSourceAction__ImageT__RGB_Frame category='Action' enabled='1' name='VideoSourceAction'>
      <Keys size='2'>
        <key val='VideoSourceImage' what='image live, Image*, out'/>
        <key val='' what='intrinsic parameters to be modified, out'/>
      </Keys>
      <ActionConfig source_url='ueye'/>
    </VideoSourceAction__ImageT__RGB_Frame>
    <ImageConvertActionT__ImageT__RGB_FrameImageT__GREY_Frame category='Action' enabled='1' name='ImageConvertActionT'>
      <Keys size='2'>
        <key val='VideoSourceImage' what='source image, in'/>
        <key val='ConvertedImage' what='target image, out'/>
      </Keys>
    </ImageConvertActionT__ImageT__RGB_FrameImageT__GREY_Frame>
    <MarkerTrackerAction category='Action'>
      <Keys size='7'>
        <key val='ConvertedImage' what='input image, ImageGREY*, in'/>
        <key val='IntrinsicData' what='IntrinsicDataPerspective, IntrinsicData*, in'/>
        <key val='World' what='World of TrackedObjects, World*, in/out'/>
        <key val='World.MarkerTrackerInternals.MarkerTrackerInternalContour' what='Contour, Contour*, out'/>
        <key val='World.MarkerTrackerInternals.MarkerTrackerInternalSquares' what='GeometryContainer of corner points, GeometryContainer*, out'/>
        <key val='World.MarkerTrackerInternals.MarkerTrackerInternalCorr' what='internal use'/>
        <key val='World.MarkerTrackerInternals.MarkerTrackerInternalPose' what='internal use'/>
      </Keys>
      <ActionConfig ContourExtractor='0' MTASilMinNrOfContPoints='100' MTASilThresh='127' MTAThresh='140' MTAcontrast='0' MTAlogbase='10' RefineCorners='0' WithPoseNlls='1'/>
    </MarkerTrackerAction>
    <TrackedObject2CameraAction category='Action' enabled='1' name='TrackedObject2Camera'>
      <Keys size='3'>
        <key val='World' what='world, World*, in'/>
        <key val='IntrinsicData' what='intrinsic CameraPerspective parameters, IntrinsicDataPerspective*, in'/>
        <key val='Camera' what='suffix string for the CameraPerspective, out'/>
      </Keys>
    </TrackedObject2CameraAction>
    <MegaWidgetActionPipe height='549' name='Viewer' show='1' viewerid='0' width='738' x='0' y='0'>
      <Keys size='8'>
        <key val='mwap' what='internal use, do not set or change!'/>
        <key val='VideoSourceImage' what='background, Image*, in'/>
        <key val='MarkerCorrespondencies' what='2D geometry, GeometryContainer, in'/>
        <key val='' what='3D geometry, GeometryContainer, in'/>
        <key val='' what='Camera extrinsic parameters, ExtrinsicData, in'/>
        <key val='' what='Camera intrinsic parameters, IntrinsicDataPerspective, in'/>
        <key val='' what='OSG 3D Models, OSGNodeData, in'/>
        <key val='' what='caption string, StringData, in'/>
      </Keys>
      <GenericDrawAction category='Action' enabled='1' name='World.MarkerTrackerInternals.MarkerTrackerInternalContour'>
        <Keys size='3'>
          <key val='World.MarkerTrackerInternals.MarkerTrackerInternalContour' what='data to draw, in'/>
          <key val='' what='extrinsic data, in'/>
          <key val='' what='intrinsic data, in'/>
        </Keys>
        <ActionConfig Draw3D='0' DrawCross='1' DrawId='1'/>
      </GenericDrawAction>
    </MegaWidgetActionPipe>
    
    
  </ActionPipe>
  <DataSet key=''>
    <ImageT__GREY_Frame href='C:\Users\beckerm\Desktop\image15826.png' key='ConvertedImage' timestamp='0'/>
    <IntrinsicDataPerspective calibrated='1' camerainfo='unknown vendor and type' key='IntrinsicData' opticsinfo='unknown vendor and type'>
      <comment value='Image resolution (application-dependant)'/>
      <Image_Resolution h='480' w='640'/>
      <comment value='Normalized principal point (invariant for a given camera)'/>
      <Normalized_Principal_Point cx='5.0037218855e-001' cy='5.0014036507e-001'/>
      <comment value='Normalized focal length and skew (invariant for a given camera)'/>
      <Normalized_Focal_Length_and_Skew fx='1.6826109287e+000' fy='2.2557202465e+000' s='-5.7349563803e-004'/>
      <comment value='Radial and tangential lens distortion (invariant for a given camera)'/>
      <Lens_Distortion k1='-1.6826758076e-001' k2='2.5034542035e-001' k3='-1.1740904370e-003' k4='-4.8766380599e-003' k5='0.0000000000e+000'/>
    </IntrinsicDataPerspective>
    <CorrespondencyContainer key='MarkerCorrespondencies'/>
    <CameraPerspective key='TrackedObjectCamera'>
      <IntrinsicDataPerspective calibrated='1' camerainfo='unknown vendor and type' opticsinfo='unknown vendor and type'>
        <comment value='Image resolution (application-dependant)'/>
        <Image_Resolution h='480' w='640'/>
        <comment value='Normalized principal point (invariant for a given camera)'/>
        <Normalized_Principal_Point cx='5.0037218855e-001' cy='5.0014036507e-001'/>
        <comment value='Normalized focal length and skew (invariant for a given camera)'/>
        <Normalized_Focal_Length_and_Skew fx='1.6826109287e+000' fy='2.2557202465e+000' s='-5.7349563803e-004'/>
        <comment value='Radial and tangential lens distortion (invariant for a given camera)'/>
        <Lens_Distortion k1='-1.6826758076e-001' k2='2.5034542035e-001' k3='-1.1740904370e-003' k4='-4.8766380599e-003' k5='0.0000000000e+000'/>
      </IntrinsicDataPerspective>
      <ExtrinsicData calibrated='0' t='0'>
        <R rotation='[1.94006 1.8784 0.5568 ]'/>
        <t translation='[21.0199 -15.4131 126.97 ]'/>
        <Cov covariance='[0.197138  -0.10784  1.11672  0.00494553  0.00655673  -0.00420995  ; -0.10784  0.0681589  -0.642015  -0.00208031  -0.00403554  0.00560319  ; 1.11672  -0.642015  6.67529  0.0342651  0.0392421  -0.0447934  ; 0.00494553  -0.00208031  0.0342651  0.000935732  0.000448397  6.00177e-005  ; 0.00655673  -0.00403554  0.0392421  0.000448397  0.000896986  -0.000299469  ; -0.00420995  0.00560319  -0.0447934  6.00177e-005  -0.000299469  0.00270854  ]'/>
      </ExtrinsicData>
    </CameraPerspective>
    <World key='World'>
      <TrackedObject key='TrackedObject'>
        <ExtrinsicData calibrated='0' t='0'>
          <R rotation='[1.94006 1.8784 0.5568 ]'/>
          <t translation='[21.0199 -15.4131 126.97 ]'/>
          <Cov covariance='[0.197138  -0.10784  1.11672  0.00494553  0.00655673  -0.00420995  ; -0.10784  0.0681589  -0.642015  -0.00208031  -0.00403554  0.00560319  ; 1.11672  -0.642015  6.67529  0.0342651  0.0392421  -0.0447934  ; 0.00494553  -0.00208031  0.0342651  0.000935732  0.000448397  6.00177e-005  ; 0.00655673  -0.00403554  0.0392421  0.000448397  0.000896986  -0.000299469  ; -0.00420995  0.00560319  -0.0447934  6.00177e-005  -0.000299469  0.00270854  ]'/>
        </ExtrinsicData>
        <Marker BitSamples='2' MarkerSamples='6' NBPoints='4' key='Marker1'>
          <Code Line1='1100' Line2='1100' Line3='0100' Line4='0000'/>
          <Points3D nb='4'>
            <HomgPoint3Covd Cov3x3='[0  0  0  ; 0  0  0  ; 0  0  0  ]' w='1' x='0' y='6' z='0'/>
            <HomgPoint3Covd Cov3x3='[0  0  0  ; 0  0  0  ; 0  0  0  ]' w='1' x='6' y='6' z='0'/>
            <HomgPoint3Covd Cov3x3='[0  0  0  ; 0  0  0  ; 0  0  0  ]' w='1' x='6' y='0' z='0'/>
            <HomgPoint3Covd Cov3x3='[0  0  0  ; 0  0  0  ; 0  0  0  ]' w='1' x='0' y='0' z='0'/>
          </Points3D>
        </Marker>
      </TrackedObject>
    </World>
    <ViewerData key='mwap'/>
  </DataSet>
  <Activity name='NOP'/>
</VisionLib2>