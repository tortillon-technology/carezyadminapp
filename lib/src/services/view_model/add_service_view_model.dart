import 'package:carezyadminapp/src/customer/model/garage_model.dart';
import 'package:carezyadminapp/src/customer/repo/customer_repo.dart';
import 'package:carezyadminapp/src/services/model/customer_model.dart';
import 'package:carezyadminapp/src/services/repo/service_repo.dart';
import 'package:carezyadminapp/utils/helpers/auto_dispose_view_model.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';

import '../../../res/enums/enums.dart';
import '../../../services/get_it.dart';

class AddServiceViewModel extends AutoDisposeViewModel with Helper {
  final repo = getIt.get<ServiceRepo>();
  final custRepo = getIt.get<CustomerRepo>();

  String? currentOodometerReading;
  String? nextServiceReading;

  List<Garage> garageList = [];
  Garage? selectedGarage;

  List<Customer> customerList = [];
  Customer? selectedCustomer;

  bool enableButton = false;

  /// Engine Data Variables
  Selection? engineOil;
  String? oilLife;
  String? nextOilChangeODO;
  Selection? oilFilter;
  Selection? airFilter;
  Selection? acFilter;
  Selection? sparkPlug;
  Selection? ignitionCoil;
  Selection? valveCowerGasket;
  Selection? plugSeal;
  Selection? engineBelt;
  Selection? engineBeltTentioner;
  Selection? idlPulley;
  Selection? injectors;
  Selection? selfMotor;
  Selection? engineMount;
  String? numberOfEngineMounts;
  //? -------
  final oilLifeController = TextEditingController();
  final remainingOilController = TextEditingController();
  String? remainingOil;
  final nextOilChangeODOlController = TextEditingController();
  final currentODOController = TextEditingController();
  //! Oil filter
  final remainingOilFilterController = TextEditingController();
  String? remainingOilFilter;
  final nextOilFilterChangeODOlController = TextEditingController();
  String? nextOilFilterChangeODO;
  //! ----------
  //-----------
  //! Air Filter
  final remainingAirFilterController = TextEditingController();
  String? remainingAirFilter;
  final nextAirFilterChangeODOlController = TextEditingController();
  String? nextAirFilterChangeODO;
  //! ----------
  //-----------
  //! AC Filter
  final remainingAcFilterController = TextEditingController();
  String? remainingAcFilter;
  final nextAcFilterChangeODOlController = TextEditingController();
  String? nextAcFilterChangeODO;
  //! ----------
  //-----------
  //! Spark Plug
  final remainingSparkPlugController = TextEditingController();
  String? remainingSparkPlug;
  final nextSparkPlugChangeODOlController = TextEditingController();
  String? nextSparkPlugChangeODO;
  //! ----------
  //-----------
  //! Ignition Coil
  final remainingIgnitionCoilController = TextEditingController();
  String? remainingIgnitionCoil;
  final nextIgnitionCoilChangeODOlController = TextEditingController();
  String? nextIgnitionCoilChangeODO;
  //! ----------
  //-----------
  //! Valve Cower Gasket
  final remainingValveCowerGasketController = TextEditingController();
  String? remainingValveCowerGasket;
  final nextValveCowerGasketChangeODOlController = TextEditingController();
  String? nextValveCowerGasketChangeODO;
  //! ----------
  //-----------
  //! Plug Seal
  final remainingPlugSealController = TextEditingController();
  String? remainingPlugSeal;
  final nextPlugSealChangeODOlController = TextEditingController();
  String? nextPlugSealChangeODO;
  //! ----------
  //-----------
  //! Engine Belt
  final remainingEngineBeltController = TextEditingController();
  String? remainingEngineBelt;
  final nextEngineBeltChangeODOlController = TextEditingController();
  String? nextEngineBeltChangeODO;
  //! ----------
  //-----------
  //! Engine Belt Tentioner
  final remainingEngineBeltTentionerController = TextEditingController();
  String? remainingEngineBeltTentioner;
  final nextEngineBeltTentionerChangeODOlController = TextEditingController();
  String? nextEngineBeltTentionerChangeODO;
  //! ----------
  //-----------
  //! IDL Pulley
  final remainingIDLPulleyController = TextEditingController();
  String? remainingIDLPulley;
  final nextIDLPulleyChangeODOlController = TextEditingController();
  String? nextIDLPulleyChangeODO;
  //! ----------
  //-----------
  //! Injectors
  final remainingInjectorsController = TextEditingController();
  String? remainingInjectors;
  final nextInjectorsChangeODOlController = TextEditingController();
  String? nextInjectorsChangeODO;
  //! ----------
  //-----------
  //! Self Motor
  final remainingSelfMotorController = TextEditingController();
  String? remainingSelfMotor;
  final nextSelfMotorChangeODOlController = TextEditingController();
  String? nextSelfMotorChangeODO;
  //! ----------
  //-----------
  //! Engine Mount
  final remainingEngineMotorController = TextEditingController();
  String? remainingEngineMotor;
  final nextEngineMotorChangeODOlController = TextEditingController();
  String? nextEngineMotorrChangeODO;
  //! ----------
  //! Gear Oil
  final remainingGearOilController = TextEditingController();
  String? remainingGearOil;
  final nextGearOilChangeODOlController = TextEditingController();
  String? nextGearOilChangeODO;
  //! ----------
  //! Transmission Control Oil
  final remainingTransmissionControlOilController = TextEditingController();
  String? remainingTransmissionControlOil;
  final nextTransmissionControlOilChangeODOlController =
      TextEditingController();
  String? nextTransmissionControlOilChangeODO;
  //! ----------
  //! Gear Gasket
  final remainingGearGasketController = TextEditingController();
  String? remainingGearGasket;
  final nextGearGasketChangeODOlController = TextEditingController();
  String? nextGearGasketChangeODO;
  //! ----------
  //! Gear Mount
  final remainingGearMountController = TextEditingController();
  String? remainingGearMount;
  final nextGearMountChangeODOlController = TextEditingController();
  String? nextGearMountChangeODO;
  //! ----------
  //! Shaft Status
  final remainingShaftStatusController = TextEditingController();
  String? remainingShaftStatus;
  final nextShaftStatusChangeODOlController = TextEditingController();
  String? nextShaftStatusChangeODO;
  //! ----------
  //! Shaft Seals
  final remainingShaftSealsController = TextEditingController();
  String? remainingShaftSeals;
  final nextShaftSealsChangeODOlController = TextEditingController();
  String? nextShaftSealsChangeODO;
  //! ----------
  //! Differential Bushes
  final remainingDifferentialBushesController = TextEditingController();
  String? remainingDifferentialBushes;
  final nextDifferentialBushesChangeODOlController = TextEditingController();
  String? nextDifferentialBushesChangeODO;
  //! ----------
  //! Front Left Break Disc
  final remainingFrontLeftBreakDiscController = TextEditingController();
  String? remainingFrontLeftBreakDisc;
  final nextFrontLeftBreakDiscChangeODOlController = TextEditingController();
  String? nextFrontLeftBreakDiscChangeODO;
  //! ----------
  //! Front Right Break Disc
  final remainingFrontRightBreakDiscController = TextEditingController();
  String? remainingFrontRightBreakDisc;
  final nextFrontRightBreakDiscChangeODOlController = TextEditingController();
  String? nextFrontRightBreakDiscChangeODO;
  //! ----------
  //! Rear Left Break Disc
  final remainingRearLeftBreakDiscController = TextEditingController();
  String? remainingRearLeftBreakDisc;
  final nextRearLeftBreakDiscChangeODOlController = TextEditingController();
  String? nextRearLeftBreakDiscChangeODO;
  //! ----------
  //! Rear Right Break Disc
  final remainingRearRightBreakDiscController = TextEditingController();
  String? remainingRearRightBreakDisc;
  final nextRearRightBreakDiscChangeODOlController = TextEditingController();
  String? nextRearRightBreakDiscChangeODO;
  //! ----------
  //! Front Break Pad
  final remainingFrontBreakPadController = TextEditingController();
  String? remainingFrontBreakPad;
  final nextFrontBreakPadChangeODOlController = TextEditingController();
  String? nextFrontBreakPadChangeODO;
  //! ----------
  //! Rear Break Pad
  final remainingRearBreakPadController = TextEditingController();
  String? remainingRearBreakPad;
  final nextRearBreakPadChangeODOlController = TextEditingController();
  String? nextRearBreakPadChangeODO;
  //! ----------
  //! Rear Break Shoe
  final remainingRearBreakShoeController = TextEditingController();
  String? remainingRearBreakShoe;
  final nextRearBreakShoeChangeODOlController = TextEditingController();
  String? nextRearBreakShoeChangeODO;
  //! ----------
  //! Break Fluid
  final remainingBreakFluidController = TextEditingController();
  String? remainingBreakFluid;
  final nextBreakFluidChangeODOlController = TextEditingController();
  String? nextBreakFluidChangeODO;
  //! ----------
  //! Front Left Lower Arm
  final remainingFrontLeftLowerArmController = TextEditingController();
  String? remainingFrontLeftLowerArm;
  final nextFrontLeftLowerArmChangeODOlController = TextEditingController();
  String? nextFrontLeftLowerArmChangeODO;
  //! ----------
  //! Front Right Lower Arm
  final remainingFrontRightLowerArmController = TextEditingController();
  String? remainingFrontRightLowerArm;
  final nextFrontRightLowerArmChangeODOlController = TextEditingController();
  String? nextFrontRightLowerArmChangeODO;
  //! ----------
  //! Rear Left Lower Arm
  final remainingRearLeftLowerArmController = TextEditingController();
  String? remainingRearLeftLowerArm;
  final nextRearLeftLowerArmChangeODOlController = TextEditingController();
  String? nextRearLeftLowerArmChangeODO;
  //! ----------
  //! Rear Right Lower Arm
  final remainingRearRightLowerArmController = TextEditingController();
  String? remainingRearRightLowerArm;
  final nextRearRightLowerArmChangeODOlController = TextEditingController();
  String? nextRearRightLowerArmChangeODO;
  //! ----------
  //! Upper Arm Front Left
  final remainingUpperArmFrontLeftController = TextEditingController();
  String? remainingUpperArmFrontLeft;
  final nextUpperArmFrontLeftChangeODOlController = TextEditingController();
  String? nextUpperArmFrontLeftChangeODO;
  //! ----------
  //! Upper Arm Front Right
  final remainingUpperArmFrontRightController = TextEditingController();
  String? remainingUpperArmFrontRight;
  final nextUpperArmFrontRightChangeODOlController = TextEditingController();
  String? nextUpperArmFrontRightChangeODO;
  //! ----------
  //! Trailor Arm Rear
  final remainingTrailorArmRearController = TextEditingController();
  String? remainingTrailorArmRear;
  final nextTrailorArmRearChangeODOlController = TextEditingController();
  String? nextTrailorArmRearChangeODO;
  //! ----------
  //! Axle Boot Left Inner
  final remainingAxleBootLeftInnerController = TextEditingController();
  String? remainingAxleBootLeftInner;
  final nextAxleBootLeftInnerChangeODOlController = TextEditingController();
  String? nextAxleBootLeftInnerChangeODO;
  //! ----------
  //! Axle Boot Right Inner
  final remainingAxleBootRightInnerController = TextEditingController();
  String? remainingAxleBootRightInner;
  final nextAxleBootRightInnerChangeODOlController = TextEditingController();
  String? nextAxleBootRightInnerChangeODO;
  //! ----------
  //! Axle Boot Right Outer
  final remainingAxleBootRightOuterController = TextEditingController();
  String? remainingAxleBootRightOuter;
  final nextAxleBootRightOuterChangeODOlController = TextEditingController();
  String? nextAxleBootRightOuterChangeODO;
  //! ----------
  //! Axle Boot Left Outer
  final remainingAxleBootLeftOuterController = TextEditingController();
  String? remainingAxleBootLeftOuter;
  final nextAxleBootLeftOuterChangeODOlController = TextEditingController();
  String? nextAxleBootLeftOuterChangeODO;
  //! ----------
  //! Link Rod Front Left
  final remainingLinkRodFrontLeftController = TextEditingController();
  String? remainingLinkRodFrontLeft;
  final nextLinkRodFrontLeftChangeODOlController = TextEditingController();
  String? nextLinkRodFrontLeftChangeODO;
  //! ----------
  //! Link Rod Front Right
  final remainingLinkRodFrontRightController = TextEditingController();
  String? remainingLinkRodFrontRight;
  final nextLinkRodFrontRightChangeODOlController = TextEditingController();
  String? nextLinkRodFrontRightChangeODO;
  //! ----------
  //! Link Rod Rear Left
  final remainingLinkRodRearLeftController = TextEditingController();
  String? remainingLinkRodRearLeft;
  final nextLinkRodRearLeftChangeODOlController = TextEditingController();
  String? nextLinkRodRearLeftChangeODO;
  //! ----------
  //! Link Rod Rear Right
  final remainingLinkRodRearRightController = TextEditingController();
  String? remainingLinkRodRearRight;
  final nextLinkRodRearRightChangeODOlController = TextEditingController();
  String? nextLinkRodRearRightChangeODO;
  //! ----------
  //! Balance Rod Bush Front
  final remainingBalanceRodBushFrontController = TextEditingController();
  String? remainingBalanceRodBushFront;
  final nextBalanceRodBushFrontChangeODOlController = TextEditingController();
  String? nextBalanceRodBushFrontChangeODO;
  //! ----------
  //! Balance Rod Bush Rear
  final remainingBalanceRodBushRearController = TextEditingController();
  String? remainingBalanceRodBushRear;
  final nextBalanceRodBushRearChangeODOlController = TextEditingController();
  String? nextBalanceRodBushRearChangeODO;
  //! ----------
  //! AC Gas
  final remainingAcGasController = TextEditingController();
  String? remainingAcGas;
  final nextAcGasChangeODOlController = TextEditingController();
  String? nextAcGasChangeODO;
  //! ----------
  //! Compressor
  final remainingCompressorController = TextEditingController();
  String? remainingCompressor;
  final nextCompressorChangeODOlController = TextEditingController();
  String? nextCompressorChangeODO;
  //! ----------
  //! Condenser
  final remainingCondenserController = TextEditingController();
  String? remainingCondenser;
  final nextCondenserChangeODOlController = TextEditingController();
  String? nextCondenserChangeODO;
  //! ----------
  //! Evaporator
  final remainingEvaporatorController = TextEditingController();
  String? remainingEvaporator;
  final nextEvaporatorChangeODOlController = TextEditingController();
  String? nextEvaporatorChangeODO;
  //! ----------
  //! Ex Valve
  final remainingExValveController = TextEditingController();
  String? remainingExValve;
  final nextExValveChangeODOlController = TextEditingController();
  String? nextExValveChangeODO;
  //! ----------
  //! Steering Boot Left
  final remainingSteeringBootLeftController = TextEditingController();
  String? remainingSteeringBootLeft;
  final nextSteeringBootLeftChangeODOlController = TextEditingController();
  String? nextSteeringBootLeftChangeODO;
  //! ----------
  //! Steering Boot Right
  final remainingSteeringBootRightController = TextEditingController();
  String? remainingSteeringBootRight;
  final nextSteeringBootRightChangeODOlController = TextEditingController();
  String? nextSteeringBootRightChangeODO;
  //! ----------
  //! Steering End Left
  final remainingSteeringEndLeftController = TextEditingController();
  String? remainingSteeringEndLeft;
  final nextSteeringEndLeftChangeODOlController = TextEditingController();
  String? nextSteeringEndLeftChangeODO;
  //! ----------
  //! Steering End Right
  final remainingSteeringEndRightController = TextEditingController();
  String? remainingSteeringEndRight;
  final nextSteeringEndRightChangeODOlController = TextEditingController();
  String? nextSteeringEndRightChangeODO;
  //! ----------
  //! Ball Joint Left
  final remainingBallJointLeftController = TextEditingController();
  String? remainingBallJointLeft;
  final nextBallJointLeftChangeODOlController = TextEditingController();
  String? nextBallJointLeftChangeODO;
  //! ----------
  //! Ball Joint Right
  final remainingBallJointRightController = TextEditingController();
  String? remainingBallJointRight;
  final nextBallJointRightChangeODOlController = TextEditingController();
  String? nextBallJointRightChangeODO;
  //! ----------
  //! Head Light
  final remainingHeadLightController = TextEditingController();
  String? remainingHeadLight;
  final nextHeadLightChangeODOlController = TextEditingController();
  String? nextHeadLightChangeODO;
  //! ----------
  //! Park Light
  final remainingParkLightController = TextEditingController();
  String? remainingParkLight;
  final nextParkLightChangeODOlController = TextEditingController();
  String? nextParkLightChangeODO;
  //! ----------
  //! Indicators
  final remainingIndicatorsController = TextEditingController();
  String? remainingIndicators;
  final nextIndicatorsChangeODOlController = TextEditingController();
  String? nextIndicatorsChangeODO;
  //! ----------
  //! Reverse Gear
  final remainingReverseGearController = TextEditingController();
  String? remainingReverseGear;
  final nextReverseGearChangeODOlController = TextEditingController();
  String? nextReverseGearChangeODO;
  //! ----------
  //! Dim Bright
  final remainingDimBrightController = TextEditingController();
  String? remainingDimBright;
  final nextDimBrightChangeODOlController = TextEditingController();
  String? nextDimBrightChangeODO;
  //! ----------
  //! Fog Lamps
  final remainingFogLampsController = TextEditingController();
  String? remainingFogLamps;
  final nextFogLampsChangeODOlController = TextEditingController();
  String? nextFogLampsChangeODO;
  //! ----------
  //! Fuel Pump
  final remainingFuelPumpController = TextEditingController();
  String? remainingFuelPump;
  final nextFuelPumpChangeODOlController = TextEditingController();
  String? nextFuelPumpChangeODO;
  //! ----------
  //! Fuel Filter
  final remainingFuelFilterController = TextEditingController();
  String? remainingFuelFilter;
  final nextFuelFilterChangeODOlController = TextEditingController();
  String? nextFuelFilterChangeODO;
  //! ----------
  //! Canister
  final remainingCanisterController = TextEditingController();
  String? remainingCanister;
  final nextCanisterChangeODOlController = TextEditingController();
  String? nextCanisterChangeODO;
  //! ----------
  //! Fuel Tank
  final remainingFuelTankController = TextEditingController();
  String? remainingFuelTank;
  final nextFuelTankChangeODOlController = TextEditingController();
  String? nextFuelTankChangeODO;
  //! ----------
  //! Tyre Pressure Front Right
  final remainingTyrePressureFrontRightController = TextEditingController();
  String? remainingTyrePressureFrontRight;
  final nextTyrePressureFrontRightChangeODOlController =
      TextEditingController();
  String? nextTyrePressureFrontRightChangeODO;
  //! ----------
  //! Tyre Pressure Front Left
  final remainingTyrePressureFrontLeftController = TextEditingController();
  String? remainingTyrePressureFrontLeft;
  final nextTyrePressureFrontLeftChangeODOlController = TextEditingController();
  String? nextTyrePressureFrontLeftChangeODO;
  //! ----------
  //! Tyre Pressure Rear Right
  final remainingTyrePressureRearRightController = TextEditingController();
  String? remainingTyrePressureRearRight;
  final nextTyrePressureRearRightChangeODOlController = TextEditingController();
  String? nextTyrePressureRearRightChangeODO;
  //! ----------
  //! Tyre Pressure Rear Left
  final remainingTyrePressureRearLeftController = TextEditingController();
  String? remainingTyrePressureRearLeft;
  final nextTyrePressureRearLeftChangeODOlController = TextEditingController();
  String? nextTyrePressureRearLeftChangeODO;
  //! ----------
  //! Gear Filter
  final remainingGearFilterController = TextEditingController();
  String? remainingGearFilter;
  final nextGearFilterChangeODOlController = TextEditingController();
  String? nextGearFilterChangeODO;
  //! ----------
  //! Four Wheel Oil
  final remainingFourWheelOilController = TextEditingController();
  String? remainingFourWheelOil;
  final nextFourWheelOilChangeODOlController = TextEditingController();
  String? nextFourWheelOilChangeODO;
  //! ----------

