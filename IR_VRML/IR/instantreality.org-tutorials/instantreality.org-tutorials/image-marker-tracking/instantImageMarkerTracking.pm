<?xml version="1.0" encoding="UTF-8" standalone="no" ?>
<VisionLib2 Version="2.0">

  <ActionPipe category="Action" name="main">
    <VideoSourceAction__ImageT__RGB_Frame category="Action" enabled="1" name="VideoSourceAction">
      <Keys size="2">
        <key val="VideoSourceImage" what="image live, Image*, out"/>
        <key val="" what="intrinsic parameters to be modified, out"/>
      </Keys>
      <ActionConfig source_url="ds://"/>
    </VideoSourceAction__ImageT__RGB_Frame>
    <ImageConvertActionT__ImageT__RGB_FrameImageT__GREY_Frame category="Action" enabled="1" name="ImageConvertActionT">
      <Keys size="2">
        <key val="VideoSourceImage" what="source image, in"/>
        <key val="ImageGrey" what="target image, out"/>
      </Keys>
    </ImageConvertActionT__ImageT__RGB_FrameImageT__GREY_Frame>
    <ImageInvertAction category="Action" enabled="0" name="Action">
      <Keys size="2">
        <key val="ImageGrey" what="image to invert, in"/>
        <key val="ImageGreyI" what="inverted image , out"/>
      </Keys>
    </ImageInvertAction>
    <ImageMarkerTrackerAction category="Action" enabled="1" name="MarkerTracker">
      <Keys size="5">
        <key val="ImageGrey" what="input image, ImageGREY*, in"/>
        <key val="CameraIntrinsicParameters" what="IntrinsicDataPerspective, IntrinsicDatra*, in"/>
        <key val="World" what="World of TrackedObjects, World*, in/out"/>
        <key val="MarkerTrackerInternalContour" what="Contour, Contour*, out"/>
        <key val="MarkerTrackerInternalSquares" what="GeometryContainer of corner points, GeometryContainer*, out"/>
      </Keys>
        <ActionConfig ContourEnhance="1" ContourMaxArea="10000000" ContourMinArea="500" ContourMaxRoundness="40" ContourMinPerimeter="101" ContourThreshold="200" DetectionThreshold="50" ExtractorMode="0" InvertMarkerFrame="0" SilhouetteInverted="0" SilhouetteNumContourPts="500" SilhouetteThreshold="90" ValidationLevel="2" ValidationThreshold="34" WithPoseNlls="1"/>    
    </ImageMarkerTrackerAction>

    <IfAction category="Action" name="UseValidPose">
      <Keys size="1">
        <key val="0_477397_"/>
      </Keys>
      <ActionConfig Condition="[World.instantLogo.ExtrinsicData:PoseValid]!=1"/>
      <ActionPipe category="Action" name="TakeLastValidPose">
        <ExtrinsicDataCopyAction category="Action" name="CopyLastValidPose">
          <Keys size="2">
            <key val="LastValidPose"/>
            <key val="World.instantLogo.ExtrinsicData"/>
          </Keys>
          <ActionConfig/>
        </ExtrinsicDataCopyAction>
      </ActionPipe>
      <ActionPipe category="Action" name="ElseCopyToLastValidPose">
        <ExtrinsicDataCopyAction category="Action" name="CopyLastValidPose">
          <Keys size="2">
            <key val="World.instantLogo.ExtrinsicData"/>
            <key val="LastValidPose"/>
          </Keys>
          <ActionConfig/>
        </ExtrinsicDataCopyAction>
      </ActionPipe>
    </IfAction>
    
    <ComputeCameraAction category="Action" enabled="1" name="Action">
      <Keys size="3">
        <key val="CameraIntrinsicParameters"/>
        <key val="World.instantLogo.ExtrinsicData"/>
        <key val="InstantCamera"/>
      </Keys>
      <ActionConfig CeilingTrack="0" ForceValid="0"/>
    </ComputeCameraAction>

    <MegaWidgetActionPipe height="326" name="WidgetActionPipe" show="1" viewerid="0" width="651" x="0" y="0">
      <Keys size="8">
        <key val="mwap" what="internal use, do not set or change!"/>
        <key val="ImageGrey" what="background, Image*, in"/>
        <key val="MarkerTrackerInternalContour" what="2D geometry, GeometryContainer, in"/>
        <key val="" what="3D geometry, GeometryContainer, in"/>
        <key val="" what="Camera extrinsic parameters, ExtrinsicData, in"/>
        <key val="" what="Camera intrinsic parameters, IntrinsicDataPerspective, in"/>
        <key val="" what="OSG 3D Models, OSGNodeData, in"/>
        <key val="" what="caption string, StringData, in"/>
      </Keys>
    </MegaWidgetActionPipe>
  </ActionPipe>

  <DataSet key="">
    <IntrinsicDataPerspective calibrated="1" camerainfo="" key="CameraIntrinsicParameters" opticsinfo="">
      <!--Image resolution (application-dependant)-->
      <Image_Resolution h="480" w="640"/>
      <!--Normalized principal point (invariant for a given camera)-->
      <Normalized_Principal_Point cx="5.1878923070e-001" cy="5.1218541000e-001"/>
      <!--Normalized focal length and skew (invariant for a given camera)-->
      <Normalized_Focal_Length_and_Skew fx="1.3645700000e+000" fy="1.8189458000e+000" s="0.0000000000e+000"/>
      <!--Radial and tangential lens distortion (invariant for a given camera)-->
      <Lens_Distortion k1="-9.3491000000e-002" k2="-5.5497600000e-001" k3="-1.7040000000e-003" k4="-6.7900000000e-004" k5="0.0000000000e+000"/>
    </IntrinsicDataPerspective>
    <World key="World">
      <TrackedObject key="instantLogo">
        <ExtrinsicData calibrated="0" t="0">
          <R rotation="0 0 0 &#xA;"/>
          <t translation="0 0 0 &#xA;"/>
          <Cov covariance="0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;"/>
        </ExtrinsicData>
        <ImageMarker fileName="project_dir:\InstantReality.jpg" key="myImageMarker" markerBorder="0.01">
          <Points3D nb="4">
            <HomgPoint3d w="1" x="0" y="6" z="0"/>
            <HomgPoint3d w="1" x="21" y="6" z="0"/>
            <HomgPoint3d w="1" x="21" y="0" z="0"/>
            <HomgPoint3d w="1" x="0" y="0" z="0"/>
          </Points3D>
        </ImageMarker>
      </TrackedObject>
    </World>
    <CorrespondencyContainer key="TheWorldMarkerTrackerInternalCorresp"/>
    <ExtrinsicData calibrated="1" key="TheWorldMarkerTrackerInternalPose" t="0">
      <R rotation="-0.877569 -0.0132474 0.148716 &#xA;"/>
      <t translation="-3.73241 -0.856645 12.907 &#xA;"/>
      <Cov covariance="0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;"/>
    </ExtrinsicData>
    <CorrespondencyContainer key="corresp"/>
  </DataSet>

  <Activity name="NOP"/>

</VisionLib2>
