function RTW_SidParentMap() {
    this.sidParentMap = new Array();
    this.sidParentMap["MyRegModel_Simulink:21"] = "MyRegModel_Simulink:20";
    this.sidParentMap["MyRegModel_Simulink:22"] = "MyRegModel_Simulink:20";
    this.sidParentMap["MyRegModel_Simulink:23"] = "MyRegModel_Simulink:20";
    this.sidParentMap["MyRegModel_Simulink:24"] = "MyRegModel_Simulink:20";
    this.sidParentMap["MyRegModel_Simulink:25"] = "MyRegModel_Simulink:20";
    this.sidParentMap["MyRegModel_Simulink:16"] = "MyRegModel_Simulink:20";
    this.sidParentMap["MyRegModel_Simulink:27"] = "MyRegModel_Simulink:20";
    this.sidParentMap["MyRegModel_Simulink:10"] = "MyRegModel_Simulink:20";
    this.sidParentMap["MyRegModel_Simulink:11"] = "MyRegModel_Simulink:20";
    this.sidParentMap["MyRegModel_Simulink:12"] = "MyRegModel_Simulink:20";
    this.sidParentMap["MyRegModel_Simulink:13"] = "MyRegModel_Simulink:20";
    this.sidParentMap["MyRegModel_Simulink:14"] = "MyRegModel_Simulink:20";
    this.sidParentMap["MyRegModel_Simulink:26"] = "MyRegModel_Simulink:20";
    this.getParentSid = function(sid) { return this.sidParentMap[sid];}
}
    RTW_SidParentMap.instance = new RTW_SidParentMap();