  /// Gear Data Variables
  Selection? gearOil;
  String? gearOilLife;
  Selection? gearFilter;
  Selection? fourWheelOil;
  String? fourOilLife;
  String? nextFourOilChangeODO;
  Selection? transmissionControlModule;
  Selection? gearGasket;
  Selection? gearMount;
  String? noOfGearMounts;

  /// Differential Data Variables
  Selection? frontDifferentialOil;
  String? frontDifferentialOilLife;
  String? nextFrontDifferentialOilChangeODO;
  Selection? shaftStatus;
  Selection? shaftSeals;
  Selection? rearDifferentialOil;
  String? rearDifferentialOilLife;
  String? nextRearDifferentialOilChangeODO;
  Selection? differentialBushes;

  /// Break System Data Variables
  Selection? flBreakDisc;
  String? flbdPercentage;
  Selection? frBreakDisc;
  String? frbdPercentage;
  Selection? rlBreakDisc;
  String? rlbdPercentage;
  Selection? rrBreakDisc;
  String? rrbdPercentage;
  Selection? fbPad;
  String? fbPadPercentage;
  Selection? rbPad;
  String? rbPadPercentage;
  Selection? rbShoe;
  String? rbShoePercentage;
  Selection? breakFluid;
  String? breakFluidPercentage;

