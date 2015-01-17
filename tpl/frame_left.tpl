<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<link href="css/left.css" type="text/css" rel="stylesheet" />

	<script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		var i;
		$(".content").hide();
		$(".upa").next().hide();
		
		$(".upa").click(function(){
			if($(this).next().is(":hidden")){  
				$(this).next().show(300);
			}else{
				$(this).next().hide(300);
			}	
		});

		$(".typeshouqi").click(function(){       
			if($(".content").is(":hidden")){  	    
				$(".content").show(300);	 
				$("#shouqivalue").html("收起所有栏目");
			}else{		   
				$(".content").hide(300);
				$("#shouqivalue").html("展开所有栏目");		   
			}
		}); 
		
		$(".type").click(function(){
			if($(this).next().is(":hidden")){	
				$(this).next().show(300);
			}else{
				$(this).next().hide(300);
			}
		});    
	});
	
	function switch_click(){  
		if(parent.mainFrame.cols=="203,*"){
			parent.mainFrame.cols="10,*";
			document.getElementById("ImgArrow").src="images/switch_right.gif";
			document.getElementById("mmmsss").style.display="none";	   
		}else{
			parent.mainFrame.cols="203,*"
			document.getElementById("ImgArrow").src="images/switch_left.gif";
			document.getElementById("mmmsss").style.display="block";
		}
	} 
	</script>
</head>
<body scroll="no">
	<div id="mmmsss">
		<table width="193" height="100%" border="0" id="shenqida" cellpadding="0" cellspacing="0" style="background:url(images/left_bg.gif) repeat-y center; margin:0; padding:0; float:left;">
			<tr>
				<td width="193" valign="top">
					<div id="container">
						{#foreach key=x item=itm1 from=$rowLevel1#}
						<h1 class="type" id="tt{#$x#}"><a href="#">{#$rowLevel1[$x].title_name#}</a></h1>
						{#if $rowLevel1[$x].child>0#}
						<div class="content" id="ttss{#$x#}">
							<ul class="MM">
								{#foreach key=y item=itm2 from=$rowLevel2#}
								{#if $rowLevel2[$y].up_id == $rowLevel1[$x].title_id#}
								{#if $rowLevel2[$y].child>0#}
								<li class="upa"><a href="#">{#$rowLevel2[$y].title_name#}</a></li>
								<li style="height:auto; background:none" class="ulli" id="tsa">
									<ul>
										{#foreach key=z item=itm3 from=$rowLevel3#}
										{#if $rowLevel3[$z].up_id == $rowLevel2[$y].title_id#}
										<li><a href="index.php?{#$rowLevel3[$z].url#}" target="main">{#$rowLevel3[$z].title_name#}</a></li>
										{#/if#}
										{#/foreach#}
									</ul>
								</li>
								{#else#}
								<li><a href="index.php?{#$rowLevel2[$y].url#}" target="main">{#$rowLevel2[$y].title_name#}</a></li>
								{#/if#}
								{#/if#}
								{#/foreach#}
							</ul>
						</div>
						{#/if#}
						{#/foreach#}
						<h1 class="typeshouqi"><a href="#" id="shouqivalue">收起所有栏目</a></h1>		
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div style=" float:left;  width:5px; height:100%; margin:0 auto; padding:0; position:relative; vertical-align:middle; line-height:100%">
		<p style="top:49%; position:absolute;" id="aamss">
			<img src="images/switch_left.gif" id="ImgArrow" width="7" style="cursor: pointer"  onClick="switch_click();">
		</p>
	</div>
</body>
</html>