<?xml version="1.0" encoding="UTF-8" standalone="no" ?>
<VisionLib2 Version="2.0">

  <ActionPipe category="Action" name="main">
    <WiiSourceAction category="Action" enabled="1" name="Action">
      <Keys size="3">
        <key val="WiiPoints" what="GeometryContainer, out"/>
        <key val="debugImage" what="ImageRGB, out"/>
        <key val="WiiData1" what="Dataset, out"/>
      </Keys>
      <ActionConfig Rotationswinkel="0"/>
    </WiiSourceAction>
    <IRLEDTrackingAction category="Action" enabled="1" name="Action">
      <Keys size="3">
        <key val="myLEDModel" what="LED Model , in"/>
        <key val="WiiPoints" what="GeometryContainer , in"/>
        <key val="myCorresp" what="CorrespondencyContainer , out"/>
      </Keys>
      <ActionConfig MaxError="20"/>
    </IRLEDTrackingAction>
    <Point3PoseAction category="Action" enabled="1" name="Action">
      <Keys size="3">
        <key val="myCorresp" what="CorrespondencyContainer , in"/>
        <key val="Intrinsics" what="Intrinsic , in"/>
        <key val="myExtrinsics" what="Extrinsic Container with up to 4 Extrinsic... ,out"/>
      </Keys>
      <ActionConfig p1x="0" p1y="0" p1z="0" p2x="0" p2y="0" p2z="0" p3x="0" p3y="0" p3z="0"/>
    </Point3PoseAction>
    <PoseEstimation category="Action" enabled="1" name="Action">
      <Keys size="5">
        <key val="myExtrinsics" what="Extrinsic Container , in"/>
        <key val="myCorresp" what="CorrespondencyContainer , in"/>
        <key val="Intrinsics" what="Intrinsic , in"/>
        <key val="Pose" what="Extrinsic, out"/>
        <key val="IDPoint" what="HomgPoint3Container , in"/>
      </Keys>
    </PoseEstimation>
    <PoseNLLSAction category='Action' enabled='1' name='PoseNLLS'>
      <Keys size='5'>
        <key val='Intrinsics' what='intrinsic params'/>
        <key val='myCorresp' what='2d3d correspondences'/>
        <key val='NLLSPose' what='6 dof'/>
        <key val='Pose' what='Input 6DOF, ExtrinsicData*, in'/>
        <key val='' what='CorrespondencyContainer 2D2D (optional), in'/>
      </Keys>
      <ActionConfig Accuracy='1' CalculateCovariance='1' CalculateCovarianceFromPoints='1' CheckValidity='1' DoubleEquation='1' Estimator='0' MinNumfCorrespondences='3' TukeyConstant='4.6851' UpdatePointCovariances='0' ValidityThreshold='50' WithoutRotY='0'/>
    </PoseNLLSAction>
    <ComputeCameraAction category="Action" enabled="1" name="Action">
      <Keys size="3">
        <key val="Intrinsics"/>
        <key val="NLLSPose"/>
        <key val="InstantCamera"/>
      </Keys>
      <ActionConfig CeilingTrack="0" ForceValid="1"/>
    </ComputeCameraAction>
    
   <!--MegaWidgetActionPipe height="480" name="WidgetActionPipe" show="1" viewerid="0" width="640" x="0" y="0">
      <Keys size="8">
        <key val="mwap_2" what="internal use, do not set or change!"/>
        <key val="debugImage" what="background, Image*, in"/>
        <key val="WiiPoints" what="2D geometry, GeometryContainer, in"/>
        <key val="" what="3D geometry, GeometryContainer, in"/>
        <key val="" what="Camera extrinsic parameters, ExtrinsicData, in"/>
        <key val="" what="Camera intrinsic parameters, IntrinsicDataPerspective, in"/>
        <key val="CoordFrame;" what="OSG 3D Models, OSGNodeData, in"/>
        <key val="Toller Viewer" what="caption string, StringData&lt;string>, in"/>
      </Keys>
    </MegaWidgetActionPipe-->
  </ActionPipe>

  <DataSet key="">
  
    <OSGNodeData fileName="CoordFrame.wrl" key="CoordFrame"/>
       
    <IntrinsicDataPerspective calibrated="1" key="Intrinsics">      
      <Image_Resolution h="768" w="1024"/>      
      <Normalized_Principal_Point cx="0.5224609375" cy="0.523046875"/>      
      <Normalized_Focal_Length_and_Skew fx="1.27568359375" fy="1.695703125" s="0.0"/>      
      <Lens_Distortion k1="0.0" k2="0.0" k3="0.0" k4="0.0" k5="0.0"/>
    </IntrinsicDataPerspective>

    <!--HomgPoint3Container key="IDPoint">
      <HomgPoint3d w="1" x="0" y="15.4" z="0"/>
      <HomgPoint3d w="1" x="2" y="15.4" z="0"/>
      <HomgPoint3d w="1" x="4" y="15.4" z="0"/>
    </HomgPoint3Container-->


    <LEDModel key="myLEDModel">
      <LED>
      <Position x="0" y="0" z="0"/>
      </LED>
      <LED>
        <Position x="12.2" y="0" z="0"/>
      </LED>
      <LED>
        <Position x="12.2" y="15.4" z="0"/>
      </LED>
      <LED>
        <Position x="0" y="15.4" z="0"/>
      </LED>      
    </LEDModel>
    
        
  </DataSet>  

</VisionLib2>