  /// Suspension System Data Variables
  SuspensionSelection? flla;
  SuspensionSelection? frla;
  SuspensionSelection? rlla;
  SuspensionSelection? rrla;
  SuspensionSelection? uafl;
  SuspensionSelection? uafr;
  SuspensionSelection? tar;
  SuspensionSelection? abli;
  SuspensionSelection? abri;
  SuspensionSelection? abro;
  SuspensionSelection? ablo;
  SuspensionSelection? lrfl;
  SuspensionSelection? lrfr;
  SuspensionSelection? lrrl;
  SuspensionSelection? lrrr;
  SuspensionSelection? brbf;
  SuspensionSelection? brbr;

  /// AC Data Variables
  Selection? acGas;
  Selection? compressor;
  Selection? condenser;
  Selection? evaporator;
  Selection? exValve;

  /// Steering System Data Variables
  Selection? sbl;
  Selection? sbr;
  Selection? sel;
  Selection? ser;
  Selection? bjl;
  Selection? bjr;

  /// Light System Data Variables
  LightSelection? headLight;
  LightSelection? parkLight;
  LightSelection? indicators;
  LightSelection? reverseGearLight;
  LightSelection? dimBright;
  LightSelection? fogLamps;

  /// Fuel System Data Variables
  Selection? fuelPump;
  Selection? fuelFilter;
  Selection? canister;
  Selection? fuelTank;

