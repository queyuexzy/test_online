/**
 * 设置iframe的高度,让其自适应
 */
function TuneHeight() {
	var frm = document.getElementById("topFrame");
	var subWeb = document.frames ? document.frames["topFrame"].document : frm.contentDocument;
	if (frm != null && subWeb != null) {
		frm.height = subWeb.body.scrollHeight;
	}
}
String.prototype.Trim = function() {

	return this.replace(/(^\s*)|(\s*$)/g, "");
};

/**
 * 把长度大于len的字符串 截断成 span
 * 
 * @param len
 * @returns {String}
 */
String.prototype.formatStrLength = function(len) {
	var result = this;
	if (result.length > len) {
		result = "<span title='" + this + "'>";
		result += this.substring(0, len) + "...";
		result += "</span>";
	}
	return result;
};

function getlength(strTemp) {

	var i, unLen, bLen;
	var str;
	str = strTemp;// 获得当前域的值

	unLen = str.length;
	bLen = str.length;
	for (i = 0; i < unLen; i++) {
		if (str.charCodeAt(i) > 255)
			bLen++;
	}

	return bLen;

}
/**
 * 是不是数字
 */
function isNumber(text) {
	var newPar = /^\d+$/;
	if (!newPar.test(text)) {
		return false;
	} else {
		return true;
	}
}
/**
 * 判断是不是float类型
 */
function isFloat(text){
    var reg=/^[0-9]*\.?[0-9]*$/;
    if(!reg.test(text)){
    	return false;
    }else{
    	return true;
    }
  }
function isChineseWord(text) {
	var newPar = /^[\x00-\xff]+$/;
	if (newPar.test(text)) {
		return false;
	} else {
		return true;
	}
}
function isPunctuation(text) {
	var newPar = /^[0-9a-zA-Z\u4E00-\u9FA5]+$/;
	if (!newPar.test(text)) {
		return false;
	} else {
		return true;
	}
}
function isEnglishWord(text) {
	var newPar = /^[a-zA-Z]+$/;
	if (!newPar.test(text)) {
		return false;
	} else {
		return true;
	}
}

/**
 * 校验是否为邮箱
 * 
 * @param text
 * @returns {Boolean}
 */
function isEmail(text) {
	var newPar = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
	if (!newPar.test(text)) {
		return false;
	} else {
		return true;
	}
}

function keyDownAction(method, ascCode) {
	if (ascCode == 13) {
		eval(method);
		return false;
	}
	return true;
}

/*
 * Pop up a div to show the tip in the specified time.
 */
function popUp(tip, time) {
	if(time==null||time==undefined){
		time  = 1000;
	}
	var randId = "setup"+parseInt(Math.random()*10000000000);
	
	$("body").append("<div id='"+randId+"'/>");
	var showSetupDiv = $("#"+randId);
	showSetupDiv.attr("style", "top:-90;background-color:#ffffff;" +
			"left:0;border:1px #cccccc solid; position:absolute; z-index:2000; " +
			"display:none;text-align: center;height: 80px; width: 150px;");
	showSetupDiv.append("<div class=\"popup_title\"><h3 style=\"font-size: 12px;color:#ffffff;\">系 统 提 示</h3></div>");
	showSetupDiv.append("<p style=\"padding-top: 15px\" align=\"center\">"+tip+"</p>");
	
	var width = $(document).width();
	var height = $(document).height();
	var myheigth = $(window).height();
	var left = (width - parseInt(showSetupDiv.width())) / 2;
	var top = (myheigth - parseInt(showSetupDiv.height())) / 2 + $(window).scrollTop();
	top = 0;
	showSetupDiv.css("top", top);
	showSetupDiv.css("left", left);
	showSetupDiv.show();
	showSetupDiv.animate({opacity:0.1,top:-90},0);
	showSetupDiv.animate({
		top: [0,"easeOutExpo"],
		opacity : 1
	}, time/2);
	showSetupDiv.animate({
		top: [top-100,"easeInOutBack"],
		opacity : 0.1
	}, time/2,function(){
		showSetupDiv.remove();
	});
}

function showWaitDiv(state) {
	if (state) {
		$("body").append("<iframe id='waitIframe' />");
		$("body").append("<div id='apdiv'/>");
		var width = $(document).width();
		var height = $(document).height();
		var myheigth = $(window).height();
		
		var showSetupIframe = $("#waitIframe");
		showSetupIframe.attr("style", "top:0;background-color:#cccccc;left:0;border:none; position:absolute; z-index:499; display:none;");
		
		var showSetupDiv = $("#apdiv");
		showSetupDiv.attr("style", "top:0;background-color:#FFFFFF;" +
				"left:0;border:1px #cccccc solid; position:absolute; z-index:599; " +
				"display:none;text-align: center;height: 200px; width: 300px;" +
				"");
		showSetupDiv.append("<div style='height:45px;width:100%;line-height:45px;background-color:#f3f9ff;border-bottom:1px solid #d9e6f0;text-align: center;'><h3>系统提示</h3></div>");
		showSetupDiv.append("<p><img style='padding-top:50px' src='../style/images/loading.gif' /></p>");
		showSetupDiv.append("<p align=\"center\">正在执行，请稍等...</p>");
		
		showSetupIframe.height(height);
		showSetupIframe.width(width);
		showSetupIframe.show();
		showSetupIframe.animate({
			opacity : 0.68
		}, 0);
		
		var left = (width - parseInt(showSetupDiv.width())) / 2;
		var top = (myheigth - parseInt(showSetupDiv.height())) / 2 + $(window).scrollTop();
		
		showSetupDiv.css("top", top);
		showSetupDiv.css("left", left);
		showSetupDiv.show();
		
		
		
	} else {
		var showSetupIframe = $("#waitIframe");
		var showSetupDiv = $("#apdiv");
		
		showSetupDiv.hide();
		showSetupIframe.hide();
		showSetupIframe.remove();
		showSetupDiv.remove();
	}
}

