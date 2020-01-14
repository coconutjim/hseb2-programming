<?xml version="1.0" encoding="UTF-8" standalone="no" ?>
<VisionLib2 Version="2.0">

  <ActionPipe category="Action" name="main">  

    <MegaWidgetActionPipe height="295" name="WidgetActionPipe" show="1" width="624" x="0" y="0">
      <Keys size="8">
        <key val="mwap"/>
        <key val="InstantVideo"/>
        <key val=""/>
        <key val=""/>
        <key val="InstantCamera.ExtrinsicData"/>
        <key val="InstantCamera.IntrinsicDataPerspective"/>
        <key val="ffmmodel;"/>
        <key val=""/>
      </Keys>
    </MegaWidgetActionPipe> 
    
    <!--VideoSourceAction category="Action" enabled="1" name="VideoSourceAction">
      <Keys size="2">
        <key val="InstantVideo"/>
        <key val=""/>
      </Keys>
      <ActionConfig preferred_height="480" preferred_width="640" shutter="-1" source_url="ds"/>
    </VideoSourceAction-->
    
    <ImageReaderAction category="Action" enabled="1" name="ImageReaderAction">
      <Keys size="2">
        <key val="InstantVideo"/>
        <key val=""/>
      </Keys>
      <ActionConfig repeat="1" bMarkOrigin="0" iImageCount="0" iLastImage="99999" iMode="2" 

                    iNumberOfDigits="1" 

                    szImageFileName="project_dir:Data/images/*.jpg"/>
    </ImageReaderAction>
    
    <ImageConvertActionT__ImageT__RGB_FrameImageT__GREY_Frame category="Action" enabled="1" name="ImageConvertActionT">
      <Keys size="2">
        <key val="InstantVideo"/>
        <key val="ImageLiveGrey"/>
      </Keys>
    </ImageConvertActionT__ImageT__RGB_FrameImageT__GREY_Frame>
    
    <ImageResizeAction category="Action" enabled="1" name="Action">
      <Keys size="2">
        <key val="ImageLiveGrey"/>
        <key val="ImageLiveGreySmall"/>
      </Keys>
      <ActionConfig Method="4" NewHeight="240" NewWidth="320"/>
    </ImageResizeAction>
    
    <BuildImagePyramidAction category="Action" enabled="1" name="BuildImagePyramidAction">
      <Keys size="3">
        <key val="ImageLiveGreySmall"/>
        <key val="ImagePyramid"/>
        <key val=""/>
      </Keys>
      <ActionConfig levels="4" GaussMaskSize="3" BlurOrigImage="0"/>
    </BuildImagePyramidAction>

    <IfAction category="Action" name="IfAction1">
      <Keys size="1">
        <key val="0_80874y_"/>
      </Keys>
      <ActionConfig Condition="[World.Poster.KLTModel:TotalThreeDCorrespondences]&lt;5"/>
      <ActionPipe category="Action" name="AddFeaturesAP">
         <ImageConvertActionT__ImageT__RGB_FrameImageT__GREY_Frame category="Action" enabled="1" name="ImageConvertActionT">
          <Keys size="2">
            <key val="RefImage"/>
            <key val="RefImageGrey"/>
          </Keys>
         </ImageConvertActionT__ImageT__RGB_FrameImageT__GREY_Frame>
        <BuildImagePyramidAction category="Action" enabled="1" name="BuildImagePyramidAction">
          <Keys size="3">
            <key val="RefImageGrey"/>
            <key val="RefImagePyramid"/>
            <key val=""/>
          </Keys>
          <ActionConfig levels="4" GaussMaskSize="3" BlurOrigImage="0"/>
        </BuildImagePyramidAction>
        <FastFeatureExtractAction category="Action" name="Action">
          <Keys size="5">
            <key val="RefImagePyramid"/>
            <key val="World.Poster.KLTModel.AllCorrespondences"/>
            <key val="NewPoints"/>
            <key val=""/>
            <key val=""/>
          </Keys>
          <ActionConfig ClearFeatureMap="1" ConsecutivePixelNumber="10" CornerThreshold="20" FeatureDistance="120" FeatureMapScale="0" MaxConsecutivePixelNumber="12" WithRefImage3DPoints="1"/>
        </FastFeatureExtractAction>
         <ComputeCameraAction category="Action" name="Action" val="ComputeCameraAction">
          <Keys size="3">
            <key val="RefIntrinsics"/>
            <key val="RefPose"/>
            <key val="InitCamera"/>
          </Keys>
        </ComputeCameraAction>
        
        <InitKLTCorrespondencesAction category="Action" name="Action">
          <Keys size="4">
            <key val="RefImagePyramid"/>
            <key val="NewPoints"/>
            <key val="InitCamera"/>
            <key val="World.Poster.KLTModel"/>
          </Keys>
          <ActionConfig ClearAllCorrespondences="0" DoEntropyFiltering="0" MinPatchEntropy="3.5" PatchSize="10" Valid3DOnly="0" Persistent="1"/>
        </InitKLTCorrespondencesAction>
      </ActionPipe>
    </IfAction>
    
    <IfAction category="Action" name="IfAction2">
      <Keys size="1">
        <key val="0_477397_"/>
      </Keys>
      <ActionConfig Condition="[World.Poster.ExtrinsicData:PoseValid]!=1"/>

      <ActionPipe category="Action" name="ReInitAP">
        
        <ImageCircleBasedCornerDetectAction category="Action" enabled="1" name="Action">
          <Keys size="3">
            <key val="ImagePyramid"/>
            <key val="Keypoints"/>
            <key val="GeoKeypoints"/>
          </Keys>
          <ActionConfig BorderSize="20" EdgeScoreThreshold="0.6" GeneratePrimitivesFlag="0" MaxCandidatesNumber="8000" NeighborhoodSize="6" NumberOfOppositeNeighbors="8" SearchDepth="3" Threshold="20" bAlternateCircleOrder="1" bProportionalNeighborhood="1"/>
        </ImageCircleBasedCornerDetectAction>
        <ClassifyWithRandomizedTreesAction category="Action" enabled="1" name="Action">
          <Keys size="9">
            <key val="ImagePyramid"/>
            <key val="Keypoints"/>
            <key val="Points3L"/>
            <key val="corres"/>
            <key val="GeoMatches"/>
            <key val="InstantCamera"/>
            <key val=""/>
            <key val=""/>
            <key val=""/>
          </Keys>
         <ActionConfig ConfidenceThreshold="0.1" ForestPath="project_dir:/Data/trees" GeneratePrimitivesFlag="0" NumberOfActiveTrees="30" SaveForestNextTime="0" SearchDepth="3" ShannonWeight="1"/>
        </ClassifyWithRandomizedTreesAction>
        <PoseRANSACAction category="Action" enabled="1" name="PoseRANSACAction">
          <Keys size="7">
            <key val="IntrinsicsSmall"/>
            <key val="corres"/>
            <key val="World.Poster.ExtrinsicData"/>
            <key val="InternalRandomCorresps"/>
            <key val="InternalInlierCorresps"/>
            <key val="InternalOutliersCorresps"/>
            <key val="InternalRANSACPose"/>
          </Keys>
          <ActionConfig CalculateCovarianceFromPoints="0" ErrorTol="10" Frame2FrameTracking="0" LogCorrespondences="0" LogResults="0" MaxLoopcount="10" MinInCorresp="6" MinInliers="6" MinNbSamples="6" PROSAC="1" PercentageInliers="0.6" UpdatePointCovariances="0" bNLLSIter="1" bOnlyNLLSIter="0"/>
        </PoseRANSACAction>
      
            
      </ActionPipe>

    </IfAction> 
    
    <IfAction category="Action" name="IfAction3">
      <Keys size="1">
        <key val="0_477397_"/>
      </Keys>
      <ActionConfig Condition="[World.Poster.ExtrinsicData:PoseValid]==1"/>
        <ActionPipe category="Action" name="KLTAP">
    
          <KLTProjectPointsAction category="Action" name="Action">
            <Keys size="4">
              <key val="World.Poster.KLTModel"/>
              <key val="IntrinsicsSmall"/>
              <key val="World.Poster.ExtrinsicData"/>
              <key val="ImagePyramid"/>
            </Keys>
            <ActionConfig HandleDistortion="0"/>
          </KLTProjectPointsAction>
      
          <KLTTrackingAction category="Action" name="Action">
            <Keys size="2">
              <key val="ImagePyramid"/>
              <key val="World.Poster.KLTModel"/>
            </Keys>
            <ActionConfig CalcError="1" CalcProjectiveTrans="0" EpsBT="0.029999999329447746" EpsF2F="0.029999999329447746" ErrorThreshold="25" MaxBTIter="8" MaxIter="8" TrackOnlyNotTrackedFeatures="0"/>
          </KLTTrackingAction>
          
          <PoseNLLSAction Accuracy="2" category="Action" name="LineInitActionNLLS">
            <Keys size="5">
              <key val="IntrinsicsSmall"/>
              <key val="World.Poster.KLTModel.ValidCorrespondences"/>
              <key val="World.Poster.ExtrinsicData"/>
              <key val="World.Poster.ExtrinsicData"/>
              <key val=""/>
            </Keys>
            <ActionConfig CalculateCovariance="0" CalculateCovarianceFromPoints="1" CheckValidity="0" DoubleEquation="0" Estimator="1" MinNumfCorrespondences="6" TukeyConstant="3" UpdatePointCovariances="0" ValidityThreshold="50"/>
          </PoseNLLSAction>
          
          <KLTVisualOutputAction category="Action" name="Action">
            <Keys size="5">
              <key val="World.Poster.KLTModel"/>
              <key val="DrawGeometry"/>
              <key val=""/>
              <key val=""/>
              <key val="DrawGeometry3D"/>
            </Keys>
            <ActionConfig DeleteAllElements="1" WithHelperPointOutput="0" WithNormalOutput="0" WithPatchOutput="0" WithPointOutput="1" WithRectOutput="1" WithHomography="0"/>
         </KLTVisualOutputAction>
       </ActionPipe>
  
    </IfAction>     

     <IfAction category="Action" name="IfAction4">
      <Keys size="1">
        <key val="0_477397_"/>
      </Keys>
      <ActionConfig Condition="[World.Poster.ExtrinsicData:PoseValid]!=1"/>
      <ActionPipe category="Action" name="ReInitAP">
        
        <ExtrinsicDataCopyAction category="Action" name="CopyLastValidPose">
          <Keys size="2">
            <key val="DummyPose"/>
            <key val="World.Poster.ExtrinsicData"/>
          </Keys>
          <ActionConfig/>
        </ExtrinsicDataCopyAction>
      </ActionPipe>
      
    </IfAction>
    
    <IfAction category="Action" name="IfAction5">
      <Keys size="1">
        <key val="0_477397_"/>
      </Keys>
      <ActionConfig Condition="[World.Poster.ExtrinsicData:PoseValid]!=1"/>
      <ActionPipe category="Action" name="ReInitAP">
        <ExtrinsicDataCopyAction category="Action" name="CopyLastValidPose">
          <Keys size="2">
            <key val="OutputPoseDummy"/>
            <key val="OutputPose"/>
          </Keys>
          <ActionConfig/>
        </ExtrinsicDataCopyAction>
      </ActionPipe>
    </IfAction>
    
    <IfAction category="Action" name="IfAction6">
      <Keys size="1">
        <key val="0_477397_"/>
      </Keys>
      <ActionConfig Condition="[World.Poster.ExtrinsicData:PoseValid]==1"/>
      <ActionPipe category="Action" name="ReInitAP">
        <ExtrinsicDataCopyAction category="Action" name="CopyLastValidPose">
          <Keys size="2">
            <key val="World.Poster.ExtrinsicData"/>
            <key val="OutputPose"/>
          </Keys>
          <ActionConfig/>
        </ExtrinsicDataCopyAction>
      </ActionPipe>
    </IfAction>
    
    
    <ComputeCameraAction category="Action" enabled="1" name="Action">
      <Keys size="3">
        <key val="Intrinsics"/>
        <key val="OutputPose"/>
        <key val="InstantCamera"/>
      </Keys>
      <ActionConfig CeilingTrack="0" ForceValid="0"/>
    </ComputeCameraAction>

  </ActionPipe>

  <DataSet key="">
    <OSGNodeData fileName="project_dir:Data/Frankfurt_neu.wrl" key="ffmmodel"/>
    <DataContainerPtr__Point3L key="Points3L">
      <Point3L label="0" x="-120.871" y="195.207" z="-2.29353"/>
      <Point3L label="1" x="-614.704" y="228.051" z="-2.54927"/>
      <Point3L label="2" x="304.467" y="345.25" z="-2.01964"/>
      <Point3L label="3" x="-381.086" y="-110.118" z="-0.770876"/>
      <Point3L label="4" x="-279.238" y="-143.951" z="-2.48262"/>
      <Point3L label="5" x="187.662" y="316.397" z="-1.00346"/>
      <Point3L label="6" x="246.096" y="284.567" z="-0.712925"/>
      <Point3L label="7" x="304.519" y="112.968" z="-2.4051"/>
      <Point3L label="8" x="418.403" y="-59.4663" z="-2.08133"/>
      <Point3L label="9" x="320.071" y="-421.745" z="-2.24486"/>
      <Point3L label="10" x="-10.3706" y="-273.74" z="-2.37756"/>
      <Point3L label="11" x="549.876" y="184.726" z="-1.93654"/>
      <Point3L label="12" x="-338.319" y="328.901" z="-2.30879"/>
      <Point3L label="13" x="55.9678" y="99.4592" z="-0.738919"/>
      <Point3L label="14" x="-64.7715" y="-329.778" z="-2.42414"/>
      <Point3L label="15" x="410.343" y="43.1012" z="-2.05452"/>
      <Point3L label="16" x="528.683" y="11.0405" z="-2.00075"/>
      <Point3L label="17" x="-604.133" y="-187.196" z="-0.783323"/>
      <Point3L label="18" x="388.379" y="-82.2347" z="-0.755653"/>
      <Point3L label="19" x="-311.409" y="-264.544" z="1.2596"/>
      <Point3L label="20" x="366.464" y="241.714" z="-2.01777"/>
      <Point3L label="21" x="630.037" y="-176.401" z="-2.0031"/>
      <Point3L label="22" x="-393.402" y="428.117" z="-2.36894"/>
      <Point3L label="23" x="396.789" y="311.515" z="-1.98035"/>
      <Point3L label="24" x="395.222" y="358.737" z="-1.96686"/>
      <Point3L label="25" x="-627.68" y="265.807" z="-0.932276"/>
      <Point3L label="26" x="566.981" y="-6.94829" z="-1.98557"/>
      <Point3L label="27" x="-325.098" y="-127.217" z="-2.63388"/>
      <Point3L label="28" x="-53.9374" y="-276.563" z="1.26143"/>
      <Point3L label="29" x="621.759" y="62.1097" z="-1.09045"/>
      <Point3L label="30" x="270.414" y="128.62" z="-2.1037"/>
      <Point3L label="31" x="-105.314" y="105.749" z="-2.3123"/>
      <Point3L label="32" x="-342.845" y="298.75" z="-0.721164"/>
      <Point3L label="33" x="-267.678" y="89.5465" z="-0.384977"/>
      <Point3L label="34" x="381.204" y="50.9197" z="-0.739411"/>
      <Point3L label="35" x="48.0633" y="227.985" z="-2.19283"/>
      <Point3L label="36" x="-429.942" y="102.887" z="-0.746083"/>
      <Point3L label="37" x="-141.429" y="145.439" z="-2.42088"/>
      <Point3L label="38" x="233.422" y="258.444" z="-2.08411"/>
      <Point3L label="39" x="334.281" y="-386.373" z="-0.793294"/>
      <Point3L label="40" x="492.927" y="231.442" z="-1.95302"/>
      <Point3L label="41" x="329.888" y="147.626" z="-2.06594"/>
      <Point3L label="42" x="600.837" y="-149.693" z="-2.01072"/>
      <Point3L label="43" x="169.939" y="290.711" z="-2.10836"/>
      <Point3L label="44" x="-169.919" y="280.454" z="-0.720507"/>
      <Point3L label="45" x="393.773" y="247.587" z="-1.25692"/>
      <Point3L label="46" x="150.655" y="-276.905" z="1.26734"/>
      <Point3L label="47" x="-285.827" y="-256.097" z="-2.52072"/>
      <Point3L label="48" x="-571.64" y="-176.551" z="1.29479"/>
      <Point3L label="49" x="207.455" y="287.531" z="-1.01339"/>
      <Point3L label="50" x="-91.6545" y="187.562" z="-1.00969"/>
      <Point3L label="51" x="-385.326" y="251.243" z="-0.727622"/>
      <Point3L label="52" x="-321.254" y="-173.421" z="-0.777656"/>
      <Point3L label="53" x="138.003" y="308.265" z="-0.711897"/>
      <Point3L label="54" x="9.94264" y="-306.498" z="-0.788602"/>
      <Point3L label="55" x="350.164" y="-54.9578" z="-0.752936"/>
      <Point3L label="56" x="-183.011" y="125.557" z="-2.34793"/>
      <Point3L label="57" x="293.226" y="168.844" z="-2.36676"/>
      <Point3L label="58" x="234.97" y="319.196" z="-2.06487"/>
      <Point3L label="59" x="520.52" y="-156.055" z="-1.34203"/>
      <Point3L label="60" x="-563.548" y="-97.0681" z="-0.772059"/>
      <Point3L label="61" x="341.583" y="330.464" z="-2.00419"/>
      <Point3L label="62" x="-282.764" y="-185.782" z="-2.49744"/>
      <Point3L label="63" x="-632.115" y="297.576" z="-2.53726"/>
      <Point3L label="64" x="534.82" y="229.467" z="-0.714847"/>
      <Point3L label="65" x="600.782" y="224.31" z="-1.89719"/>
      <Point3L label="66" x="246.998" y="108.126" z="-0.734701"/>
      <Point3L label="67" x="-387.276" y="-146.304" z="-2.54162"/>
      <Point3L label="68" x="-86.6896" y="142.477" z="-2.29118"/>
      <Point3L label="69" x="152.082" y="250.974" z="-2.13007"/>
      <Point3L label="70" x="295.848" y="311.28" z="-2.03457"/>
      <Point3L label="71" x="427.328" y="222.61" z="-1.99096"/>
      <Point3L label="72" x="454.189" y="53.2144" z="-0.73795"/>
      <Point3L label="73" x="569.27" y="-185.994" z="-2.03869"/>
      <Point3L label="74" x="-151.165" y="205.616" z="-0.998662"/>
      <Point3L label="75" x="331.637" y="-9.99272" z="-2.11291"/>
      <Point3L label="76" x="-374.743" y="353.474" z="-0.714928"/>
      <Point3L label="77" x="291.031" y="-9.72186" z="-2.1346"/>
      <Point3L label="78" x="358.648" y="-417.318" z="-0.796706"/>
      <Point3L label="79" x="371.042" y="345.596" z="-1.01447"/>
      <Point3L label="80" x="-551.496" y="-158.211" z="-2.6339"/>
      <Point3L label="81" x="54.3064" y="-319.111" z="-2.35668"/>
      <Point3L label="82" x="-256.903" y="-97.5512" z="-2.45647"/>
      <Point3L label="83" x="38.1798" y="-383.862" z="1.2118"/>
      <Point3L label="84" x="-262.983" y="183.85" z="-2.40439"/>
      <Point3L label="85" x="-486.024" y="-73.2459" z="-0.768075"/>
      <Point3L label="86" x="-618.015" y="65.5963" z="-2.60106"/>
      <Point3L label="87" x="-238.42" y="95.7115" z="-2.46532"/>
      <Point3L label="88" x="176.819" y="-265.77" z="-0.781371"/>
      <Point3L label="89" x="376.118" y="280.998" z="-2.00068"/>
      <Point3L label="90" x="612.556" y="171.338" z="-1.90696"/>
      <Point3L label="91" x="-328.028" y="372.247" z="-2.35098"/>
      <Point3L label="92" x="-378.026" y="-25.8047" z="-2.49968"/>
      <Point3L label="93" x="264.512" y="-117.109" z="-2.18143"/>
      <Point3L label="94" x="116.935" y="-278.668" z="-2.31042"/>
      <Point3L label="95" x="347.03" y="-448.298" z="-2.23847"/>
      <Point3L label="96" x="-628.647" y="95.3087" z="-0.97782"/>
      <Point3L label="97" x="353.278" y="-86.1522" z="-2.12442"/>
      <Point3L label="98" x="-577.132" y="-222.447" z="-0.787196"/>
      <Point3L label="99" x="454.051" y="-70.7121" z="-2.0656"/>
      <Point3L label="100" x="-375.555" y="167.429" z="-2.42709"/>
      <Point3L label="101" x="-376.139" y="386.566" z="-0.710863"/>
      <Point3L label="102" x="373.111" y="-390.37" z="0.742446"/>
      <Point3L label="103" x="-420.696" y="-123.364" z="-2.64041"/>
      <Point3L label="104" x="-572.155" y="369.75" z="-0.716142"/>
      <Point3L label="105" x="420.181" y="433.758" z="-1.93065"/>
      <Point3L label="106" x="-401.084" y="8.47153" z="-0.757014"/>
      <Point3L label="107" x="-271.121" y="441.023" z="-0.92216"/>
      <Point3L label="108" x="456.387" y="-6.08313" z="-2.04477"/>
      <Point3L label="109" x="214.423" y="162.233" z="-1.04823"/>
      <Point3L label="110" x="20.9786" y="215.269" z="-0.725275"/>
      <Point3L label="111" x="585.679" y="178.817" z="-2.2625"/>
      <Point3L label="112" x="-67.0072" y="359.111" z="-2.26403"/>
      <Point3L label="113" x="-579.629" y="219.314" z="-2.40956"/>
      <Point3L label="114" x="-297.216" y="296.948" z="-2.35723"/>
      <Point3L label="115" x="194.782" y="136.556" z="-2.14187"/>
      <Point3L label="116" x="472.586" y="305.164" z="-1.94155"/>
      <Point3L label="117" x="-447.188" y="-9.42505" z="-2.53192"/>
      <Point3L label="118" x="193.49" y="242.302" z="-2.11048"/>
      <Point3L label="119" x="459.662" y="222.355" z="-0.717049"/>
      <Point3L label="120" x="530.367" y="-198.739" z="-2.06348"/>
      <Point3L label="121" x="339.271" y="112.184" z="-0.732558"/>
      <Point3L label="122" x="51.5841" y="-358.57" z="-2.37023"/>
      <Point3L label="123" x="-540.709" y="-191.329" z="-0.782815"/>
      <Point3L label="124" x="531.624" y="-29.9609" z="-2.01164"/>
      <Point3L label="125" x="-600.151" y="256.301" z="-0.730238"/>
      <Point3L label="126" x="-423.549" y="66.2924" z="-2.4959"/>
      <Point3L label="127" x="-402.709" y="185.651" z="-0.735798"/>
      <Point3L label="128" x="-357.57" y="-177.283" z="-0.778639"/>
      <Point3L label="129" x="-512.428" y="-54.8593" z="-0.766214"/>
      <Point3L label="130" x="112.717" y="23.8694" z="-0.747227"/>
      <Point3L label="131" x="381.839" y="-30.9184" z="-0.74948"/>
      <Point3L label="132" x="-308.111" y="-231.691" z="-0.784278"/>
      <Point3L label="133" x="-141.769" y="352.382" z="-2.25698"/>
      <Point3L label="134" x="-359.292" y="35.4857" z="-2.47064"/>
      <Point3L label="135" x="-414.692" y="238.791" z="-0.729516"/>
      <Point3L label="136" x="-635.015" y="-202.545" z="-2.69263"/>
      <Point3L label="137" x="63.6671" y="-399.113" z="-2.3762"/>
      <Point3L label="138" x="-633.365" y="238.054" z="-0.341586"/>
      <Point3L label="139" x="190.673" y="72.7774" z="1.4388"/>
      <Point3L label="140" x="209.672" y="352.696" z="-0.705161"/>
      <Point3L label="141" x="498.743" y="-313.477" z="-2.11532"/>
      <Point3L label="142" x="-564.905" y="-23.4588" z="-0.763261"/>
      <Point3L label="143" x="-366.421" y="219.799" z="-2.41789"/>
      <Point3L label="144" x="572.155" y="234.155" z="-1.04859"/>
      <Point3L label="145" x="-508.145" y="375.241" z="-0.714584"/>
      <Point3L label="146" x="119.62" y="-41.0224" z="0.569614"/>
      <Point3L label="147" x="-21.9541" y="144.164" z="-2.25589"/>
      <Point3L label="148" x="-604.023" y="108.064" z="-2.58043"/>
      <Point3L label="149" x="205.992" y="427.243" z="-0.696165"/>
      <Point3L label="150" x="-269.654" y="-303.814" z="1.24163"/>
      <Point3L label="151" x="184.545" y="-342.187" z="-0.79028"/>
      <Point3L label="152" x="620.794" y="-124.264" z="-1.16814"/>
      <Point3L label="153" x="184.262" y="206.997" z="-2.12615"/>
      <Point3L label="154" x="-173.31" y="245.331" z="-2.30641"/>
      <Point3L label="155" x="449.36" y="-45.3062" z="-0.915832"/>
      <Point3L label="156" x="-85.9209" y="-278.577" z="-0.786576"/>
      <Point3L label="157" x="170.144" y="97.2664" z="-2.16697"/>
      <Point3L label="158" x="479.931" y="95.2212" z="-2.00139"/>
      <Point3L label="159" x="-576.671" y="58.1706" z="-0.75356"/>
      <Point3L label="160" x="-80.0551" y="279.886" z="-2.24588"/>
      <Point3L label="161" x="414.58" y="-130.766" z="-2.10506"/>
      <Point3L label="162" x="-355.451" y="249.07" z="-0.727471"/>
      <Point3L label="163" x="590.999" y="74.2742" z="-1.94799"/>
      <Point3L label="164" x="-413.883" y="-210.397" z="-0.783225"/>
      <Point3L label="165" x="-345.014" y="126.145" z="-0.742026"/>
      <Point3L label="166" x="348.983" y="197.788" z="-2.04053"/>
      <Point3L label="167" x="-245.423" y="-230.341" z="-0.783255"/>
      <Point3L label="168" x="-200.29" y="-138.907" z="-2.43859"/>
      <Point3L label="169" x="-603.701" y="32.7525" z="-0.997326"/>
      <Point3L label="170" x="-404.051" y="214.015" z="1.04144"/>
      <Point3L label="171" x="-487.795" y="-415.841" z="-2.67878"/>
      <Point3L label="172" x="-405.91" y="398.18" z="-0.710004"/>
      <Point3L label="173" x="138.172" y="-338.884" z="-2.31753"/>
      <Point3L label="174" x="-659.854" y="295.907" z="-0.9208"/>
      <Point3L label="175" x="-72.5138" y="91.9539" z="-0.741999"/>
      <Point3L label="176" x="-255.387" y="404.276" z="-2.3022"/>
      <Point3L label="177" x="262.6" y="184.084" z="-0.725055"/>
      <Point3L label="178" x="307.027" y="204.692" z="-1.05124"/>
      <Point3L label="179" x="-434.046" y="20.1489" z="-0.364638"/>
      <Point3L label="180" x="325.562" y="394.556" z="-1.23501"/>
      <Point3L label="181" x="519.745" y="361.548" z="-0.698902"/>
      <Point3L label="182" x="495.029" y="-164.993" z="-2.07225"/>
      <Point3L label="183" x="280.648" y="224.047" z="-2.06918"/>
      <Point3L label="184" x="-108.409" y="-401.857" z="-2.46993"/>
      <Point3L label="185" x="316.416" y="-321.537" z="-0.785955"/>
      <Point3L label="186" x="341.424" y="-340.326" z="1.2421"/>
      <Point3L label="187" x="345.016" y="371.121" z="-1.99001"/>
      <Point3L label="188" x="57.5755" y="-257.158" z="-0.782086"/>
      <Point3L label="189" x="-142.889" y="292.681" z="-2.31736"/>
      <Point3L label="190" x="-78.4079" y="28.0752" z="-2.32156"/>
      <Point3L label="191" x="276.494" y="-463.283" z="-2.28114"/>
      <Point3L label="192" x="97.631" y="205.7" z="-1.02429"/>
      <Point3L label="193" x="28.2458" y="-276.87" z="-0.784848"/>
      <Point3L label="194" x="577.219" y="-123.74" z="-1.30757"/>
      <Point3L label="195" x="-637.998" y="185.05" z="-0.952845"/>
      <Point3L label="196" x="42.9119" y="67.9623" z="-2.24414"/>
      <Point3L label="197" x="-506.414" y="-16.11" z="-2.56593"/>
      <Point3L label="198" x="231.145" y="222.142" z="-2.09637"/>
      <Point3L label="199" x="158.114" y="-33.2667" z="-2.21306"/>
    </DataContainerPtr__Point3L>
   

    <World key="World">
      <TrackedObject key="Poster">
        <ExtrinsicData calibrated="0">
          <R rotation="0.0 0.0 0.0 &#xA;"/>
          <t translation="0 0 810 &#xA;"/>      
          <Cov covariance="0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;"/>
        </ExtrinsicData>
        
        <KLTModel key="KLTModel"/>

      
      </TrackedObject>
    </World>
    
    <ExtrinsicData calibrated="1" key="RefPose">
      <R rotation="0 0.0 0.0 &#xA;"/>
      <t translation="0 0 1000 &#xA;"/>      
      <Cov covariance="0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;"/>
    </ExtrinsicData>
    <ExtrinsicData calibrated="1" key="OutputPose">
      <R rotation="0 0.0 0.0 &#xA;"/>
      <t translation="0 0 -800 &#xA;"/>      
      <Cov covariance="0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;"/>
    </ExtrinsicData>
    <ExtrinsicData calibrated="1" key="OutputPoseDummy">
      <R rotation="0 0.0 0.0 &#xA;"/>
      <t translation="0 0 -800 &#xA;"/>      
      <Cov covariance="0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;"/>
    </ExtrinsicData>
     <ExtrinsicData calibrated="0" key="DummyPose">
      <R rotation="0.0 0.0 0.0 &#xA;"/>
      <t translation="0 0 -800 &#xA;"/>      
      <Cov covariance="0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;"/>
    </ExtrinsicData>


    <IntrinsicDataPerspective calibrated="1" key="RefIntrinsics">
      <!--Image resolution (application-dependant)-->
      <Image_Resolution h="1024" w="1440"/>
      <!--Normalized principal point (invariant for a given camera)-->
      <Normalized_Principal_Point cx="0.5" cy="0.5"/>
      <!--Normalized focal length and skew (invariant for a given camera)-->
      <Normalized_Focal_Length_and_Skew fx="0.6944" fy="0.9765625" s="0"/>
      <!--Radial and tangential lens distortion (invariant for a given camera)-->
      <Lens_Distortion k1="0" k2="0" k3="0" k4="0" k5="0.0000000000e+000"/>
    </IntrinsicDataPerspective>
    <IntrinsicDataPerspective calibrated="1" key="Intrinsics">
      <!--Image resolution (application-dependant)-->
      <Image_Resolution h="480" w="640"/>
      <!--Normalized principal point (invariant for a given camera)-->
      <Normalized_Principal_Point cx="5.0011067410e-001" cy="4.9835188978e-001"/>
      <!--Normalized focal length and skew (invariant for a given camera)-->
      <Normalized_Focal_Length_and_Skew fx="1.2504241586e+000" fy="1.6663632953e+000" s="-5.8748098931e-004"/>
      <!--Radial and tangential lens distortion (invariant for a given camera)-->
      <Lens_Distortion k1="7.6962249137e-003" k2="2.1952754937e-002" k3="1.1167544754e-002" k4="-1.2299799950e-003" k5="0.0000000000e+000"/>
    </IntrinsicDataPerspective>
    <IntrinsicDataPerspective calibrated="1" key="IntrinsicsSmall">
      <!--Image resolution (application-dependant)-->
      <Image_Resolution h="240" w="320"/>
      <!--Normalized principal point (invariant for a given camera)-->
      <Normalized_Principal_Point cx="5.0011067410e-001" cy="4.9835188978e-001"/>
      <!--Normalized focal length and skew (invariant for a given camera)-->
      <Normalized_Focal_Length_and_Skew fx="1.2504241586e+000" fy="1.6663632953e+000" s="-5.8748098931e-004"/>
      <!--Radial and tangential lens distortion (invariant for a given camera)-->
      <Lens_Distortion k1="7.6962249137e-003" k2="2.1952754937e-002" k3="1.1167544754e-002" k4="-1.2299799950e-003" k5="0.0000000000e+000"/>
    </IntrinsicDataPerspective>

  <ImageT__RGB_Frame href="project_dir:Data/poster.jpg" key="RefImage" timestamp="0"/>
      <CameraPerspective key="InstantCamera">
      <IntrinsicDataPerspective calibrated="1">
        <!--Image resolution (application-dependant)-->
        <Image_Resolution h="480" w="640"/>
        <!--Normalized principal point (invariant for a given camera)-->
        <Normalized_Principal_Point cx="5.0011067410e-001" cy="4.9835188978e-001"/>
        <!--Normalized focal length and skew (invariant for a given camera)-->
        <Normalized_Focal_Length_and_Skew fx="1.2504241586e+000" fy="1.6663632953e+000" s="-5.8748098931e-004"/>
        <!--Radial and tangential lens distortion (invariant for a given camera)-->
        <Lens_Distortion k1="7.6962249137e-003" k2="2.1952754937e-002" k3="1.1167544754e-002" k4="-1.2299799950e-003" k5="0.0000000000e+000"/>
      </IntrinsicDataPerspective>
      <ExtrinsicData calibrated="1" t="0">
        <R rotation="0 0 0 &#xA;"/>
        <t translation="0 0 -800 &#xA;"/>
        <Cov covariance="0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;0  0  0  0  0  0  &#xA;"/>
      </ExtrinsicData>
    </CameraPerspective>

  
  </DataSet>

</VisionLib2>