  /// Tyre Pressure Data Variables
  String? frPressure;
  String? flPressure;
  String? rrPressure;
  String? rlPressure;

  /// Other Data Variables
  Selection? centerLock;
  String? clRemarks;
  Selection? windowLifter;
  String? wlRemarks;
  Selection? alignment;
  Selection? wheelBalance;
  Selection? wiperBladeFront;
  Selection? wiperBladeRear;

  //! Alignment
  final remainingAlignmentController = TextEditingController();
  String? remainingAlignment;
  final nextAlignmentChangeODOlController = TextEditingController();
  String? nextAlignmentChangeODO;
  //! ----------
  //! Wheel Balance
  final remainingWheelBalanceController = TextEditingController();
  String? remainingWheelBalance;
  final nextWheelBalanceChangeODOlController = TextEditingController();
  String? nextWheelBalanceChangeODO;
  //! ----------
  //! Wiper Blade Front
  final remainingWiperBladeFrontController = TextEditingController();
  String? remainingWiperBladeFront;
  final nextWiperBladeFrontChangeODOlController = TextEditingController();
  String? nextWiperBladeFrontChangeODO;
  //! ----------
  //! Wiper Blade Rear
  final remainingWiperBladeRearController = TextEditingController();
  String? remainingWiperBladeRear;
  final nextWiperBladeRearChangeODOlController = TextEditingController();
  String? nextWiperBladeRearChangeODO;
  //! ----------
  //! Front Differential Oil
  final frontDifferentialOilLifeController = TextEditingController();
  final nextFrontDifferentialOilChangeODOlController = TextEditingController();
  //! ----------
  //! Rear Differential Oil
  final rearDifferentialOilLifeController = TextEditingController();
  final nextRearDifferentialOilChangeODOlController = TextEditingController();
  //! ----------
  //! Center Lock
  final remainingCenterLockController = TextEditingController();
  String? remainingCenterLock;
  final nextCenterLockChangeODOlController = TextEditingController();
  String? nextCenterLockChangeODO;
  //! ----------
  //! Window Lifter
  final remainingWindowLifterController = TextEditingController();
  String? remainingWindowLifter;
  final nextWindowLifterChangeODOlController = TextEditingController();
  String? nextWindowLifterChangeODO;
  //! ----------

  //
  update({required Function() callBack}) {
    callBack.call();
    notifyListeners();
  }

  checkAddButtonEnable() {
    enableButton = selectedCustomer != null && selectedGarage != null;
    notifyListeners();
  }

// Remaining values set automaticaly
  setValuesForAllRemainingFields() {
    remainingAcFilterController.text = remainingAirFilterController.text =
        remainingOilFilterController.text = remainingOil ?? '';
    remainingSparkPlugController.text = remainingOil ?? '';
    remainingIgnitionCoilController.text = remainingOil ?? '';
    remainingValveCowerGasketController.text = remainingOil ?? '';
    remainingPlugSealController.text = remainingOil ?? '';
    remainingEngineBeltController.text = remainingOil ?? '';
    remainingEngineBeltTentionerController.text = remainingOil ?? '';
    remainingIDLPulleyController.text = remainingOil ?? '';
    remainingInjectorsController.text = remainingOil ?? '';
    remainingSelfMotorController.text = remainingOil ?? '';
    remainingEngineMotorController.text = remainingOil ?? '';
    remainingGearOilController.text = remainingOil ?? '';
    remainingTransmissionControlOilController.text = remainingOil ?? '';
    remainingGearGasketController.text = remainingOil ?? '';
    remainingGearMountController.text = remainingOil ?? '';
    remainingShaftStatusController.text = remainingOil ?? '';
    remainingShaftSealsController.text = remainingOil ?? '';
    remainingDifferentialBushesController.text = remainingOil ?? '';
    remainingFrontLeftBreakDiscController.text = remainingOil ?? '';
    remainingFrontRightBreakDiscController.text = remainingOil ?? '';
    remainingRearLeftBreakDiscController.text = remainingOil ?? '';
    remainingRearRightBreakDiscController.text = remainingOil ?? '';
    remainingFrontBreakPadController.text = remainingOil ?? '';
    remainingRearBreakPadController.text = remainingOil ?? '';
    remainingRearBreakShoeController.text = remainingOil ?? '';
    remainingBreakFluidController.text = remainingOil ?? '';
    remainingFrontLeftLowerArmController.text = remainingOil ?? '';
    remainingFrontRightLowerArmController.text = remainingOil ?? '';
    remainingRearLeftLowerArmController.text = remainingOil ?? '';
    remainingRearRightLowerArmController.text = remainingOil ?? '';
    remainingUpperArmFrontLeftController.text = remainingOil ?? '';
    remainingUpperArmFrontRightController.text = remainingOil ?? '';
    remainingTrailorArmRearController.text = remainingOil ?? '';
    remainingAxleBootLeftInnerController.text = remainingOil ?? '';
    remainingAxleBootRightInnerController.text = remainingOil ?? '';
    remainingAxleBootRightOuterController.text = remainingOil ?? '';
    remainingAxleBootLeftOuterController.text = remainingOil ?? '';
    remainingLinkRodFrontLeftController.text = remainingOil ?? '';
    remainingLinkRodFrontRightController.text = remainingOil ?? '';
    remainingLinkRodRearLeftController.text = remainingOil ?? '';
    remainingLinkRodRearRightController.text = remainingOil ?? '';
    remainingBalanceRodBushFrontController.text = remainingOil ?? '';
    remainingBalanceRodBushRearController.text = remainingOil ?? '';
    remainingAcGasController.text = remainingOil ?? '';
    remainingCompressorController.text = remainingOil ?? '';
    remainingCondenserController.text = remainingOil ?? '';
    remainingEvaporatorController.text = remainingOil ?? '';
    remainingExValveController.text = remainingOil ?? '';
    remainingSteeringBootLeftController.text = remainingOil ?? '';
    remainingSteeringBootRightController.text = remainingOil ?? '';
    remainingSteeringEndLeftController.text = remainingOil ?? '';
    remainingSteeringEndRightController.text = remainingOil ?? '';
    remainingBallJointLeftController.text = remainingOil ?? '';
    remainingBallJointRightController.text = remainingOil ?? '';
    remainingHeadLightController.text = remainingOil ?? '';
    remainingParkLightController.text = remainingOil ?? '';
    remainingIndicatorsController.text = remainingOil ?? '';
    remainingReverseGearController.text = remainingOil ?? '';
    remainingDimBrightController.text = remainingOil ?? '';
    remainingFogLampsController.text = remainingOil ?? '';
    remainingFuelPumpController.text = remainingOil ?? '';
    remainingFuelFilterController.text = remainingOil ?? '';
    remainingCanisterController.text = remainingOil ?? '';
    remainingFuelTankController.text = remainingOil ?? '';
    remainingTyrePressureFrontRightController.text = remainingOil ?? '';
    remainingTyrePressureFrontLeftController.text = remainingOil ?? '';
    remainingTyrePressureRearRightController.text = remainingOil ?? '';
    remainingTyrePressureRearLeftController.text = remainingOil ?? '';
    remainingGearFilterController.text = remainingOil ?? '';
    remainingFourWheelOilController.text = remainingOil ?? '';
    remainingAlignmentController.text = remainingOil ?? '';
    remainingWheelBalanceController.text = remainingOil ?? '';
    remainingWiperBladeFrontController.text = remainingOil ?? '';
    remainingWiperBladeRearController.text = remainingOil ?? '';
    remainingCenterLockController.text = remainingOil ?? '';
    remainingWindowLifterController.text = remainingOil ?? '';

    if ((remainingOil?.isNotEmpty ?? false) &&
        (currentOodometerReading?.isNotEmpty ?? false)) {
      final value = (int.parse(remainingOil ?? '') +
              int.parse(currentOodometerReading ?? ''))
          .toString();

      nextOilFilterChangeODOlController.text = value;
      nextAirFilterChangeODOlController.text = value;
      nextAcFilterChangeODOlController.text = value;
      nextSparkPlugChangeODOlController.text = value;
      nextIgnitionCoilChangeODOlController.text = value;
      nextValveCowerGasketChangeODOlController.text = value;
      nextPlugSealChangeODOlController.text = value;
      nextEngineBeltChangeODOlController.text = value;
      nextEngineBeltTentionerChangeODOlController.text = value;
      nextIDLPulleyChangeODOlController.text = value;
      nextInjectorsChangeODOlController.text = value;
      nextSelfMotorChangeODOlController.text = value;
      nextEngineMotorChangeODOlController.text = value;
      nextGearOilChangeODOlController.text = value;
      nextTransmissionControlOilChangeODOlController.text = value;
      nextGearGasketChangeODOlController.text = value;
      nextGearMountChangeODOlController.text = value;
      nextShaftStatusChangeODOlController.text = value;
      nextShaftSealsChangeODOlController.text = value;
      nextDifferentialBushesChangeODOlController.text = value;
      nextFrontLeftBreakDiscChangeODOlController.text = value;
      nextFrontRightBreakDiscChangeODOlController.text = value;
      nextRearLeftBreakDiscChangeODOlController.text = value;
      nextRearRightBreakDiscChangeODOlController.text = value;
      nextFrontBreakPadChangeODOlController.text = value;
      nextRearBreakPadChangeODOlController.text = value;
      nextRearBreakShoeChangeODOlController.text = value;
      nextBreakFluidChangeODOlController.text = value;
      nextFrontLeftLowerArmChangeODOlController.text = value;
      nextFrontRightLowerArmChangeODOlController.text = value;
      nextRearLeftLowerArmChangeODOlController.text = value;
      nextRearRightLowerArmChangeODOlController.text = value;
      nextUpperArmFrontLeftChangeODOlController.text = value;
      nextUpperArmFrontRightChangeODOlController.text = value;
      nextTrailorArmRearChangeODOlController.text = value;
      nextAxleBootLeftInnerChangeODOlController.text = value;
      nextAxleBootRightInnerChangeODOlController.text = value;
      nextAxleBootRightOuterChangeODOlController.text = value;
      nextAxleBootLeftOuterChangeODOlController.text = value;
      nextLinkRodFrontLeftChangeODOlController.text = value;
      nextLinkRodFrontRightChangeODOlController.text = value;
      nextLinkRodRearLeftChangeODOlController.text = value;
      nextLinkRodRearRightChangeODOlController.text = value;
      nextBalanceRodBushFrontChangeODOlController.text = value;
      nextBalanceRodBushRearChangeODOlController.text = value;
      nextAcGasChangeODOlController.text = value;
      nextCompressorChangeODOlController.text = value;
      nextCondenserChangeODOlController.text = value;
      nextEvaporatorChangeODOlController.text = value;
      nextExValveChangeODOlController.text = value;
      nextSteeringBootLeftChangeODOlController.text = value;
      nextSteeringBootRightChangeODOlController.text = value;
      nextSteeringEndLeftChangeODOlController.text = value;
      nextSteeringEndRightChangeODOlController.text = value;
      nextBallJointLeftChangeODOlController.text = value;
      nextBallJointRightChangeODOlController.text = value;
      nextHeadLightChangeODOlController.text = value;
      nextParkLightChangeODOlController.text = value;
      nextIndicatorsChangeODOlController.text = value;
      nextReverseGearChangeODOlController.text = value;
      nextDimBrightChangeODOlController.text = value;
      nextFogLampsChangeODOlController.text = value;
      nextFuelPumpChangeODOlController.text = value;
      nextFuelFilterChangeODOlController.text = value;
      nextCanisterChangeODOlController.text = value;
      nextFuelTankChangeODOlController.text = value;
      nextTyrePressureFrontRightChangeODOlController.text = value;
      nextTyrePressureFrontLeftChangeODOlController.text = value;
      nextTyrePressureRearRightChangeODOlController.text = value;
      nextTyrePressureRearLeftChangeODOlController.text = value;
      nextGearFilterChangeODOlController.text = value;
      nextFourWheelOilChangeODOlController.text = value;
      nextAlignmentChangeODOlController.text = value;
      nextWheelBalanceChangeODOlController.text = value;
      nextWiperBladeFrontChangeODOlController.text = value;
      nextWiperBladeRearChangeODOlController.text = value;
      nextCenterLockChangeODOlController.text = value;
      nextWindowLifterChangeODOlController.text = value;
    }
    notifyListeners();
  }
//

  Future<bool?> getGarages() async {
    garageList = [];
    updateGarageLoader(true);
    return await custRepo.getGarages().fold(
      (left) {
        updateGarageLoader(false);
        return false;
      },
      (right) {
        updateGarageLoader(false);
        garageList = [];
        final isSuccess = right.status ?? false;
        garageList.addAll(right.results?.data ?? []);
        return isSuccess;
      },
    ).catchError((e) {
      updateGarageLoader(false);
      return false;
    });
  }

  Future<bool?> getOodoReadingAndOthers(int customerID) async {
    currentOodometerReading = null;
    updateOodoReading(true);
    return await custRepo.getOodoReading(customerID: customerID).fold(
      (left) {
        updateOodoReading(false);
        return false;
      },
      (right) {
        final isSuccess = right.status ?? false;
        if (right.results?.data != null) {
          currentOodometerReading = '80000';
          currentODOController.text = currentOodometerReading ?? '__';
          // right.results?.data?.currentKilometer ?? '0';
        }
        updateOodoReading(false);
        return isSuccess;
      },
    ).catchError((e) {
      updateOodoReading(false);
      return false;
    });
  }

  String getSelection({Selection? selection}) {
    return switch (selection) {
      Selection.changed => "Changed",
      Selection.notChanged => "Not Changed",
      null => '',
    };
  }

