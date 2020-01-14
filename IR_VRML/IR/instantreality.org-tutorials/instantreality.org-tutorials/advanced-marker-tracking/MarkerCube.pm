<?xml version="1.0" encoding="UTF-8" standalone="no" ?>
<VisionLib2 Version="2.0">
  <ActionPipe category="Action" name="AbstractApplication-AP">
    <VideoSourceAction category="Action" name="VideoSourceAction">
      <Keys size="2">
        <key val="VideoSourceImage"/>
        <key val=""/>
      </Keys>
      <ActionConfig preferred_height="480" preferred_width="640" shutter="-1" source_url="ds"/>
    </VideoSourceAction>
    <ImageConvertActionT__ImageT__RGB_FrameImageT__GREY_Frame category="Action" name="ImageConvertActionT">
      <Keys size="2">
        <key val="VideoSourceImage"/>
        <key val="ConvertedImage"/>
      </Keys>
    </ImageConvertActionT__ImageT__RGB_FrameImageT__GREY_Frame>
    <MarkerTrackerAction category="Action">
      <Keys size="5">
        <key val="ConvertedImage"/>
        <key val="IntrinsicDataPGRFlea8mm"/>
        <key val="World"/>
        <key val="MarkerTrackerInternalContour"/>
        <key val="MarkerTrackerInternalSquares"/>
      </Keys>
      <ActionConfig MTAThresh="140" MTAcontrast="0" MTAlogbase="10" WithKalman="0" WithPoseNlls="1"/>
    </MarkerTrackerAction>
    <TrackedObject2CameraAction category="Action" name="TrackedObject2Camera">
      <Keys size="3">
        <key val="World"/>
        <key val="IntrinsicDataPGRFlea8mm"/>
        <key val="Camera"/>
      </Keys>
    </TrackedObject2CameraAction>
  </ActionPipe>

  <DataSet key="">
    <IntrinsicDataPerspective calibrated="1" key="IntrinsicDataPGRFlea8mm">
      <!--Image resolution (application-dependant)-->
      <Image_Resolution h="480" w="640"/>
      <!--Normalized principal point (invariant for a given camera)-->
      <Normalized_Principal_Point cx="5.0037218855e-01" cy="5.0014036507e-01"/>
      <!--Normalized focal length and skew (invariant for a given camera)-->
      <Normalized_Focal_Length_and_Skew fx="1.6826109287e+00" fy="2.2557202465e+00" s="-5.7349563803e-04"/>
      <!--Radial and tangential lens distortion (invariant for a given camera)-->
      <Lens_Distortion k1="-1.6826758076e-01" k2="2.5034542035e-01" k3="-1.1740904370e-03" k4="-4.8766380599e-03" k5="0.0000000000e+00"/>
    </IntrinsicDataPerspective>
    <World key="World">
      <TrackedObject key="TrackedObject1">
        <ExtrinsicData calibrated="0">
          <R rotation="1 0 0 &#xA;"/>
          <t translation="0 0 0 &#xA;"/>
          <Cov covariance="0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;"/>
        </ExtrinsicData>
       <Marker BitSamples="2" MarkerSamples="6" NBPoints="4" key="Marker" is="1">
          <Code Line1="0000" Line2="0010" Line3="0000" Line4="0001"/>
          <Points3D nb="4">
            <HomgPoint3Covd Cov3x3="0  0  0  &#xA;0  0  0  &#xA;0  0  0  &#xA;" w="1" x="-0.75" y="0.75" z="-0.75"/>
            <HomgPoint3Covd Cov3x3="0  0  0  &#xA;0  0  0  &#xA;0  0  0  &#xA;" w="1" x="-0.75" y="0.75" z="0.75"/>
            <HomgPoint3Covd Cov3x3="0  0  0  &#xA;0  0  0  &#xA;0  0  0  &#xA;" w="1" x="-0.75" y="-0.75" z="0.75"/>
            <HomgPoint3Covd Cov3x3="0  0  0  &#xA;0  0  0  &#xA;0  0  0  &#xA;" w="1" x="-0.75" y="-0.75" z="-0.75"/>
          </Points3D>
        </Marker>
        <Marker BitSamples="2" MarkerSamples="6" NBPoints="4" key="Marker2" is="2">
          <Code Line1="0000" Line2="1001" Line3="0001" Line4="0000"/>
          <Points3D nb="4">
            <HomgPoint3Covd Cov3x3="0  0  0  &#xA;0  0  0  &#xA;0  0  0  &#xA;" w="1" x="-0.75" y="0.75" z="0.75"/>
            <HomgPoint3Covd Cov3x3="0  0  0  &#xA;0  0  0  &#xA;0  0  0  &#xA;" w="1" x="0.75" y="0.75" z="0.75"/>
            <HomgPoint3Covd Cov3x3="0  0  0  &#xA;0  0  0  &#xA;0  0  0  &#xA;" w="1" x="0.75" y="-0.75" z="0.75"/>
            <HomgPoint3Covd Cov3x3="0  0  0  &#xA;0  0  0  &#xA;0  0  0  &#xA;" w="1" x="-0.75" y="-0.75" z="0.75"/>
          </Points3D>
        </Marker>
        <Marker BitSamples="2" MarkerSamples="6" NBPoints="4" key="Marker2_0" is="3">
          <Code Line1="0011" Line2="0110" Line3="0000" Line4="0001"/>
          <Points3D nb="4">
            <HomgPoint3Covd Cov3x3="0  0  0  &#xA;0  0  0  &#xA;0  0  0  &#xA;" w="1" x="0.75" y="0.75" z="0.75"/>
            <HomgPoint3Covd Cov3x3="0  0  0  &#xA;0  0  0  &#xA;0  0  0  &#xA;" w="1" x="0.75" y="0.75" z="-0.75"/>
            <HomgPoint3Covd Cov3x3="0  0  0  &#xA;0  0  0  &#xA;0  0  0  &#xA;" w="1" x="0.75" y="-0.75" z="-0.75"/>
            <HomgPoint3Covd Cov3x3="0  0  0  &#xA;0  0  0  &#xA;0  0  0  &#xA;" w="1" x="0.75" y="-0.75" z="0.75"/>
          </Points3D>
        </Marker>
        <Marker BitSamples="2" MarkerSamples="6" NBPoints="4" key="Marker2_1" is="4">
          <Code Line1="0000" Line2="1110" Line3="0010" Line4="0000"/>
          <Points3D nb="4">
            <HomgPoint3Covd Cov3x3="0  0  0  &#xA;0  0  0  &#xA;0  0  0  &#xA;" w="1" x="0.75" y="0.75" z="-0.75"/>
            <HomgPoint3Covd Cov3x3="0  0  0  &#xA;0  0  0  &#xA;0  0  0  &#xA;" w="1" x="-0.75" y="0.75" z="-0.75"/>
            <HomgPoint3Covd Cov3x3="0  0  0  &#xA;0  0  0  &#xA;0  0  0  &#xA;" w="1" x="-0.75" y="-0.75" z="-0.75"/>
            <HomgPoint3Covd Cov3x3="0  0  0  &#xA;0  0  0  &#xA;0  0  0  &#xA;" w="1" x="0.75" y="-0.75" z="-0.75"/>
          </Points3D>
        </Marker>
        <Marker BitSamples="2" MarkerSamples="6" NBPoints="4" key="Marker2_1" is="5">
        <Code Line1="0000" Line2="0000" Line3="0110" Line4="0001" />
          <Points3D nb="4">
            <HomgPoint3Covd Cov3x3="0  0  0  &#xA;0  0  0  &#xA;0  0  0  &#xA;" w="1" x="0.75" y="0.75" z="-0.75"/>
            <HomgPoint3Covd Cov3x3="0  0  0  &#xA;0  0  0  &#xA;0  0  0  &#xA;" w="1" x="0.75" y="0.75" z="0.75"/>
            <HomgPoint3Covd Cov3x3="0  0  0  &#xA;0  0  0  &#xA;0  0  0  &#xA;" w="1" x="-0.75" y="0.75" z="0.75"/>
            <HomgPoint3Covd Cov3x3="0  0  0  &#xA;0  0  0  &#xA;0  0  0  &#xA;" w="1" x="-0.75" y="0.75" z="-0.75"/>
          </Points3D>
        </Marker>
      </TrackedObject>
    </World>
  </DataSet>
</VisionLib2>
