within Covid19_modeling.Parts;
model TestingPopulation
  Physiolibrary.Types.RealIO.PopulationInput untestedAsymptomatic annotation (
      Placement(transformation(extent={{-90,-62},{-62,-34}}),
        iconTransformation(
        extent={{-18,-18},{18,18}},
        rotation=180,
        origin={120,70})));
  Physiolibrary.Types.RealIO.PopulationInput untestedMildSymptomatic
    annotation (Placement(transformation(extent={{-104,-12},{-80,12}}),
        iconTransformation(
        extent={{-18,-18},{18,18}},
        rotation=180,
        origin={118,0})));
  Physiolibrary.Types.RealIO.PopulationInput
    untestedModerateAndSevereSymptomatic annotation (Placement(transformation(
          extent={{-88,58},{-60,86}}), iconTransformation(
        extent={{-18,-18},{18,18}},
        rotation=180,
        origin={118,-66})));
  outer Covid19_modeling.interfaces.ModelSettings modelSettings
    annotation (Placement(transformation(extent={{62,76},{82,96}})));

  Physiolibrary.Types.RealIO.PopulationChangeOutput
    InfectedNotContagiousTestFractionRate[4] annotation (Placement(
        transformation(extent={{-356,12},{-336,32}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,48})));
  Physiolibrary.Types.RealIO.PopulationChangeOutput
    AsymptomaticContagiousTestFractionRate[4] annotation (Placement(
        transformation(extent={{-356,12},{-336,32}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,16})));
  Physiolibrary.Types.RealIO.PopulationChangeOutput
    SymptomaticContagiousTestFractionRate[4] annotation (Placement(
        transformation(extent={{-356,12},{-336,32}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,-16})));
  Physiolibrary.Types.RealIO.PopulationChangeOutput
    SymptomaticNotContagiousTestFractionRate[4] annotation (Placement(
        transformation(extent={{-356,12},{-336,32}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,-48})));

  Physiolibrary.Types.PopulationChange symptomaticTesting;
  //rate of all symptomatic patiens testing
    Physiolibrary.Types.PopulationChange mildlySymptomaticTesting;
  //rate of mildly symptomatic patient testing
  Physiolibrary.Types.PopulationChange targetMildlySymptomaticTestRate;
  //required rate of mildly syptomatic patient testing

