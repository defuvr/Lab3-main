(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Library: MTMpcSiso
 * File: MTMpcSiso.typ
 * Author: B&R
 ********************************************************************
 * Data types of library MTMpcSiso
 ********************************************************************)

TYPE
	MTMpcSisoEnhancedPortType : 	STRUCT  (*Port between function block and non cyclic task class*)
		Link : REFERENCE TO MTMpcSisoEnhanced; (*Self display of function block structure*)
		StatusASync : UINT; (*Status information of non cyclic operations*)
		StatusQp : USINT; (*Status information of solution vector*)
		_statemachine : USINT; (*Internal ASYFUMA var*)
		_result : USINT; (*Internal ASYFUMA var*)
	END_STRUCT;
	MTMpcSisoEnhancedInternalType : 	STRUCT  (*Internal data of MTMpcSisoEnhanced*)
		FailureMemory : ARRAY[0..99]OF DINT; (*Failure memory of last function block errors (every item) and warnings (item per case)*)
		Warning : BOOL; (*Function block warning active*)
		Initialized : BOOL; (*First init accomplished*)
		InputError : BOOL := 0; (*0 => everything ok; 1 => imperfect/wrong fub interface allocation*)
		SolverError : INT := 0; (*Error number of solver*)
		TotalAdd : INT := 0; (*Total number of constraints added*)
		TotalDrop : INT := 0; (*Total number of constraints dropped*)
		InitStatus : BOOL := 0; (*Status == 1 => initialization*)
		SolverStatus : BOOL := 0; (*Status == 1 => solver busy*)
		PostCtrlStatus : BOOL := 0; (*Status == 1 => post control busy*)
		UpdateOld : BOOL := 0; (*Temp. mem.*)
		SystemReset : BOOL := 0; (*System behavior chronicle temp. mem.*)
		SystemResetOld : BOOL := 0; (*System behavior chronicle temp. mem.*)
		CtrlHorReduced : UDINT; (*Amount of merged control horizon blocks*)
		SlideCount : UDINT := 0; (*Internal counter to prevent control horizon overrun during shift op*)
		DRAM : UDINT; (*Displays free DRAM of the control computer*)
		CtrlTimeStamp : UDINT; (*Expired task class cycles to last control action *)
		CtrlMode : USINT; (*0 => promt contr. (no control in init); 1 promt contr. (feed forward in init); >1 => time definite contr. *)
		InitTime : UDINT; (*Time requirement of initialization procedure (ms)*)
		SolverTime : UDINT; (*Time requirement of solver (ms)*)
		PostCtrlTime : UDINT; (*Time requirement of trajectory generation (ms)*)
		ProcessTime : UDINT; (*Measured cycle time of controlled system (ms)*)
		CycleTime : LREAL; (*Measured cycle time of controlled system (ms)*)
		EigenvalueMin : LREAL; (*Min eigenvalue of hessian*)
		EigenvalueMax : LREAL; (*Max eigenvalue of hessian*)
		ActPrd : ARRAY[0..199]OF LREAL := [200(0.0)]; (*Predicted sequence of controlled variables*)
		ActDeltaPrd : ARRAY[0..199]OF LREAL := [200(0.0)]; (*Predicted rate of controlled variables as sequence*)
		OutDeltaOpt : ARRAY[0..200]OF LREAL := [201(0.0)]; (*Solver access to next optimal solution*)
		StatOpt : ARRAY[0..199]OF LREAL := [200(0.0)]; (*Static optimization part*)
		UpdateActive : BOOL; (*Internal function block update in progress*)
		Scanned : MTMpcSisoEnhancedInternalScdType; (*Allows active control steps during initialization and obj. calculation*)
		StartTime : TIME; (*Internal time measurement*)
		EndTime : TIME; (*Internal time measurement*)
		OutMinDragInd : LREAL := 0.0; (*Drag indicator of minimum output variables*)
		OutMaxDragInd : LREAL := 0.0; (*Drag indicator of maximum output variables*)
		Bootkey : BOOL; (*First init accomplished*)
		Hzp : REFERENCE TO LREAL; (*Memory to define objective*)
		YTransform : REFERENCE TO LREAL; (*Memory to define objective*)
		Hyp : REFERENCE TO LREAL; (*Memory to define objective*)
		HypT : REFERENCE TO LREAL; (*Memory to define objective*)
		H : REFERENCE TO LREAL; (*Memory to define objective*)
		Zin : REFERENCE TO LREAL; (*Memory to define objective*)
		Rin : REFERENCE TO LREAL; (*Memory to define objective*)
		RcnIn : REFERENCE TO LREAL; (*Memory to define objective*)
		Hoy : REFERENCE TO LREAL; (*Memory to define objective*)
		Hoz : REFERENCE TO LREAL; (*Memory to define objective*)
		Hoyz : REFERENCE TO LREAL; (*Memory to define objective*)
		Hcyz : REFERENCE TO LREAL; (*Memory to define objective*)
		L : REFERENCE TO LREAL; (*Memory to define objective*)
		TM1 : REFERENCE TO LREAL; (*Temporary memory*)
		TM2 : REFERENCE TO LREAL; (*Temporary memory*)
		TM3 : REFERENCE TO LREAL; (*Temporary memory*)
		TM4 : REFERENCE TO LREAL; (*Temporary memory*)
		TM5 : ARRAY[0..199]OF LREAL := [200(0.0)]; (*Temporary memory*)
		TM6 : ARRAY[0..199]OF LREAL := [200(0.0)]; (*Temporary memory*)
		TMQp : ARRAY[0..1806]OF INT; (*Temporary memory*)
	END_STRUCT;
	MTMpcSisoEnhancedInternalScdType : 	STRUCT  (*Scanned data of MTMpcSisoEnhanced*)
		SystemRange : MTMpcSisoSystemRangeType; (*System range of scanned control specific data*)
		NAct : USINT := 1; (*Number of controlled variables*)
		NOut : USINT := 1; (*Number of manipulating variables*)
		NDist : USINT := 0; (*Number of disturbance variables*)
		PrdHor : UDINT := 100; (*Prediction horizon *)
		CtrlHor : UDINT := 50; (*Control horizon *)
		OutOperatingPoint : LREAL := 0.0; (*Adjust static operating points regarded to actuating variables*)
		ActOperatingPoint : LREAL := 0.0; (*Adjust static operating points regarded to controlled variables*)
		OutMin : LREAL := 0.0; (*Minimum value for manipulating variables*)
		OutMax : LREAL := 0.0; (*Maximum value for manipulating variables*)
		SoftConstraint : BOOL := FALSE; (*Disable enable soft constraint formulation per CV*)
		FIRModel : BOOL := FALSE; (*Specify if system dynamic (stored as FSR/FIR <=> False/True)*)
		CtrlHorReduced : UDINT := 1; (*Amount of merged control horizon blocks*)
		ActOld : LREAL := 0.0; (*Former scanned control variable measurement*)
		Act : LREAL := 0.0; (*Scanned control variable measurement*)
		OutOld : LREAL := 0.0; (*Former scanned manipulating variable measurement*)
		OutRef : LREAL := 0.0; (*Scanned reference input of manipulating variables*)
		Out : LREAL := 0.0; (*Scanned manipulating variables*)
		Dist : ARRAY[0..199]OF LREAL := [200(0.0)]; (*Scanned intended sequence of disturbance values*)
		DistOld : LREAL := 0.0; (*Scanned former disturbance values*)
		DistMeasured : LREAL := 0.0; (*Scanned disturbance values*)
		Set : ARRAY[0..199]OF LREAL := [200(0.0)]; (*Scanned intended sequence of reference values*)
		OptStatOld : ARRAY[0..199]OF LREAL := [200(0.0)]; (*Static part of optimization criteria*)
		OutDeltaOptOld : ARRAY[0..200]OF LREAL := [201(0.0)]; (*Former optimal solution *)
		OutDeltaScdOld : ARRAY[0..199]OF LREAL := [200(0.0)]; (*Former scanned delta manipulating variables*)
		OutScdOld : ARRAY[0..199]OF LREAL := [200(0.0)]; (*Manipulating variable chronicle*)
		OutStatActModel : LREAL := 0.0; (*Static part of model based control variables calc. according to Out*)
		ActByOut : LREAL := 0.0; (*Out convolution part of model based control variables calc.*)
		DistDeltaPrd : ARRAY[0..199]OF LREAL := [200(0.0)]; (*Specified delta disturbance variables of system*)
		DistScdOld : ARRAY[0..199]OF LREAL := [200(0.0)]; (*Disturbance variables chronicle*)
		DistDeltaScdOld : ARRAY[0..200]OF LREAL := [201(0.0)]; (*Former scannced delta disturbance variables*)
		DistStatActModel : LREAL := 0.0; (*Static part of model based control variables calc. according to Dist *)
		ActByDist : LREAL := 0.0; (*Dist convolution part of model based control variables calc.*)
		ActScdOld : ARRAY[0..199]OF LREAL := [200(0.0)]; (*Controlled variables chronicle*)
		ActDeltaModel : LREAL := 0.0; (*Predicted delta control variables of next control cycle*)
		ActDeltaMeasured : LREAL := 0.0; (*Measured delta control variables of next control cycle*)
		ActModelBased : LREAL := 0.0; (*Model based calculated control variables*)
	END_STRUCT;
	MTMpcSisoEnhancedPerformanceType : 	STRUCT  (*Control / model quality review of MTMpcSisoEnhanced*)
		InitTimeRatio : UINT; (*Ratio between initialization and process sample time in %*)
		CtrlTimeRatio : UINT; (*Ratio between optimization (new control action) and process sample time in %*)
		TotalTimeRatio : UINT; (*Ratio between total calculation and process sample time in %*)
		ConditionNbr : LREAL; (*Condition number of hessian according to l2 norm*)
		StatObj : LREAL; (*Stat. part of objective function*)
		DynObj : LREAL; (*Dynamic part of objective function*)
		Iter : DINT; (*Number of iterations*)
		ActDeltaPrd : LREAL; (*Rate of model based calc. PV's*)
		ActIDeltaPrd : LREAL; (*Sum of rate of model based calc. PV's*)
		PrdError : LREAL; (*Prediction errors*)
		PrdAvgError : LREAL; (*Arithmetic mean of prediction errors*)
		PrdIAError : LREAL; (*Integral absolute errors of prediction errors*)
		CtrlError : LREAL; (*Control errors*)
		CtrlAvgError : LREAL; (*Arithmetic mean of control errors*)
		CtrlIAError : LREAL; (*Integral absolute errors of control errors*)
		OutVar : LREAL; (*Variance of manipulating variables (prediction horizon)*)
		ActVar : LREAL; (*Variance of controlled variables (prediction horizon)*)
		CorrActMeasuredPrd : LREAL; (*Correlation between PV and IdxP*)
		Slack : LREAL; (*Contain slack variables if soft constraints are enabled*)
		CycleCount : UDINT := 0; (*Internal counter till system sample time is reached (cycleFactor)*)
		PrdCompleted : BOOL := FALSE; (*Change from false to true if QP is solved and predictive data is generated => post contr finished*)
		ActIScdDeltaPrd : ARRAY[0..199]OF LREAL; (*Cummulative sum of predicted control variable rate*)
		ActScdDeltaPrd : ARRAY[0..199]OF LREAL; (*Predicted control variable rate*)
		PrdErrorScdOld : ARRAY[0..199]OF LREAL; (*Prediction error FIFO memory (x_measured(k) - x_predicted(k))*)
		CtrlErrorScdOld : ARRAY[0..199]OF LREAL; (*Control error FIFO memory*)
	END_STRUCT;
	MTMpcSisoParameterType : 	STRUCT  (*MPC parametrization structure*)
		MemMode : BOOL := FALSE; (*TRUE => memory allocation or rather function block operation mode / FALSE => delete memory*)
		CycleFactor : UDINT := 1; (*Adjust sampling time of controlled system (CycleFactor * task class cycle time = sample time of process)*)
		NrDist : USINT := 1; (*Number of measured disturbances*)
		PredictionHorizon : UDINT := 100; (*Prediction horizon*)
		ControlHorizon : UDINT := 50; (*Global control horizon*)
		OutSamplesMerge : USINT := 1; (*Set up quantity of merged output trajectory entries *)
		OutOperatingPoint : LREAL := 0.0; (*Adjust static operating points regarded to actuating variables*)
		ActOperatingPoint : LREAL := 0.0; (*Adjust static operating points regarded to controlled variables*)
		WeightErrorExp : LREAL := 0.0; (*Weight factor take exponential affect on control error*)
		WeightError : LREAL := 1.0; (*Weight factor take linear affect on control error*)
		OutMoveSuppression : LREAL := 1.0; (*Weight factor take linear affect on manipulating variables (0 => no alteration limit till u_min, u_max)*)
		ActDeltaWeight : LREAL := 0.0; (*Weight openloop - closed loop delta control variables prediction amount (only IT Systems)*)
		FIRModel : BOOL := FALSE; (*Specify system dynamic (FSR/FIR <=> False/True)*)
		SoftConstraint : BOOL := FALSE; (*Enable soft constraint formulation per control variable*)
		OutDeltaMin : LREAL := 0.0; (*Allowed minimum rate of manipulating variables*)
		OutDeltaMax : LREAL := 0.0; (*Allowed maximum rate of manipulating variables*)
		OutMin : LREAL := 0.0; (*Absolute minimum value for manipulating variables*)
		OutMax : LREAL := 0.0; (*Absolute maximum value for manipulating variables*)
		ActSoftMin : LREAL := 0.0; (*Soft lower bound constraints of control variables*)
		ActSoftMax : LREAL := 0.0; (*Soft upper bound constraints of conrol variables*)
		PostCtrlDisable : BOOL; (*Disable calculation of predicted output trajectories*)
		OutRespAct0 : REFERENCE TO LREAL; (*FSR/FIR characterize ActValue/Out*)
		DistRespAct0 : REFERENCE TO LREAL; (*FSR/FIR characterize ActValue/Disturbance*)
		SystemRange : MTMpcSisoSystemRangeType; (*System range of control specific data*)
	END_STRUCT;
	MTMpcSisoLiteInternalType : 	STRUCT  (*Internal data of MTMpcSisoLite*)
		SolverError : INT := 0; (*Error number of solver*)
		CtrlHorReduced : UDINT := 1; (*Amount of merged control horizon blocks*)
		CycleCount : UDINT := 1; (*Internal counter till system sample time is reached*)
		InitTime : UDINT := 0; (*Time requirement of initialization procedure (ms)*)
		SolverTime : UDINT := 0; (*Time requirement of objective calculation procedure (ms)*)
		CycleTime : LREAL; (*Cycle time*)
		Warning : BOOL := 0; (*Temp. mem.*)
		Iter : DINT := 0; (*Number of iterations*)
		TotalAdd : INT := 0; (*Total number of constraints added*)
		TotalDrop : INT := 0; (*Total number of constraints dropped*)
		UpdateActive : BOOL := 0; (*Temp. mem.*)
		Update : BOOL := 0; (*Temp. mem.*)
		UpdateOld : BOOL := 0; (*Temp. mem.*)
		EigenvalueMin : LREAL; (*Min eigenvalue of hessian*)
		EigenvalueMax : LREAL; (*Max eigenvalue of hessian*)
		OutMinDragInd : LREAL := 0.0; (*Drag indicator of miinimum manipulating variables*)
		OutMaxDragInd : LREAL := 0.0; (*Drag indicator of maximum manipulating variables*)
		ActPrd : ARRAY[0..199]OF LREAL := [200(0.0)]; (*Predicted sequence of controlled variables*)
		ActDeltaPrd : ARRAY[0..199]OF LREAL := [200(0.0)]; (*Predicted rate of controlled variables*)
		OutDeltaOpt : ARRAY[0..200]OF LREAL := [201(0.0)]; (*Solver access to next optimal solution*)
		StatOpt : ARRAY[0..199]OF LREAL := [200(0.0)]; (*Static optimization part*)
		OutDeltaScdOld : ARRAY[0..199]OF LREAL := [200(0.0)]; (*Former delta manipulating variables*)
		DistDeltaScdOld : ARRAY[0..200]OF LREAL := [201(0.0)]; (*Former delta disturbance variables*)
		ActScd : LREAL; (*Scanned controlled variables*)
		ActOld : LREAL; (*Former controlled variables*)
		OutOld : LREAL; (*Former manipulating variables*)
		DistOld : LREAL; (*Former disturbance values*)
		Hzp : REFERENCE TO LREAL; (*Memory to define objective*)
		YTransform : REFERENCE TO LREAL; (*Memory to define objective*)
		Hyp : REFERENCE TO LREAL; (*Memory to define objective*)
		HypT : REFERENCE TO LREAL; (*Memory to define objective*)
		H : REFERENCE TO LREAL; (*Memory to define objective*)
		Hoyz : REFERENCE TO LREAL; (*Memory to define objective*)
		Hcyz : REFERENCE TO LREAL; (*Memory to define objective*)
		L : REFERENCE TO LREAL; (*Memory to define objective*)
		Zin : REFERENCE TO LREAL; (*Memory to define objective*)
		Rin : REFERENCE TO LREAL; (*Memory to define objective*)
		RcnIn : REFERENCE TO LREAL; (*Memory to define objective*)
		TM1 : REFERENCE TO LREAL; (*Temporary memory*)
		TM2 : REFERENCE TO LREAL; (*Temporary memory*)
		TM3 : REFERENCE TO LREAL; (*Temporary memory*)
		TM4 : REFERENCE TO LREAL; (*Temporary memory*)
		TMQp : ARRAY[0..1806]OF INT; (*Temporary memory*)
		Bootkey : UDINT; (*Internal usage*)
	END_STRUCT;
	MTMpcSisoSystemRangeType : 	STRUCT  (*MPC specific function block data range*)
		NActSum : UDINT := 0; (*Calculated objective size*)
		NOutSum : UDINT := 0; (*Calculated objective size*)
		NOutSumMerged : UDINT := 0; (*Calculated objective size*)
		NOutSumMax : UDINT := 0; (*Calculated objective size*)
		NDistSum : UDINT := 0; (*Calculated objective size*)
		NDistSumMax : UDINT := 0; (*Calculated objective size*)
		TempMemMax : UDINT := 0; (*Temporary memory size of initialization procedure*)
		QpMemMax : UDINT := 0; (*Temporary memory size of objective *)
		NSoftC : USINT := 0; (*Number of considered soft constraints*)
	END_STRUCT;
	MTMpcSisoReactorInternalType : 	STRUCT  (*Internal data of MTMpcSisoReactor*)
		V : LREAL; (*Gain MV 1 to CV's*)
		T : LREAL; (*Time constants MV 1 to CV's*)
		d : LREAL; (*Time constants MV 1 to CV's*)
		Td : LREAL; (*Time constants MV 1 to CV's*)
		Tt : UINT; (*Deadtime MV 1 to CV's*)
		xInternal : LREAL; (*Systembehavior CV 1 to all inputs*)
		xOld1 : LREAL; (*Systembehavior CV 1 to all inputs*)
		xOld2 : LREAL; (*Systembehavior CV 1 to all inputs*)
		yOld : LREAL; (*Systembehavior CV 1 to all inputs*)
		CycleTime : LREAL; (*Cycle time of task class as well as process sample time*)
		yBuffer : ARRAY[0..199]OF LREAL; (*Internal usage*)
		Bootkey : UDINT; (*Internal usage*)
	END_STRUCT;
END_TYPE
