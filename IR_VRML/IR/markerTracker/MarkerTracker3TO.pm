<?xml version="1.0" encoding="UTF-8" standalone="no" ?>
<VisionLib2 Version="2.0">

  <ActionPipe category="Action" name="ActionPipe">
  
    <ListDataSetAction enabled='0' name='ListDS'/>


    <!--VideoSourceAction__ImageT__RGB_Frame category="Action" enabled="1" name="VideoSourceAction">
      <Keys size="2">
        <key val="ImageLiveColour"/>
        <key val="CameraIntrinsicParameters"/>
      </Keys>
      <ActionConfig source_url="ds"/> 
    </VideoSourceAction__ImageT__RGB_Frame-->
    <ImageReaderAction category="Action" enabled="1" name="ImageReaderAction">
      <Keys size="2">
        <key val="ImageLiveColour"/>
        <key val=""/>
      </Keys>
      <ActionConfig repeat="1" bMarkOrigin="0" iImageCount="0" iLastImage="99999" iMode="2" 

                    iNumberOfDigits="1" 

                    szImageFileName="project_dir:Data/markerImages/*.jpg"/>
    </ImageReaderAction>
  
  
    
    <ImageConvertActionT__ImageT__RGB_FrameImageT__GREY_Frame category="Action" name="ImageConvert">
      <Keys size="2">
        <key val="ImageLiveColour"/>
        <key val="ImageLiveGrey"/>
      </Keys>
    </ImageConvertActionT__ImageT__RGB_FrameImageT__GREY_Frame>
    
    <ImageUndistortAction category="Action" name="Undistort">
      <Keys size="3">
        <key val="ImageLiveGrey"/>
        <key val="CameraIntrinsicParameters"/>
        <key val="ImageLiveGreyU"/>
      </Keys>
      <ActionConfig BSplineInterplation="0" ConstIntrinsics="1" UseTemplateFunc="0"/>
    </ImageUndistortAction>
    

    <MarkerTrackerAction category="MarkerTracker" name='MarkerTracker'>
      <Keys size="5">
        <key val="ImageLiveGreyU"/>
        <key val="CameraIntrinsicParameters"/>
        <key val="TheWorld"/>
        <key val="Contours"/>
        <key val="MarkerTrackerInternalSquares"/>
      </Keys>
      <ActionConfig MTAThresh="140" MTAcontrast="0" MTAlogbase="10" WithKalman="0" WithPoseNlls="1"/>
    </MarkerTrackerAction>
    
         <ComputeCameraAction category="Action" name="ComputeCamera" val="ComputeCameraAction">
          <Keys size="3">
            <key val="CameraIntrinsicParameters"/>
            <key val="TheWorld.Koffer1.ExtrinsicData"/>
            <key val="InstantCamera1"/>
          </Keys>
        </ComputeCameraAction>
         <ComputeCameraAction category="Action" name="ComputeCamera" val="ComputeCameraAction">
          <Keys size="3">
            <key val="CameraIntrinsicParameters"/>
            <key val="TheWorld.Koffer2.ExtrinsicData"/>
            <key val="InstantCamera2"/>
          </Keys>
        </ComputeCameraAction>
         <ComputeCameraAction category="Action" name="ComputeCamera" val="ComputeCameraAction">
          <Keys size="3">
            <key val="CameraIntrinsicParameters"/>
            <key val="TheWorld.Koffer3.ExtrinsicData"/>
            <key val="InstantCamera3"/>
          </Keys>
        </ComputeCameraAction>
    

    <MegaWidgetActionPipe height="295" name="WAP" show="1" width="624" x="0" y="0">
      <Keys size="8">
        <key val="mwap"/>
        <key val="ImageLiveGreyU"/>
        <key val=""/>
        <key val=""/>
        <key val=""/> <!--TheWorld.Koffer.ExtrinsicData"/-->
        <key val=""/> <!--CameraIntrinsicParameters"/-->
        <key val=""/> <!--myOSGNode;"/-->
        <key val=""/>
      </Keys>
    </MegaWidgetActionPipe> 
  </ActionPipe>

  <DataSet key="">

  <IntrinsicDataPerspective calibrated="1" key="CameraIntrinsicParameters">
      <!--Image resolution (application-dependant)-->
      <Image_Resolution h="480" w="640"/>
      <!--Normalized principal point (invariant for a given camera)-->
      <Normalized_Principal_Point cx="5.0000000000e-001" cy="5.0000000000e-001"/>
      <!--Normalized focal length and skew (invariant for a given camera)-->
      <Normalized_Focal_Length_and_Skew fx="1.2031250000e+000" fy="1.6000000000e+000" s="0.0000000000e+000"/>
      <!--Radial and tangential lens distortion (invariant for a given camera)-->
      <Lens_Distortion k1="-2.6974200000e-001" k2="4.7743100000e-001" k3="0.0000000000e+000" k4="0.0000000000e+000" k5="0.0000000000e+000"/>
    </IntrinsicDataPerspective>
    <OSGNodeData fileName="resource_dir:3dModels/CoordFrame.wrl" key="myOSGNode"/>
    <World key="TheWorld">
      <TrackedObject key="Koffer1">
        <ExtrinsicData calibrated="0">
          <R rotation="1 0 0 &#xA;"/>
          <t translation="0 0 0 &#xA;"/>
          <Cov covariance="0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;"/>
        </ExtrinsicData>
        <Marker BitSamples="2" MarkerSamples="6" NBPoints="4" key="Marker">
          <Code Line1="1110" Line2="0000" Line3="0000" Line4="0000"/>
          <Points3D nb="4">
            <HomgPoint3d w="1" x="0" y="0" z="0"/>
            <HomgPoint3d w="1" x="5.4" y="0" z="0"/>
            <HomgPoint3d w="1" x="5.4" y="-5.4" z="0"/>
            <HomgPoint3d w="1" x="0" y="-5.4" z="0"/>
          </Points3D>
        </Marker>
      </TrackedObject>
      <TrackedObject key="Koffer2">
        <ExtrinsicData calibrated="0">
          <R rotation="1 0 0 &#xA;"/>
          <t translation="0 0 0 &#xA;"/>
          <Cov covariance="0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;"/>
        </ExtrinsicData>
       <Marker BitSamples="2" MarkerSamples="6" NBPoints="4" key="Marker_0">
          <Code Line1="1111" Line2="0100" Line3="0000" Line4="0000"/>
          <Points3D nb="4">
            <HomgPoint3d w="1" x="0" y="0" z="0"/>
            <HomgPoint3d w="1" x="5.4" y="0" z="0"/>
            <HomgPoint3d w="1" x="5.4" y="-5.4" z="0"/>
            <HomgPoint3d w="1" x="0" y="-5.4" z="0"/>
          </Points3D>
        </Marker>
      </TrackedObject>
      <TrackedObject key="Koffer3">
        <ExtrinsicData calibrated="0">
          <R rotation="1 0 0 &#xA;"/>
          <t translation="0 0 0 &#xA;"/>
          <Cov covariance="0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;"/>
        </ExtrinsicData>
        <Marker BitSamples="2" MarkerSamples="6" NBPoints="4" key="Marker_1">
          <Code Line1="1111" Line2="0001" Line3="1001" Line4="1000"/>
          <Points3D nb="4">
            <HomgPoint3d w="1" x="0" y="0" z="0"/>
            <HomgPoint3d w="1" x="5.4" y="0" z="0"/>
            <HomgPoint3d w="1" x="5.4" y="-5.4" z="0"/>
            <HomgPoint3d w="1" x="0" y="-5.4" z="0"/>
          </Points3D>
        </Marker>
      </TrackedObject>
    </World>
  </DataSet>

</VisionLib2>
