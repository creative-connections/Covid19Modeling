within Covid19_modeling.interfaces;
partial model ConditionalDeathFractionInput
  "Input of real fraction input vs. parametric fraction inpute"

  parameter Boolean useFractionInput = false
    "=true, if deathFractionInput connector is used instead of parameter DeathFractionInput"
  annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

  parameter Physiolibrary.Types.Fraction DeathFractionInput=0
    "deathFraction if useFractionInput=false" annotation (HideResult=not
        useChangeInput, Dialog(enable=not useChangeInput));

  Physiolibrary.Types.RealIO.FractionInput deathFractionInput(start=
        DeathFractionInput)=deathFrantion if useFractionInput annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-74,0}),iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-120,0})));

  Physiolibrary.Types.Fraction deathFraction  "Current death fraction";
equation
  if not useFractionInput then
    deathFraction = DeathFractionInput;
  end if;

end ConditionalDeathFractionInput;