equation

  //if the testing capacity is sufficient, we first test moderate and severe
  //symptomatic patients according to the target symptomatic test rate:
  symptomaticTesting = min(modelSettings.testingCapacity, modelSettings.targetSymptomaticTestRate
    *untestedModerateAndSevereSymptomatic);

  //we set a certain part of the target symptomatic test rate (around 25%)
  //for testing patients with a mild course of the disease
  mildlySymptomaticTesting = modelSettings.targetSymptomaticTestRate*
    modelSettings.mildTestFraction;

 //we set a certain part of the target symptomatic test rate (around 25%)
  //for testing patients with a mild course of the disease
  targetMildlySymptomaticTestRate = if modelSettings.testingCapacity -
    symptomaticTesting < untestedMildSymptomatic*
    targetMildlySymptomaticTestRate then modelSettings.testingCapacity -
    symptomaticTesting else untestedMildSymptomatic*
    targetMildlySymptomaticTestRate;

  //If the test capacity remains after deducting the testing of symptomatic
  //patients, it is used to test possible patients without symptoms of the
  //disease. We calculateit from the current rate of positively tested patients
  //multiplied by the average number of contacts per positively tested patient:

  InfectedNotContagiousTestFractionRate[1] = 0;
  InfectedNotContagiousTestFractionRate[2] = 0;
  InfectedNotContagiousTestFractionRate[3] = 0;
  InfectedNotContagiousTestFractionRate[4] = 0;

  AsymptomaticContagiousTestFractionRate[1] = 0;
  AsymptomaticContagiousTestFractionRate[2] = 0;
  AsymptomaticContagiousTestFractionRate[3] = 0;
  AsymptomaticContagiousTestFractionRate[4] = 0;

  SymptomaticContagiousTestFractionRate[1] = 0;
  SymptomaticContagiousTestFractionRate[2] = 0;
  SymptomaticContagiousTestFractionRate[3] = 0;
  SymptomaticContagiousTestFractionRate[4] = 0;

  SymptomaticNotContagiousTestFractionRate[1] = 0;
  SymptomaticNotContagiousTestFractionRate[2] = 0;
  SymptomaticNotContagiousTestFractionRate[3] = 0;
  SymptomaticNotContagiousTestFractionRate[4] = 0;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Line(
          points={{-30,60},{-40,68}},
          pattern=LinePattern.None,
          color={238,46,47},
          thickness=1),
        Line(
          points={{-60,66},{-52,74}},
          color={238,46,47},
          pattern=LinePattern.None,
          thickness=1),
        Text(
          extent={{-188,-108},{186,-124}},
          lineColor={238,46,47},
          pattern=LinePattern.None,
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={238,46,47},
          textString="%name"),
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,127},
          fillColor={170,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-19,15},{-9,5}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{-31,3},{-21,-7}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{-1,21},{9,11}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{23,27},{33,17}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{47,21},{57,11}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{61,9},{71,-1}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{75,-7},{85,-17}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{83,-27},{93,-37}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{79,-53},{89,-63}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{65,-71},{75,-81}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{47,-83},{57,-93}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{19,-87},{29,-97}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{-7,-81},{3,-91}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{-25,-65},{-15,-75}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{-37,-43},{-27,-53}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{-39,-19},{-29,-29}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{-34,22},{85,-91}},
          lineColor={238,46,47},
          pattern=LinePattern.None,
          lineThickness=1,
          fillColor={238,46,47},
          fillPattern=FillPattern.Sphere,
          startAngle=0,
          endAngle=360),
        Ellipse(
          extent={{-9,-1},{1,-11}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-19,-11},{-9,-21}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-29,-31},{-19,-41}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-5,-17},{5,-27}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-9,-31},{1,-41}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-19,-51},{-9,-61}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{53,-19},{63,-29}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{5,-33},{15,-43}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={238,46,47},
          startAngle=0,
          endAngle=360),
        Ellipse(
          extent={{-7,-49},{3,-59}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{19,-45},{29,-55}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={202,38,41}),
        Ellipse(
          extent={{-11,-71},{-1,-81}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{11,-71},{21,-81}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{31,-71},{41,-81}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{67,-21},{77,-31}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{57,-41},{67,-51}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{69,-41},{79,-51}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{31,-53},{41,-63}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{51,-61},{61,-71}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{39,-23},{49,-33}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={238,46,47}),
        Ellipse(
          extent={{27,1},{37,-9}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{9,3},{19,-7}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{61,-7},{71,-17}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{11,-21},{21,-31}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={238,46,47}),
        Ellipse(
          extent={{45,-7},{55,-17}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{21,11},{31,1}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{13,-9},{23,-19}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{41,9},{51,-1}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{45,-45},{55,-55}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{9,-55},{19,-65}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{25,-27},{35,-37}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={238,46,47},
          startAngle=0,
          endAngle=360),
        Ellipse(
          extent={{29,-11},{39,-21}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{29,-39},{39,-49}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={238,46,47},
          startAngle=0,
          endAngle=360),
        Ellipse(
          extent={{-75,85},{-65,75}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{-87,73},{-77,63}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{-57,91},{-47,81}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{-33,97},{-23,87}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{-9,91},{1,81}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{5,79},{15,69}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{19,63},{29,53}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{27,43},{37,33}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{23,17},{33,7}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{9,-1},{19,-11}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{-9,-13},{1,-23}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{-37,-17},{-27,-27}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{-63,-11},{-53,-21}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{-81,5},{-71,-5}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{-93,27},{-83,17}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{-95,51},{-85,41}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={0,0,0}),
        Ellipse(
          extent={{-90,92},{29,-21}},
          lineColor={238,46,47},
          pattern=LinePattern.None,
          lineThickness=1,
          fillColor={238,46,47},
          fillPattern=FillPattern.Sphere,
          startAngle=0,
          endAngle=360),
        Ellipse(
          extent={{-65,69},{-55,59}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-75,59},{-65,49}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-85,39},{-75,29}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-61,53},{-51,43}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-65,39},{-55,29}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-75,19},{-65,9}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-3,51},{7,41}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-51,37},{-41,27}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={238,46,47},
          startAngle=0,
          endAngle=360),
        Ellipse(
          extent={{-63,21},{-53,11}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-37,25},{-27,15}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={202,38,41}),
        Ellipse(
          extent={{-65,-1},{-55,-11}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-45,-1},{-35,-11}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-25,-1},{-15,-11}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{11,49},{21,39}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{1,29},{11,19}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{13,29},{23,19}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-25,17},{-15,7}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-5,9},{5,-1}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-17,47},{-7,37}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={238,46,47}),
        Ellipse(
          extent={{-29,71},{-19,61}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-47,73},{-37,63}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{5,63},{15,53}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-45,49},{-35,39}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={238,46,47}),
        Ellipse(
          extent={{-11,63},{-1,53}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-35,81},{-25,71}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-43,61},{-33,51}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-15,79},{-5,69}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-11,25},{-1,15}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-47,15},{-37,5}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-31,43},{-21,33}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={238,46,47},
          startAngle=0,
          endAngle=360),
        Ellipse(
          extent={{-27,59},{-17,49}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={151,29,31}),
        Ellipse(
          extent={{-27,31},{-17,21}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={238,46,47},
          startAngle=0,
          endAngle=360)}),       Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestingPopulation;