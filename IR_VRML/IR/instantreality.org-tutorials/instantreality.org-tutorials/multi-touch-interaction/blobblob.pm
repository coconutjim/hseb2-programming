<?xml version="1.0" encoding="UTF-8" standalone="no" ?>
<VisionLib2 Version="2.0">

  <Plugins size="6">
    <Plugin path="VPOffscreenRenderTools"/>
    <Plugin path="VPVideoUEYE"/>
    <Plugin path="VPLEDTracking"/>
    <Plugin path="VPVideo1394"/>
    <Plugin path="VPCameraCalibActivities"/>
    <Plugin path="VPVideoV4L"/>
  </Plugins>

  <ActionPipe category="Action" name="main">
    <VideoSourceAction__ImageT__GREY_Frame category="Action" enabled="1" name="VideoSourceAction">
      <Keys size="2">
        <key val="ConvertedImage"/>
        <key val=""/>
      </Keys>
      <ActionConfig source_url="ueye://mode=752x480;pixelclock=18;framerate=20;shutter=36;gain=20"/>
    </VideoSourceAction__ImageT__GREY_Frame>
    <ImageUndistortAction category="Action" enabled="0" name="ImageUndistortAction">
      <Keys size="4">
        <key val="ConvertedImage"/>
        <key val="sphereUndist"/>
        <key val="ConvertedImageUndist"/>
        <key val=""/>
      </Keys>
      <ActionConfig BSplineInterplation="0" ConstIntrinsics="1" UseTemplateFunc="0"/>
    </ImageUndistortAction>
    <RemoveAreaAction category="Action" enabled="0" name="Action">
      <Keys size="1">
        <key val="ConvertedImage"/>
      </Keys>
      <ActionConfig posx1="360" posx2="375" posy1="290" posy2="310" value="0"/>
    </RemoveAreaAction>
    <DynamicBackgroundSubtraction category="Action" enabled="1" name="Action">
      <Keys size="5">
        <key val="ConvertedImage"/>
        <key val="DBSOutImage"/>
        <key val="BGImage"/>
        <key val="BinImage"/>
        <key val="ImageMask"/>
      </Keys>
      <ActionConfig DifferenceThreshold="50" InitialLearningRate="0.5" InitialLearningTime="30" LearningRate="0.01" RespectIgnore="1" ShadowLearningRate="0.01" SyntheticBackgroundColor="0" UpdateBackground="1"/>
    </DynamicBackgroundSubtraction>
    <BlobDetectAction category="Action" enabled="1" name="Action">
      <Keys size="4">
        <key val="DBSOutImage"/>
        <key val="blobs"/>
        <key val="blobsimg"/>
	<key val="BlobGC"/>
      </Keys>
      <ActionConfig IgnoreFrames="80" MinPixels="20" MinRoundness="0.2" Threshold="15"/>
    </BlobDetectAction>
    <BlobTrackingAction category="Action" enabled="1" name="Action">
      <Keys size="2">
        <key val="blobs"/>
        <key val="blobstracked"/>
      </Keys>
      <ActionConfig JitterFrames="30" JitterRadius="2" MaxDistance="20" MaxFramesLoss="3" MeldDistance="4" MinAccel="-1" MinSpeed="2" Mode="2" debugMsg="1"/>
    </BlobTrackingAction>
    
     <Blob2ImageMask category="Action" enabled="1" name="Action">
      <Keys size="2">
        <key val="blobstracked"/>
        <key val="ImageMask"/>
      </Keys>
      <ActionConfig ImageHeight="480" ImageWidth="752" MinSizeBlobs="15" SizeFactor="1.1"/>
    </Blob2ImageMask>
    <RadialUndistortBlobsAction category="Action" enabled="1" name="Action" val="RadialUndistortBlobsAction">
      <Keys size="3">
        <key val="sphereUndist"/>
        <key val="blobstracked"/>
        <key val="blobstrackedRadUndist"/>
      </Keys>
    </RadialUndistortBlobsAction>
    <BlobUndistortAction category="Action" enabled="1" name="Action">
      <Keys size="2">
        <key val="blobstrackedRadUndist" what="Blob Container , in"/>
        <key val="blobstrackedU" what="Blob Container , out"/>
      </Keys>
      <ActionConfig ImageHeight="480" ImageWidth="752" affX="1" affY="1" offX="0" offY="0" 
      px0="831.062" 
      px1="-27.364" 
      px2="8.621" 
      px3="796.721" 
      py0="-20.497" 
      py1="-19.676" 
      py2="479.843" 
      py3="490.213"/>
	</BlobUndistortAction>
      
    <Blobs2GeometryAction category="Action" enabled="1" name="Action" val="Blobs2GeometryAction">
      <Keys size="3">
        <key val="blobstrackedU"/>
        <key val="blob_positions"/>
        <key val="blob_radius_intensity_id"/>
      </Keys>
      <ActionConfig TransferIdInPosVector="1"/>
    </Blobs2GeometryAction>    
  </ActionPipe>	

  <DataSet key="">
    <!-- INTRINSIC DATA VALUES -->
	<IntrinsicDataPerspective calibrated="1" key="sphereUndist">
		<Image_Resolution w="752" h="480" />
		<Normalized_Principal_Point cx="0.4583125" cy="0.53768125" />
		<Normalized_Focal_Length_and_Skew fx="0.65684707" fy="1.0270354166" s="0.0" />
		<Lens_Distortion k1="-0.303080" k2="0.097056" k3="0.000726" k4="-0.000406 " k5="0.0" />
	</IntrinsicDataPerspective>
  </DataSet>

  <Activity name="NOP"/>

</VisionLib2>