function showCustomDiv(state, myDiv, type, isClose) {
	if (state) {
		var width = $(document).width();
		var height = $(document).height();
		var mywidth = $(window).width();
		var myheigth = $(window).height();
		$("body").append("<div id='boxDiv' />");
		$("body").append("<iframe id='boxFrame' />");
		var showSetupIframe = $("#boxFrame");

		var box = $("#boxDiv");
		box.attr("style", "top:0; left:0;border:none; position:absolute; z-index:500; display:none;");
		showSetupIframe.attr("style", "top:0;background-color:#cccccc;left:0;border:none; position:absolute; z-index:499; display:none;");
		box.animate({
			opacity : 0
		}, 0);
		showSetupIframe.animate({
			opacity : 0.68
		}, 0);
		if (isClose) {
			box.click(function() {
				showCustomDiv(0, myDiv, type, 0);
			});
		}

		var showSetupDiv = $("#" + myDiv);
		showSetupIframe.show();
		showSetupIframe.height(height);
		showSetupIframe.width(width);

		box.show();
		box.height(height);
		box.width(width);

		var left = (mywidth - parseInt(showSetupDiv.width())) / 2;
		var top = (myheigth - parseInt(showSetupDiv.height())) / 2 + $(window).scrollTop();
		
		if(top<10){
			top=10;
		}
		
		showSetupDiv.css("top", top);
		showSetupDiv.css("left", left);
		showSetupDiv.show();
	} else {
		var showSetupIframe = $("#boxFrame");
		var box = $("#boxDiv");

		var showSetupDiv = $("#" + myDiv);
		if (type == 1) {
			showSetupDiv.hide();
			showSetupIframe.hide();
		} else {
			showSetupDiv.fadeOut("slow");
			showSetupIframe.fadeOut("slow");
		}
		box.unbind("click");
		box.attr("onclick","");
		box.remove();
		showSetupIframe.remove();
	}
}
function showRelativeDiv(state, relativeId, divId, offleft, offtop, type) {
	if (offleft == undefined) {
		offleft = 0;
	}
	if (offtop == undefined) {
		offtop = 0;
	}
	var showSetupDiv = $("#" + divId);
	if (state) {
		
		var width = $(document).width();
		var height = $(document).height();
		$("body").append("<div id='passwordIframe' />");
		var myIframe = $("#passwordIframe");
		myIframe.attr("style", "top:0; left:0;border:none; position:absolute; z-index:500; display:none;");
		myIframe.animate({
			opacity : 0
		}, 0);
		myIframe.click(function() {
			showRelativeDiv(0, relativeId, divId, offleft, offtop);
		});
		myIframe.show();
		myIframe.height(height);
		myIframe.width(width);

		var left = $("#" + relativeId).offset().left;
		var top = $("#" + relativeId).offset().top;
		showSetupDiv.css("top", top + offtop);
		showSetupDiv.css("left", left + offleft);
		showSetupDiv.fadeIn("slow");
	} else {
		var myIframe = $("#passwordIframe");
		myIframe.unbind("click");
		myIframe.remove();
		if (type == 1) {
			showSetupDiv.fadeOut("slow");
		} else {
			showSetupDiv.hide();
		}

	}
}
function showRelativeDivNoFrame(state, relativeId, divId, offleft, offtop) {
	if (offleft == undefined) {
		offleft = 0;
	}
	if (offtop == undefined) {
		offtop = 0;
	}
	var showSetupDiv = $("#" + divId);
	var width = $(document).width();
	var height = $(document).height();
	
	if (state) {
		var left = $("#" + relativeId).offset().left;
		var top = $("#" + relativeId).offset().top;
		showSetupDiv.css("top", top + offtop);
		showSetupDiv.css("left", left + offleft);
		showSetupDiv.show();
	} else {
		showSetupDiv.hide();
	}
		
}
function encodeText(text) {
	if (text != null && text != "") {
		return encodeURIComponent(text);
	} else {
		return null;
	}
}
function decodeText(text){
	if (text != null && text != "") {
		return decodeURIComponent(text);
	} else {
		return null;
	}
}

function ckDigital(event) {
	// style="ime-mode:disabled" 禁用输入法
	// onparse="return false;"禁用粘贴
	// onkeyup="value=value.replace(/[^\d/.]/g,'')" 只输入数字
	var keycode = event.keyCode || event.charCode; // 火狐的是charCode
	if ((keycode < 48 || keycode > 57)) // 判断是否为数字
		event.preventDefault();
	return false;
}
function getDate(strDate) {
    var st = strDate;
    var a = st.split(" ");
    var b = a[0].split("-");
    var c = a[1].split(":");
    var date = new Date(b[0], b[1], b[2], c[0], c[1], c[2]);
    return date;
}

//对Date的扩展，将 Date 转化为指定格式的String 
//月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
//年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
//例子： 
//(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
//(new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18 
Date.prototype.Format = function(fmt) 
{ //author: meizz 
var o = { 
 "M+" : this.getMonth()+1,                 //月份 
 "d+" : this.getDate(),                    //日 
 "h+" : this.getHours(),                   //小时 
 "m+" : this.getMinutes(),                 //分 
 "s+" : this.getSeconds(),                 //秒 
 "q+" : Math.floor((this.getMonth()+3)/3), //季度 
 "S"  : this.getMilliseconds()             //毫秒 
}; 
if(/(y+)/.test(fmt)) 
 fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
for(var k in o) 
 if(new RegExp("("+ k +")").test(fmt)) 
fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length))); 
return fmt; 
}