  String getSuspensionSelection({SuspensionSelection? selection}) {
    return switch (selection) {
      SuspensionSelection.changed => "Changed",
      SuspensionSelection.notChanged => "Not Changed",
      SuspensionSelection.bush => "Bush",
      null => '',
    };
  }

  String getLampSelection({LightSelection? selection}) {
    return switch (selection) {
      LightSelection.changed => "Changed",
      LightSelection.notChanged => "Not Changed",
      LightSelection.lampReplace => "Lamp Replace",
      null => '',
    };
  }

  Map<String, dynamic> get params => {
        "customer_id": selectedCustomer?.id,
        "garage": selectedGarage?.id,
        "engine": [
          if (engineOil != null)
            {
              "component": 1,
              "status": getSelection(selection: engineOil),
              "oil_life": oilLife ?? "",
              "next_service_odo": nextOilChangeODO ?? ""
            },
          if (oilFilter != null)
            {"component": 2, "status": getSelection(selection: oilFilter)},
          if (airFilter != null)
            {"component": 3, "status": getSelection(selection: airFilter)},
          if (acFilter != null)
            {"component": 4, "status": getSelection(selection: acFilter),},
          if (sparkPlug != null)
            {"component": 5, "status": getSelection(selection: sparkPlug)},
          if (ignitionCoil != null)
            {"component": 6, "status": getSelection(selection: ignitionCoil)},
          if (valveCowerGasket != null)
            {
              "component": 7,
              "status": getSelection(selection: valveCowerGasket)
            },
          if (plugSeal != null)
            {"component": 8, "status": getSelection(selection: plugSeal)},
          if (engineBelt != null)
            {"component": 9, "status": getSelection(selection: engineBelt)},
          if (engineBeltTentioner != null)
            {
              "component": 10,
              "status": getSelection(selection: engineBeltTentioner)
            },
          if (idlPulley != null)
            {"component": 11, "status": getSelection(selection: idlPulley)},
          if (injectors != null)
            {"component": 12, "status": getSelection(selection: injectors)},
          if (selfMotor != null)
            {"component": 13, "status": getSelection(selection: selfMotor)},
          if (engineMount != null)
            {
              "component": 14,
              "status": getSelection(selection: engineMount),
              "no_of_mounts": numberOfEngineMounts ?? ''
            },
        ],


        "gear": [
          if (gearOil != null)
            {
              "component": 1,
              "status": getSelection(selection: gearOil),
              "oil_life": oilLife ?? '',
              "next_service_odo": nextOilChangeODO ?? ""
            },
          if (gearFilter != null)
            {"component": 2, "status": getSelection(selection: gearFilter)},
          if (gearGasket != null)
            {"component": 3, "status": getSelection(selection: gearGasket)},
          if (fourWheelOil != null)
            {
              "component": 4,
              "status": getSelection(selection: fourWheelOil),
              "oil_life": fourOilLife ?? '',
              "next_service_odo": nextFourOilChangeODO ?? ""
            },
          if (transmissionControlModule != null)
            {
              "component": 5,
              "status": getSelection(selection: transmissionControlModule)
            },
          if (gearMount != null)
            {
              "component": 6,
              "status": getSelection(selection: gearMount),
              "no_of_mounts": noOfGearMounts ?? ''
            },
        ],
        "differential": [
          if (frontDifferentialOil != null)
            {
              "component": 1,
              "status": getSelection(selection: frontDifferentialOil),
              "oil_life": frontDifferentialOilLife ?? '',
              "next_service_odo": nextFrontDifferentialOilChangeODO ?? ""
            },
          if (rearDifferentialOil != null)
            {
              "component": 2,
              "status": getSelection(selection: rearDifferentialOil),
              "oil_life": rearDifferentialOilLife ?? '',
              "next_service_odo": nextRearDifferentialOilChangeODO ?? ""
            },
          if (differentialBushes != null)
            {
              "component": 3,
              "status": getSelection(selection: differentialBushes)
            },
          if (shaftStatus != null)
            {"component": 4, "status": getSelection(selection: shaftStatus)},
          if (shaftSeals != null)
            {"component": 5, "status": getSelection(selection: shaftSeals)}
        ],
        "break": [
          {
            "component": 1, 
            "status": getSelection(selection: flBreakDisc),
            "thickness": flbdPercentage ?? ""
          },
          {
            "component": 2,
            "status": getSelection(selection: frBreakDisc),
            "thickness": frbdPercentage ?? ""
          },
          {
            "component": 3,
            "status": getSelection(selection: rlBreakDisc),
            "thickness": rlbdPercentage ?? ""
          },
          {
            "component": 4,
            "status": getSelection(selection: rrBreakDisc),
            "thickness": rrbdPercentage ?? ""
          },
          {
            "component": 5,
            "status": getSelection(selection: fbPad),
            "thickness": fbPadPercentage ?? ""
          },
          {
            "component": 6,
            "status": getSelection(selection: rbPad),
            "thickness": rbPadPercentage ?? ""
          },
          {
            "component": 7,
            "status": getSelection(selection: rbShoe),
            "thickness": rbShoePercentage ?? ""
          },
          {
            "component": 8,
            "status": getSelection(selection: breakFluid),
            "thickness": breakFluidPercentage ?? ""
          },
        ],
        "suspension": [
          {"component": 1, "status": getSuspensionSelection(selection: flla)},
          {"component": 2, "status": getSuspensionSelection(selection: frla)},
          {"component": 3, "status": getSuspensionSelection(selection: rlla)},
          {"component": 4, "status": getSuspensionSelection(selection: rrla)},
          {"component": 5, "status": getSuspensionSelection(selection: uafl)},
          {"component": 6, "status": getSuspensionSelection(selection: uafr)},
          {"component": 7, "status": getSuspensionSelection(selection: tar)},
          {"component": 8, "status": getSuspensionSelection(selection: abli)},
          {"component": 9, "status": getSuspensionSelection(selection: abri)},
          {"component": 10, "status": getSuspensionSelection(selection: abro)},
          {"component": 11, "status": getSuspensionSelection(selection: ablo)},
          {"component": 12, "status": getSuspensionSelection(selection: lrfl)},
          {"component": 13, "status": getSuspensionSelection(selection: lrfr)},
          {"component": 14, "status": getSuspensionSelection(selection: lrrl)},
          {"component": 15, "status": getSuspensionSelection(selection: lrrr)},
          {"component": 16, "status": getSuspensionSelection(selection: brbf)},
          {"component": 17, "status": getSuspensionSelection(selection: brbr)},
        ],
        "ac": [
          {"component": 1, "status": getSelection(selection: acGas)},
          {"component": 2, "status": getSelection(selection: compressor)},
          {"component": 3, "status": getSelection(selection: condenser)},
          {"component": 4, "status": getSelection(selection: evaporator)},
          {"component": 5, "status": getSelection(selection: exValve)}
        ],
        "steering": [
          {"component": 1, "status": getSelection(selection: sbl)},
          {"component": 2, "status": getSelection(selection: sbr)},
          {"component": 3, "status": getSelection(selection: sel)},
          {"component": 4, "status": getSelection(selection: ser)},
          {"component": 5, "status": getSelection(selection: bjl)},
          {"component": 6, "status": getSelection(selection: bjr)},
        ],
        "light": [
          {"component": 1, "status": getLampSelection(selection: headLight)},
          {"component": 2, "status": getLampSelection(selection: parkLight)},
          {"component": 3, "status": getLampSelection(selection: indicators)},
          {
            "component": 4,
            "status": getLampSelection(selection: reverseGearLight)
          },
          {"component": 5, "status": getLampSelection(selection: dimBright)},
          {"component": 6, "status": getLampSelection(selection: fogLamps)},
        ],
        "fuel": [
          {"component": 1, "status": getSelection(selection: fuelPump)},
          {"component": 2, "status": getSelection(selection: fuelFilter)},
          {"component": 3, "status": getSelection(selection: canister)},
          {"component": 4, "status": getSelection(selection: fuelTank)},
        ],
        "other": [
          {
            "component": 1,
            "status": getSelection(selection: centerLock),
            "remarks": clRemarks ?? ""
          },
          {
            "component": 2,
            "status": getSelection(selection: windowLifter),
            "remarks": wlRemarks ?? ""
          },
          {"component": 3, "status": getSelection(selection: alignment)},
          {"component": 4, "status": getSelection(selection: wheelBalance)},
          {"component": 5, "status": getSelection(selection: wiperBladeFront)},
          {"component": 6, "status": getSelection(selection: wiperBladeRear)},
          {
            "component": 7,
            "front_right": frPressure,
            "front_left": flPressure,
            "rear_right": rrPressure,
            "rear_left": rlPressure
          }
        ]
      };

