(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Library: ASMcDcs
 * File: ASMcDcs.typ
 * Author: B+R
 ********************************************************************
 * Data types of library ASMcDcs
 ********************************************************************)

TYPE
    ASMcDcsTidcsAdditionalInfoType :   STRUCT  (*data type for additional information which is output by the FB*)
        Velocity : REAL; (*velocity which is internally calculated by the FB (for dead time compensation)*)
        Acceleration : REAL; (*acceleration which is internally calculated by the FB (not used at certain FBs)*)
        ActualPosition : REAL; (*actual position value within the configured "Period" depending on the input "Position"*)
        CalculatedPosition : REAL; (*actual position value within the configured "Period" depending on the input "Position" and all compensation times*)
        NextCamIndex : UINT; (*index of the position and camwidthtime combination  ("FirstOnPosition[x]", "CamWidthTime[x]") which is used for the generation of the next switching signal*)
        ErrorInIndex : UINT; (*index of the position and camwidthtime combination ("FirstOnPosition[x]", "CamWidthTime[x]") which caused an error after "Enable" = TRUE or "InitSwitches" = TRUE*)
        CurrentOutputStatus : BOOL; (*on/off-status of cam switch*)
    END_STRUCT;
    ASMcDcsAdditionalInfoType :     STRUCT  (*data type for additional information which is output by the FB*)
        Velocity : REAL; (*velocity which is internally calculated by the FB (for dead time compensation)*)
        Acceleration : REAL; (*acceleration which is internally calculated by the FB (not used at certain FBs)*)
        ActualPosition : REAL; (*actual position value within the configured "Period" depending on the input "Position"*)
        CalculatedPosition : REAL; (*actual position value within the configured "Period" depending on the input "Position" and all compensation times*)
        NextCamIndex : UINT; (*index of the position pair ("FirstOnPosition[x]", "LastOnPosition[x]") which is used for the generation of the next switching signal*)
        ErrorInIndex : UINT; (*index of the position pair ("FirstOnPosition[x]", "LastOnPosition[x]") which caused an error after "Enable" = TRUE or "InitSwitches" = TRUE*)
    END_STRUCT;
    ASMcDcsEdcsInternalType :   STRUCT  (*data type for internal data*)
        Mode : UINT; (*internal variable*)
        cyclesToWait : UINT; (*internal variable*)
        PositionConfig : ASMcDcsPositionConfigType; (*internal variable*)
        ForceEvent : BOOL; (*internal variable*)
        TrackOptions : ASMcDcsEdcsTrackType; (*internal variable*)
        SwitchesPeriod : UDINT; (*internal variable*)
        StartPosition : DINT; (*internal variable*)
        SwitchingPosition : ARRAY[0..131]OF REAL; (*internal variable*)
        FilterOptions : ASMcDcsFilterType; (*internal variable*)
        HwInput : ASMcDcsHwInputType; (*internal variable*)
        OldCount : SINT; (*internal variable*)
        EventCount : SINT; (*internal variable*)
        Event : BOOL; (*internal variable*)
        InitSwitches : BOOL; (*internal variable*)
        InitTrackOptions : BOOL; (*internal variable*)
        InitFilterOptions : BOOL; (*internal variable*)
        InOperation : BOOL; (*internal variable*)
        Busy : BOOL; (*internal variable*)
        Error : BOOL; (*internal variable*)
        ErrorID : UINT; (*internal variable*)
        WaitingForEvent : BOOL; (*internal variable*)
        SwitchesInitialized : BOOL; (*internal variable*)
        TrackOptionsInitialized : BOOL; (*internal variable*)
        FilterOptionsInitialized : BOOL; (*internal variable*)
        reserve1 : REAL; (*internal variable*)
        cntSwitchingPositions : UINT; (*internal variable*)
        HwOutput : ASMcDcsHwOutputType; (*internal variable*)
        AdditionalInfo : ASMcDcsAdditionalInfoType; (*internal variable*)
        tcCycleTime : REAL; (*internal variable*)
        sysTime : DINT; (*internal variable*)
        reserve2 : USINT; (*internal variable*)
        step : USINT; (*internal variable*)
        edgeIndex : UINT; (*internal variable*)
        memory : ARRAY[0..99]OF UDINT; (*internal variable*)
    END_STRUCT;
    ASMcDcsEdcsTrackType :  STRUCT  (*data type for the configuration of the track related parameters of EventDigitalCamSwitch*)
        NetworkCompensation : REAL; (*defines the time between the timestamps are calculated and the timestamp value is received by the X20DS4389*)
        SensorCompensation : REAL; (*delay time of the used sensor*)
        OnCompensation : REAL; (*delay time for switching the output ON (for dead time compensation)*)
        OffCompensation : REAL; (*delay time for switching the output OFF (for dead time compensation)*)
        Hysteresis : REAL; (*hysteresis window*)
        DisableNegativeDirection : BOOL; (*disable switches if master is moving in negative direction*)
    END_STRUCT;
    ASMcDcsEventInputType :     STRUCT  (*data type for the input information which can be mapped to a X20DS4389 channel with activated edge detection function*)
        EventInputData : ARRAY[0..2]OF SINT; (*internal used data*)
    END_STRUCT;
    ASMcDcsFilterType :     STRUCT  (*data type for the configuration of parameters for different filter options*)
        Mode : ASMcDcsFilterModeEnum; (*defines the filter type*)
        Parameter1 : REAL; (*filter parameter 1 (usage is depending on the mode)*)
        Parameter2 : REAL; (*filter parameter 2 (usage is depending on the mode)*)
        Parameter3 : REAL; (*filter parameter 3 (usage is depending on the mode)*)
        Parameter4 : REAL; (*filter parameter 4 (usage is depending on the mode)*)
        Parameter5 : REAL; (*filter parameter 5 (usage is depending on the mode)*)
        Parameter6 : REAL; (*filter parameter 6 (usage is depending on the mode)*)
    END_STRUCT;
    ASMcDcsGdcsInternalType :   STRUCT  (*data type for internal data*)
        Mode : UINT; (*internal variable*)
        cyclesToWait : UINT; (*internal variable*)
        PositionConfig : ASMcDcsPositionConfigType; (*internal variable*)
        TrackOptions : ASMcDcsGdcsTrackType; (*internal variable*)
        SwitchesPeriod : UDINT; (*internal variable*)
        StartPosition : DINT; (*internal variable*)
        SwitchingPosition : ARRAY[0..131]OF REAL; (*internal variable*)
        EnableTrack : BOOL; (*internal variable*)
        InitSwitches : BOOL; (*internal variable*)
        InitTrackOptions : BOOL; (*internal variable*)
        InOperation : BOOL; (*internal variable*)
        Busy : BOOL; (*internal variable*)
        Error : BOOL; (*internal variable*)
        ErrorID : UINT; (*internal variable*)
        SwitchesInitialized : BOOL; (*internal variable*)
        TrackOptionsInitialized : BOOL; (*internal variable*)
        Value : BOOL; (*internal variable*)
        StartStop : BOOL; (*internal variable*)
        cntSwitchingPositions : UINT; (*internal variable*)
        AdditionalInfo : ASMcDcsAdditionalInfoType; (*internal variable*)
        tcCycleTime : REAL; (*internal variable*)
        reserve2 : USINT; (*internal variable*)
        step : USINT; (*internal variable*)
        edgeIndex : UINT; (*internal variable*)
        memory : ARRAY[0..99]OF UDINT; (*internal variable*)
    END_STRUCT;
    ASMcDcsGdcsTrackType :  STRUCT  (*data type for the configuration of the track related parameters of GeneralDigitalCamSwitch*)
        Filter : REAL; (*parameter of filter*)
        OnCompensation : REAL; (*delay time for switching the output ON (for dead time compensation)*)
        OffCompensation : REAL; (*delay time for switching the output OFF (for dead time compensation)*)
        Hysteresis : REAL; (*hysteresis window*)
        DisableNegativeDirection : REAL; (*disable switches if master is moving in negative direction*)
    END_STRUCT;
    ASMcDcsHwInputType :    STRUCT  (*data type for input information which can be mapped to a X20DS4389 channel with activate edge generator function*)
        UnitState : USINT; (*status information about one unit of the edge generator*)
        SequenceReadback : SINT; (*last sequence number which was taken by the edge generator*)
    END_STRUCT;
    ASMcDcsHwOutputType :   STRUCT  (*data type for output information which can be mapped to a X20DS4389 channel with activated edge generator function*)
        UnitControl : USINT; (*information to control a unit of the edge generator*)
        Sequence : SINT; (*sequence number for the edge generation*)
        Timestamp1 : INT; (*timestamp for the edge generation*)
        Timestamp2 : INT; (*timestamp for the edge generation*)
    END_STRUCT;
    ASMcDcsPdcsInternalType :   STRUCT  (*data type for internal data*)
        Mode : UINT; (*internal variable*)
        cyclesToWait : UINT; (*internal variable*)
        PositionConfig : ASMcDcsPositionConfigType; (*internal variable*)
        TrackOptions : ASMcDcsPdcsTrackType; (*internal variable*)
        SwitchesPeriod : UDINT; (*internal variable*)
        StartPosition : DINT; (*internal variable*)
        SwitchingPosition : ARRAY[0..131]OF REAL; (*internal variable*)
        FilterOptions : ASMcDcsFilterType; (*internal variable*)
        HwInput : ASMcDcsHwInputType; (*internal variable*)
        OldCount : SINT; (*internal variable*)
        EnableTrack : BOOL; (*internal variable*)
        InitSwitches : BOOL; (*internal variable*)
        InitTrackOptions : BOOL; (*internal variable*)
        InitFilterOptions : BOOL; (*internal variable*)
        InOperation : BOOL; (*internal variable*)
        Busy : BOOL; (*internal variable*)
        Error : BOOL; (*internal variable*)
        ErrorID : UINT; (*internal variable*)
        SwitchesInitialized : BOOL; (*internal variable*)
        TrackOptionsInitialized : BOOL; (*internal variable*)
        FilterOptionsInitialized : BOOL; (*internal variable*)
        StartStop : BOOL; (*internal variable*)
        cntSwitchingPositions : UINT; (*internal variable*)
        HwOutput : ASMcDcsHwOutputType; (*internal variable*)
        AdditionalInfo : ASMcDcsAdditionalInfoType; (*internal variable*)
        tcCycleTime : REAL; (*internal variable*)
        sysTime : DINT; (*internal variable*)
        reserve2 : USINT; (*internal variable*)
        step : USINT; (*internal variable*)
        edgeIndex : UINT; (*internal variable*)
        memory : ARRAY[0..99]OF UDINT; (*internal variable*)
    END_STRUCT;
    ASMcDcsPdcsTrackType :  STRUCT  (*data type for the configuration of the track related parameters of PrecisionDigitalCamSwitch*)
        NetworkCompensation : REAL; (*defines the time between the timestamps are calculated and the timestamp value is received by the X20DS4389*)
        OnCompensation : REAL; (*delay time for switching the output ON (for dead time compensation)*)
        OffCompensation : REAL; (*delay time for switching the output OFF (for dead time compensation)*)
        Hysteresis : REAL; (*hysteresis window*)
        DisableNegativeDirection : BOOL; (*disable switches if master is moving in negative direction*)
    END_STRUCT;
    ASMcDcsPositionType :   STRUCT  (*data type for universal position input*)
        Integer : DINT; (*integer position value*)
        Real : REAL; (*float position value*)
    END_STRUCT;
    ASMcDcsPositionConfigType :     STRUCT  (*data type for the configuration how the position input should be handled*)
        DataType : ASMcDcsDataTypeEnum; (*the input "Position" will be interpreted depending on this setting*)
        Period : UDINT; (*defines the period of the value of the input "Position"*)
        PositionCompensation : REAL; (*defines the time between the position is evaluated and the value is available on the PLC*)
    END_STRUCT;
    ASMcDcsTidcsSwitchesType :  STRUCT  (*data type for the configuration of the switching data*)
        Period : UDINT; (*period within the switching positions are defined*)
        StartPosition : DINT; (*start position for generating the timestamps*)
        FirstOnPosition : ARRAY[0..63]OF REAL; (*lower boundary where the switch is ON*)
        CamWidthTime : ARRAY[0..63]OF REAL; (*upper boundary where the switch is ON*)
    END_STRUCT;
    ASMcDcsSwitchesType :   STRUCT  (*data type for the configuration of the switching data*)
        Period : UDINT; (*period within the switching positions are defined*)
        StartPosition : DINT; (*start position for generating the timestamps*)
        FirstOnPosition : ARRAY[0..63]OF REAL; (*lower boundary where the switch is ON*)
        LastOnPosition : ARRAY[0..63]OF REAL; (*upper boundary where the switch is ON*)
    END_STRUCT;
    ASMcDcsTdcsAdditionalInfoType :     STRUCT  (*data type for additional information which is output by the TDCS FB*)
        Velocity : REAL; (*velocity which is internally calculated by the FB (for dead time compensation)*)
        Acceleration : REAL; (*acceleration which is internally calculated by the FB (not used at certain FBs)*)
        ActualPosition : REAL; (*actual position value within the configured "Period" depending on the input "Position"*)
        CalculatedPosition : REAL; (*actual position value within the configured "Period" depending on the input "Position" and all compensation times*)
    END_STRUCT;
    ASMcDcsTdcsInternalType :   STRUCT  (*data type for internal data*)
        Mode : UINT; (*internal variable*)
        cyclesToWait : UINT; (*internal variable*)
        PositionConfig : ASMcDcsPositionConfigType; (*internal variable*)
        TrackOptions : ASMcDcsTdcsTrackType; (*internal variable*)
        SwitchPeriod : UDINT; (*internal variable*)
        StartPosition : DINT; (*internal variable*)
        FilterOptions : ASMcDcsFilterType; (*internal variable*)
        HwInput : ASMcDcsHwInputType; (*internal variable*)
        PositionCountOld1 : SINT; (*internal variable*)
        PositionCountOld : SINT; (*internal variable*)
        InitTrackOptions : BOOL; (*internal variable*)
        InitFilterOptions : BOOL; (*internal variable*)
        InOperation : BOOL; (*internal variable*)
        OutputForced : BOOL; (*internal variable*)
        EdgeCnt : SINT; (*internal variable*)
        Busy : BOOL; (*internal variable*)
        Error : BOOL; (*internal variable*)
        CommandedValue : BOOL; (*internal variable*)
        ErrorID : UINT; (*internal variable*)
        InitSwitch : BOOL; (*internal variable*)
        SwitchInitialized : BOOL; (*internal variable*)
        TrackOptionsInitialized : BOOL; (*internal variable*)
        FilterOptionsInitialized : BOOL; (*internal variable*)
        HwOutput : ASMcDcsHwOutputType; (*internal variable*)
        AdditionalInfo : ASMcDcsTdcsAdditionalInfoType; (*internal variable*)
        tcCycleTime : REAL; (*internal variable*)
        sysTime : DINT; (*internal variable*)
        SwitchPositionUsed : BOOL; (*internal variable*)
        step : USINT; (*internal variable*)
        edgeIndex : UINT; (*internal variable*)
        PositionCountAlreadyIncremented : BOOL; (*internal variable*)
        StatusWaitForPeriodEnd : USINT; (*internal variable*)
        Reserve2 : UINT; (*internal variable*)
        memory : ARRAY[0..99]OF UDINT; (*internal variable*)
    END_STRUCT;
    ASMcDcsTdcsSwitchType :     STRUCT  (*data type for the configuration of the switching data*)
        Period : UDINT; (*period within the switching positions are defined*)
        StartPosition : DINT; (*start position for generating the timestamps*)
        Position : REAL; (*next switching position*)
        PositionCount : SINT; (*counter value to identify a new switching position*)
    END_STRUCT;
    ASMcDcsTdcsTrackType :  STRUCT  (*data type for the configuration of the track related parameters of ThresholdDigitalCamSwitch*)
        NetworkCompensation : REAL; (*defines the time between the timestamps are calculated and the timestamp value is received by the X20DS4389*)
        OnCompensation : REAL; (*delay time for switching the output ON (for dead time compensation)*)
        OffCompensation : REAL; (*delay time for switching the output OFF (for dead time compensation)*)
        Hysteresis : REAL; (*hysteresis window*)
    END_STRUCT;

    ASMcDcsTidcsInternalType :  STRUCT  (*data type for internal data*)
        Mode : UINT; (*internal variable*)
        cyclesToWait : UINT; (*internal variable*)
        PositionConfig : ASMcDcsPositionConfigType; (*internal variable*)
        TrackOptions : ASMcDcsTidcsTrackType; (*internal variable*)
        SwitchesPeriod : UDINT; (*internal variable*)
        StartPosition : DINT; (*internal variable*)
        SwitchingPosition : ARRAY[0..131]OF REAL; (*internal variable*)
        FilterOptions : ASMcDcsFilterType; (*internal variable*)
        HwInput : ASMcDcsHwInputType; (*internal variable*)
        OldCount : SINT; (*internal variable*)
        EnableTrack : BOOL; (*internal variable*)
        InitSwitches : BOOL; (*internal variable*)
        InitTrackOptions : BOOL; (*internal variable*)
        InitFilterOptions : BOOL; (*internal variable*)
        InOperation : BOOL; (*internal variable*)
        Busy : BOOL; (*internal variable*)
        Error : BOOL; (*internal variable*)
        ErrorID : UINT; (*internal variable*)
        SwitchesInitialized : BOOL; (*internal variable*)
        TrackOptionsInitialized : BOOL; (*internal variable*)
        FilterOptionsInitialized : BOOL; (*internal variable*)
        StartStop : BOOL; (*internal variable*)
        OutputForced : BOOL; (*internal variable*)
        cntSwitchingPositions : UINT; (*internal variable*)
        timeStampSaved : BOOL; (*internal variable*)
        AdditionalInfo : ASMcDcsTidcsAdditionalInfoType; (*internal variable*)
        step : USINT; (*internal variable*)
        HwOutput : ASMcDcsHwOutputType; (*internal variable*)
        tcCycleTime : REAL; (*internal variable*)
        sysTime : DINT; (*internal variable*)
        edgeIndex : UINT; (*internal variable*)
        reserve : USINT; (*internal variable*)
        savedTsValue : DINT; (*internal variable*)
        memory : ARRAY[0..99]OF UDINT; (*internal variable*)
    END_STRUCT;

    ASMcDcsTidcsTrackType :     STRUCT  (*data type for the configuration of the track related parameters of TimedDigitalCamSwitch*)
        NetworkCompensation : REAL; (*defines the time between the timestamps are calculated and the timestamp value is received by the X20DS4389*)
        OnCompensation : REAL; (*delay time for switching the output ON (for dead time compensation)*)
        OffCompensation : REAL; (*delay time for switching the output OFF (for dead time compensation)*)
        Hysteresis : REAL; (*hysteresis window*)
    END_STRUCT;

    ASMcDcsFilterModeEnum :
        ( (*enum type for the configuration of the filter mode*)
        asMCDCS_FILTER_LOW_PASS := 0, (*first order low pass*)
        asMCDCS_FILTER_OFF := 65535 (*no filter is used*)
        );
    ASMcDcsDataTypeEnum :
        ( (*enum type for the configuration how the input "Position" is interpreted*)
        asMCDCS_DATATYPE_DINTREAL := 0, (*DINT and REAL element of "Position" are evaluated*)
        asMCDCS_DATATYPE_DINT := 1, (*DINT element of "Position" is evaluated*)
        asMCDCS_DATATYPE_REAL := 2, (*REAL element of "Position" is evaluated*)
        asMCDCS_DATATYPE_INT := 4 (*DINT element of "Position" is evaluated and interpreted as INT*)
        );
    ASMcDcsErrorEnum :
        ( (*enum type for the "ErrorID" output*)
        asMCDCS_ERR_INVALID_MODE := 35500, (*at the input "Mode" an invalid value was specified*)
        asMCDCS_ERR_INVALID_POSITION_CFG := 35501, (*at least at one element of the structure input "PositionConfig" an invalid value was specified*)
        asMCDCS_ERR_INVALID_SWITCHES := 35502, (*the definition of "Switches.FirstOnPosition[x]" or "Switches.LastOnPosition[x]" is not correct*)
        asMCDCS_ERR_INVALID_SWITCHES_PER := 35503, (*at the element "Period" of the structure input "Switches" an invalid value was specified*)
        asMCDCS_ERR_INVALID_START_POS := 35504, (*at the element "StartPosition" of the structure input "Switches" an invalid value was specified*)
        asMCDCS_ERR_INVALID_TRACK_OPTION := 35505, (*at least at one element of the structure input "TrackOptions" an invalid value was specified*)
        asMCDCS_ERR_INVALID_FILTER_MODE := 35506, (*at the element "Mode" of the structure input "FilterOptions" an invalid value was specified*)
        asMCDCS_ERR_INVALID_FILTER_PARAM := 35507, (*at least at one element of the structure input "FilterOptions" an invalid value was specified*)
        asMCDCS_ERR_INVALID_TIMESTAMP := 35508, (*the timestamp, which was received by the X20DS4389 module from the function block, was in the past*)
        asMCDCS_ERR_INTERNAL := 35509, (*internal error*)
        asMCDCS_ERR_INVALID_ONLINE_CHNG := 35510, (*the value of an input parameter, which is not allowed to be changed while the FB is enabled, was changed*)
        asMCDCS_ERR_INVALID_SW_POS_CNT := 35511 (*the value of "Switch.PositionCount" was changed in a not allowed manner*)
        );
END_TYPE
