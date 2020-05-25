within Covid19Modeling.Parts;
model DeathPopulation
  extends Physiolibrary.Icons.Population;
  Physiolibrary.Types.RealIO.PopulationInput symptomaticContagiousUntested[
    4] annotation (Placement(transformation(extent={{-44,54},{-4,94}}),
        iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=270,
        origin={-27,111})));
  Physiolibrary.Types.RealIO.PopulationInput symptomaticContagiousTested[4]
    annotation (Placement(transformation(extent={{-114,-56},{-74,-16}}),
        iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=270,
        origin={-83,109})));
  Physiolibrary.Types.RealIO.PopulationInput
    symptomaticNotContagiousUntested[4] annotation (Placement(
        transformation(extent={{-120,40},{-80,80}}),   iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=270,
        origin={63,111})));
  Physiolibrary.Types.RealIO.PopulationInput symptomaticNotContagiousTested[
    4] annotation (Placement(transformation(extent={{-114,-8},{-74,32}}),
        iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=270,
        origin={21,111})));
  Physiolibrary.Types.RealIO.PopulationOutput cumulativeDeath
    "Cumulative deatg of all patients"                        annotation (
      Placement(transformation(extent={{38,-78},{58,-58}}),
        iconTransformation(extent={{100,-14},{120,6}})));
  Physiolibrary.Types.RealIO.PopulationOutput
    cumulativeDeathUntestedPatients "cumulative Death of untested patients"
    annotation (Placement(transformation(extent={{56,36},{76,56}}),
        iconTransformation(extent={{100,-50},{120,-30}})));
  Physiolibrary.Types.RealIO.PopulationOutput cumulativeDeathTestedPatiens
    "Cumulative death of tested patients"                                  annotation (
      Placement(transformation(extent={{0,-8},{20,12}}), iconTransformation(
          extent={{100,-84},{120,-64}})));

equation

  cumulativeDeathUntestedPatients=
     symptomaticContagiousUntested[1]
     +symptomaticContagiousUntested[2]
     +symptomaticContagiousUntested[3]
     +symptomaticContagiousUntested[4]
     +symptomaticNotContagiousUntested[1]
     +symptomaticNotContagiousUntested[2]
     +symptomaticNotContagiousUntested[3]
     +symptomaticNotContagiousUntested[4];

  cumulativeDeathTestedPatiens=
         symptomaticContagiousTested[1]
        +symptomaticContagiousTested[2]
        +symptomaticContagiousTested[3]
        +symptomaticContagiousTested[4]
        +symptomaticNotContagiousTested[1]
        +symptomaticNotContagiousTested[2]
        +symptomaticNotContagiousTested[3]
        +symptomaticNotContagiousTested[4];

  cumulativeDeath=cumulativeDeathUntestedPatients
                  +cumulativeDeathTestedPatiens;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Text(
          extent={{-260,-100},{260,-132}},
          lineColor={28,108,200},
          fillColor={208,253,255},
          fillPattern=FillPattern.Solid,
          textString="%name")}),      Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end DeathPopulation;