  Future<bool?> addService() async {
    updateLoader(true);
    return await repo.addService(params: params).fold(
      (left) {
        updateLoader(false);
        return false;
      },
      (right) {
        bool isSuccess = right['status'] ?? false;
        updateLoader(false);
        return isSuccess;
      },
    ).catchError((e) {
      updateLoader(false);
      return false;
    });
  }

  Future<bool?> searchCustomers(String phoneNumber) async {
    customerList = [];
    updateSearchLoader(true);
    return await repo.getCustomers(phoneNumber: phoneNumber).fold(
      (left) {
        updateSearchLoader(false);
        return false;
      },
      (right) {
        customerList = [];
        final isSuccess = right.status ?? false;
        customerList.addAll(right.results?.data ?? []);
        updateSearchLoader(false);
        return isSuccess;
      },
    ).catchError((e) {
      updateSearchLoader(false);
      return false;
    });
  }

  @override
  updateLoader(bool value) {
    isServiceAdding = value;
    notifyListeners();
  }

  @override
  updateGarageLoader(bool value) {
    isGarageLoader = value;
    notifyListeners();
  }

  @override
  updateSearchLoader(bool value) {
    isSearchLoading = value;
    notifyListeners();
  }

  @override
  updateOodoReading(bool value) {
    isOodoReadingLoading = value;
    notifyListeners();
  }
}

mixin Helper {
  bool isServiceAdding = false;
  bool isGarageLoader = false;
  bool isSearchLoading = false;
  bool isOodoReadingLoading = false;
  updateLoader(bool value);
  updateGarageLoader(bool value);
  updateSearchLoader(bool value);
  updateOodoReading(bool value);
}
