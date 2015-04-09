<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div style="pading-top:0px;" class="page">
<s:hidden name="queryBean._pageNow" id="pageNow"/>
<s:hidden name="queryBean._pageSize"/>
<span style="float: left;">
共 <strong><s:property value="queryBean._sumCount"/></strong> 条 
 <strong><s:property value="queryBean._pageTotal"/></strong> 页
</span>
<span style="float: right; padding-right: 50px;">
		 					<a href="#" id="firstPage" onclick="javascript:jumpPage('f')"> 首页</a>
		 					<a href="#" id="upPage" onclick="javascript:jumpPage('u')">上一页</a>
		 					
		 					 <strong><s:property value="queryBean._pageNow"/></strong>
		 					
		 					<s:if test="queryBean._pageNow<queryBean._pageTotal">
			 					<a href="#" id="nextPage" onclick="javascript:jumpPage('n')">下一页</a>
			 					<a href="#" id="endPage" onclick="javascript:jumpPage('e')"> 尾页</a>
		 					</s:if> 
		 					<s:property value="queryBean._pageSize"/>条/页
		 					转到：<input type="text" name="goPage" id="goPage" style="width: 40px;" onkeyup="value=value.replace(/[^\d]/g,'')"/>
		 					<input type="button" value="GO" onclick="javascript:jumpPage('g')"/>
		 				</span>
</div>
		 				<script type="text/javascript">
		 				var _pageSize = <s:property value="queryBean._pageSize"/>;
		 				var _pageNow =  <s:property value="queryBean._pageNow"/>;
		 				var _sumCount = <s:property value="queryBean._sumCount"/>;
						var _sumPage = <s:property value="queryBean._pageTotal"/>;
		 				$(document).ready(function(){
			 				if(_pageNow>1){
				 				$("#upPage").show();
				 				$("#firstPage").show();
				 			}else{
				 				$("#upPage").hide();
				 				$("#firstPage").hide();
					 		}

					 		if(_pageNow==_sumPage){
				 				$("#nextPage").hide();
				 				$("#endPage").hide();
						 	}else{
				 				$("#nextPage").show();
				 				$("#endPage").show();
							}
			 			});
			 			function jumpPage(flag){
				 			var toPage = 1;
				 			var pageNow = _pageNow;
				 			switch(flag){
				 				case 'f': toPage = 1;break;
				 				case 'u': toPage = _pageNow-1;break;
				 				case 'n': toPage = _pageNow+1;break;
				 				case 'e': toPage = _sumPage;break;
				 				case 'g': 
					 				var goPage = $("#goPage").val();
					 				if(goPage==''){
						 				return;
						 			}
					 				if(parseInt(goPage)>_sumPage){
						 				alert("没那么多数据,共有：" + _sumPage + "页");
						 				 $("#goPage").val('');
						 				return;
						 			}
						 			if(parseInt(goPage)==_pageNow){
						 				$("#goPage").val('');
						 				return;
							 		}
					 				toPage = parseInt(goPage);
					 				break;
					 		}
					 		var form = $(document.forms[0]);
					 		$("#pageNow").val(toPage);
					 		try{
					 			showCustomDiv(true,"apdiv","waitIframe",0);
					 		}catch(e){
					 		}
					 		form.submit();
				 		}
		 				</script>