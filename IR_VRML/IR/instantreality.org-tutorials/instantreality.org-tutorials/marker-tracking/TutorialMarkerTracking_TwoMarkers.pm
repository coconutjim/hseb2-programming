<?xml version='1.0' encoding='UTF-8' standalone='no' ?>
<VisionLib2 version='2.0'>

  <ActionPipe category='Action' name='main'>
    <VideoSourceAction__ImageT__RGB_Frame category='Action' enabled='1' name='VideoSourceAction'>
      <Keys size='2'>
        <key val='VideoSourceImage' what='image live, Image*, out'/>
        <key val='' what='intrinsic parameters to be modified, out'/>
      </Keys>
      <ActionConfig source_url='ds'/>
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
        <key val='IntrinsicDataPGRFlea8mm' what='IntrinsicDataPerspective, IntrinsicDatra*, in'/>
        <key val='World' what='World of TrackedObjects, World*, in/out'/>
        <key val='MarkerTrackerInternalContour' what='Contour, Contour*, out'/>
        <key val='MarkerTrackerInternalSquares' what='GeometryContainer of corner points, GeometryContainer*, out'/>
        <key val='MarkerTrackerInternalCorresp' what='internal use'/>
        <key val='MarkerTrackerInternalPose' what='internal use'/>
      </Keys>
      <ActionConfig ContourExtractor='0' MTASilThresh='140' MTAThresh='140' MTAcontrast='1' MTAlogbase='10' RefineCorners='0' WithPoseNlls='1'/>
    </MarkerTrackerAction>
    <TrackedObject2CameraAction category='Action' enabled='1' name='TrackedObjectToCamera'>
      <Keys size='3'>
        <key val='World' what='world, World*, in'/>
        <key val='IntrinsicDataPGRFlea8mm' what='intrinsic CameraPerspective parameters, IntrinsicDataPerspective*, in'/>
        <key val='Camera' what='suffix string for the CameraPerspective, out'/>
      </Keys>
    </TrackedObject2CameraAction>
  </ActionPipe>
 
 
  <DataSet key=''>
    <IntrinsicDataPerspective calibrated='1' key='IntrinsicDataPGRFlea8mm'>
      <!--Image resolution (application-dependant)-->
      <Image_Resolution h='480' w='640'/>
      <!--Normalized principal point (invariant for a given camera)-->
      <Normalized_Principal_Point cx='5.0037218855e-01' cy='5.0014036507e-01'/>
      <!--Normalized focal length and skew (invariant for a given camera)-->
      <Normalized_Focal_Length_and_Skew fx='1.6826109287e+00' fy='2.2557202465e+00' s='-5.7349563803e-04'/>
      <!--Radial and tangential lens distortion (invariant for a given camera)-->
      <Lens_Distortion k1='-1.6826758076e-01' k2='2.5034542035e-01' k3='-1.1740904370e-03' k4='-4.8766380599e-03' k5='0.0000000000e+00'/>
    </IntrinsicDataPerspective>
    <World key='World'>
      <TrackedObject key='TrackedObject1'>
        <ExtrinsicData calibrated='0'>
          <R rotation='1 0 0'/>
          <t translation='0 0 0'/>
          <Cov covariance='0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0'/>
        </ExtrinsicData>
        <Marker BitSamples='2' MarkerSamples='6' NBPoints='4' key='MarkerOfTrackedObject1'>
          <Code Line1='1000' Line2='1000' Line3='1000' Line4='1110'/>
          <Points3D nb='4'>
            <HomgPoint3Covd Cov3x3='0  0  0  0  0  0  0  0  0  ' w='1' x='0' y='5' z='0'/>
            <HomgPoint3Covd Cov3x3='0  0  0  0  0  0  0  0  0  ' w='1' x='5' y='5' z='0'/>
            <HomgPoint3Covd Cov3x3='0  0  0  0  0  0  0  0  0  ' w='1' x='5' y='0' z='0'/>
            <HomgPoint3Covd Cov3x3='0  0  0  0  0  0  0  0  0  ' w='1' x='0' y='0' z='0'/>
          </Points3D>
        </Marker>
      </TrackedObject>
      <TrackedObject key='TrackedObject2'>
        <ExtrinsicData calibrated='0'>
          <R rotation='1 0 0'/>
          <t translation='0 0 0'/>
          <Cov covariance='0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0'/>
        </ExtrinsicData>
        <Marker BitSamples='2' MarkerSamples='6' NBPoints='4' key='MarkerOfTrackedObject2'>
          <Code Line1='1000' Line2='0110' Line3='0000' Line4='0000'/>
          <Points3D nb='4'>
            <HomgPoint3Covd Cov3x3='0  0  0  0  0  0  0  0  0  ' w='1' x='0' y='5' z='0'/>
            <HomgPoint3Covd Cov3x3='0  0  0  0  0  0  0  0  0  ' w='1' x='5' y='5' z='0'/>
            <HomgPoint3Covd Cov3x3='0  0  0  0  0  0  0  0  0  ' w='1' x='5' y='0' z='0'/>
            <HomgPoint3Covd Cov3x3='0  0  0  0  0  0  0  0  0  ' w='1' x='0' y='0' z='0'/>
          </Points3D>
        </Marker>
      </TrackedObject>
    </World>
  </DataSet>
  
</VisionLib2>
