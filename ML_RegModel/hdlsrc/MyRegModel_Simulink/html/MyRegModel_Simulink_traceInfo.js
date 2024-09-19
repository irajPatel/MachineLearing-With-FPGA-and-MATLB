function RTW_Sid2UrlHash() {
	this.urlHashMap = new Array();
	/* <S1>/Add */
	this.urlHashMap["MyRegModel_Simulink:16"] = "LinearRegModel.v:119,120,121,122";
	/* <S1>/Constant */
	this.urlHashMap["MyRegModel_Simulink:27"] = "LinearRegModel.v:116";
	/* <S1>/Gain */
	this.urlHashMap["MyRegModel_Simulink:10"] = "LinearRegModel.v:76";
	/* <S1>/Gain1 */
	this.urlHashMap["MyRegModel_Simulink:11"] = "LinearRegModel.v:86";
	/* <S1>/Gain2 */
	this.urlHashMap["MyRegModel_Simulink:12"] = "LinearRegModel.v:96";
	/* <S1>/Gain3 */
	this.urlHashMap["MyRegModel_Simulink:13"] = "LinearRegModel.v:106";
	/* <S1>/Gain4 */
	this.urlHashMap["MyRegModel_Simulink:14"] = "LinearRegModel.v:73";
	this.getUrlHash = function(sid) { return this.urlHashMap[sid];}
}
RTW_Sid2UrlHash.instance = new RTW_Sid2UrlHash();
function RTW_rtwnameSIDMap() {
	this.rtwnameHashMap = new Array();
	this.sidHashMap = new Array();
	this.rtwnameHashMap["<Root>"] = {sid: "MyRegModel_Simulink"};
	this.sidHashMap["MyRegModel_Simulink"] = {rtwname: "<Root>"};
	this.rtwnameHashMap["<S1>/In1"] = {sid: "MyRegModel_Simulink:21"};
	this.sidHashMap["MyRegModel_Simulink:21"] = {rtwname: "<S1>/In1"};
	this.rtwnameHashMap["<S1>/In2"] = {sid: "MyRegModel_Simulink:22"};
	this.sidHashMap["MyRegModel_Simulink:22"] = {rtwname: "<S1>/In2"};
	this.rtwnameHashMap["<S1>/In3"] = {sid: "MyRegModel_Simulink:23"};
	this.sidHashMap["MyRegModel_Simulink:23"] = {rtwname: "<S1>/In3"};
	this.rtwnameHashMap["<S1>/In4"] = {sid: "MyRegModel_Simulink:24"};
	this.sidHashMap["MyRegModel_Simulink:24"] = {rtwname: "<S1>/In4"};
	this.rtwnameHashMap["<S1>/In5"] = {sid: "MyRegModel_Simulink:25"};
	this.sidHashMap["MyRegModel_Simulink:25"] = {rtwname: "<S1>/In5"};
	this.rtwnameHashMap["<S1>/Add"] = {sid: "MyRegModel_Simulink:16"};
	this.sidHashMap["MyRegModel_Simulink:16"] = {rtwname: "<S1>/Add"};
	this.rtwnameHashMap["<S1>/Constant"] = {sid: "MyRegModel_Simulink:27"};
	this.sidHashMap["MyRegModel_Simulink:27"] = {rtwname: "<S1>/Constant"};
	this.rtwnameHashMap["<S1>/Gain"] = {sid: "MyRegModel_Simulink:10"};
	this.sidHashMap["MyRegModel_Simulink:10"] = {rtwname: "<S1>/Gain"};
	this.rtwnameHashMap["<S1>/Gain1"] = {sid: "MyRegModel_Simulink:11"};
	this.sidHashMap["MyRegModel_Simulink:11"] = {rtwname: "<S1>/Gain1"};
	this.rtwnameHashMap["<S1>/Gain2"] = {sid: "MyRegModel_Simulink:12"};
	this.sidHashMap["MyRegModel_Simulink:12"] = {rtwname: "<S1>/Gain2"};
	this.rtwnameHashMap["<S1>/Gain3"] = {sid: "MyRegModel_Simulink:13"};
	this.sidHashMap["MyRegModel_Simulink:13"] = {rtwname: "<S1>/Gain3"};
	this.rtwnameHashMap["<S1>/Gain4"] = {sid: "MyRegModel_Simulink:14"};
	this.sidHashMap["MyRegModel_Simulink:14"] = {rtwname: "<S1>/Gain4"};
	this.rtwnameHashMap["<S1>/ypre_simulink"] = {sid: "MyRegModel_Simulink:26"};
	this.sidHashMap["MyRegModel_Simulink:26"] = {rtwname: "<S1>/ypre_simulink"};
	this.getSID = function(rtwname) { return this.rtwnameHashMap[rtwname];}
	this.getRtwname = function(sid) { return this.sidHashMap[sid];}
}
RTW_rtwnameSIDMap.instance = new RTW_rtwnameSIDMap();
