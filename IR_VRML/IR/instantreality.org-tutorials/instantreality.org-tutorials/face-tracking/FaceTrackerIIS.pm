<?xml version="1.0" encoding="UTF-8"?>
<VisionLib2 version='2.0'>
  <ActionPipe category='Action' name='main'>
    <VideoSourceAction__ImageT__RGB_Frame category='Action' enabled='1' name='VideoSourceAction'>
      <Keys size='2'>
        <key val='VideoSourceImage' what='image live, Image*, out'/>
        <key val='' what='intrinsic parameters to be modified, out'/>
      </Keys>
      <ActionConfig source_url='ds://mode=640x480xBI_RGB;unit=0;'/>
    </VideoSourceAction__ImageT__RGB_Frame>
    <ImageConvertActionT__ImageT__RGB_FrameImageT__GREY_Frame category='Action' enabled='1' name='ImageConvertActionT'>
      <Keys size='2'>
        <key val='VideoSourceImage' what='source image, in'/>
        <key val='ImageGrey' what='target image, out'/>
      </Keys>
    </ImageConvertActionT__ImageT__RGB_FrameImageT__GREY_Frame>
    <ShoreAction category='Action' enabled='1' name='Shore'>
      <Keys size='3'>
        <key val='ImageGrey' what='Image to process, in'/>
        <key val='JsonString'/>        
        <key val='DetectedFaces'/>
      </Keys>
      <ActionConfig AnalyzeAge='1' AnalyzeAngry='0' AnalyzeEyes='0' AnalyzeGender='1' AnalyzeHappy='1' AnalyzeMouth='0' AnalyzeSad='0' AnalyzeSurprised='0' Engine='custom' IdMemoryLength='5' IdMemotyType='Spatial' ImageScale='1' MinFaceScore='9' MinFaceSize='0' ModelType='Face.Front' SearchEyes='1' SearchMouth='0' SearchNose='0' ThreadCount='1' TimeBase='0.02' TrackFaces='1' UpdateTimeBase='1'/>
    </ShoreAction>
    <MegaWidgetActionPipe height='300' name='Viewer' show='1' viewerid='0' width='400' x='0' y='0'>
      <Keys size='8'>
        <key val='mwap' what='internal use, do not set or change!'/>
        <key val='ImageGrey' what='background, Image*, in'/>
        <key val='DetectedFaces' what='2D geometry, GeometryContainer, in'/>
        <key val='' what='3D geometry, GeometryContainer, in'/>
        <key val='' what='Camera extrinsic parameters, ExtrinsicData, in'/>
        <key val='' what='Camera intrinsic parameters, IntrinsicDataPerspective, in'/>
        <key val='' what='OSG 3D Models, OSGNodeData, in'/>
        <key val='' what='caption string, StringData, in'/>
      </Keys>
    </MegaWidgetActionPipe>
  </ActionPipe>
   <DataSet key=''>
    <GeometryContainer key='DetectedFaces'/>
    <StringData key='JsonString' val='{&#xA;"faces": [ &#xA;]&#xA;}&#xA;'/>
  </DataSet>
  <Activity name='NOP'/>
</VisionLib2>