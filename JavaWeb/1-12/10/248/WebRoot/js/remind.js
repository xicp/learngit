 /*  
 *    消息构造  
 */  
function PopBubble(width,height,title,content,foot){  
    this.content  = content;  				//提示内容
    this.title= title; 			 			//提示标题
	this.foot= foot; 						//页脚内容  
    this.width    = width?width:307;  		//设置弹出窗口的宽度
    this.height = height?height:170;  		//设置弹出窗口的高度
    this.timeout= 300;						//设置窗口的停留时间
    this.speed    = 10; 					//设置窗口的弹出速度 
    this.step    = 1; 						//设置窗口的弹出步幅
    this.right    = screen.width -1;  		//设置窗口右边的位置
    this.bottom = screen.height; 			//设置窗口底边的位置
    this.left    = this.right - this.width; 	//设置窗口左边的位置
    this.top    = this.bottom - this.height; 	//设置窗口顶边的位置
    this.timer    = 0; 							//计时器
    this.pause    = false;						//标记是否停止收缩
    this.close    = false;						//标记是否关闭
    this.autoHide    = true;					//标记是否自动收缩
}  
  
//收缩弹出窗口的方法  
PopBubble.prototype.hide = function(){  
		//设置弹出窗口的高度
        var offset  = this.height>this.bottom-this.top?this.height:this.bottom-this.top; 
        var obj  = this;  
        if(this.timer>0){   
            window.clearInterval(obj.timer);  
        }  
 
        var fun = function(){  
            if(obj.pause==false||obj.close){	//判断是否弹出窗口
                var x  = obj.left; 				//获取窗口左边框的位置
                var y  = 0; 
                var width = obj.width; 			//获取窗口的宽度
				//获取窗口的高度
                var height = 0; 
                if(obj.offset>0){ 
                    height = obj.offset; 
                } 
     
                y  = obj.bottom - height; 		//获取窗口顶边框的位置
     
                if(y>=obj.bottom){ 
                    window.clearInterval(obj.timer);  
                    obj.Pop.hide(); 			//收缩窗口 
                } else { 
                    obj.offset = obj.offset - obj.step;  
                } 
                obj.Pop.show(x,y,width,height);  //弹出窗口  
            }             
        }  
 
        this.timer = window.setInterval(fun,this.speed);     
    
}  
//显示弹出窗口的方法
PopBubble.prototype.show = function(){  
	//创建一个顶层窗口对象，该对象只有在IE5.5及以上版本的浏览器才能使用
    var oPopup = window.createPopup();   
    this.Pop = oPopup;  
    var w = this.width;  
    var h = this.height;  
    this.offset  = 0; 
	 
   var str = "<div style='border:#1D84D3 2px solid;z-index: 99999; left: 0px; width: " + w + "px; position: absolute; top: 0px; height: " + h + "px;'>"  
        str += "<table style='background-image:url(images/pop_title.jpg);background-repeat:no-repeat;  cellSpacing=0 cellPadding=0 width='100%' border=0>"  
        str += "<tr>"  
        str += "<td width=30 height=33></td>"  
        str += "<td style='padding-left: 4px; font-weight: normal; font-size: 12px; color: #331C09; padding-top: 4px' vAlign=center width='100%'>" + this.title + "</td>"  
        str += "<td style='padding-right: 2px;' valign=center align=right width=19>"  
        str += "<span title=关闭  style='font-weight: bold; font-size:12px; cursor: hand; color: #FFFFFF; margin-right: 4px;' id='btn_Close' >×</span></td>"  
        str += "</tr>"  
        str += "<tr>"  
        str += "<td style='padding: 1px' colSpan=3 height=" + (h-28) + ">"  
        str += "<div style='background-color: #fefff1;padding: 8px;  font-size: 12px;  width: 100%; height: 100%'><a href='javascript:void(0)' hidefocus=true id='aLink' style='color:#990000'>" + this.content + "</a><br><br>"  
		str += "<div style='word-break: break-all' align='right' style='color:#6C6B68'>" + this.foot +
		"<embed id='soundControl' src='images/Windows.wav' mastersound hidden='true' loop='0' autostart='true'></embed>"+ "</div>" 
        str += "</div>"  
        str += "</td>"  
        str += "</tr>"  
        str += "</table>"  
        str += "</div>"  
	//将设置好的div 添加到顶层窗口的body中  
    oPopup.document.body.innerHTML = str; 
    
  

    var obj  = this;  
	//添加顶层窗口的鼠标悬停事件，在事件中设置窗口不收缩
    oPopup.document.body.onmouseover = function(){obj.pause=true;}
	//添加顶层窗口的鼠标移除事件，在事件中设置窗口收缩
    oPopup.document.body.onmouseout = function(){obj.pause=false;}

    var fun = function(){  
        var x  = obj.left; 				//获取窗口左边框的位置
        var y  = 0; 
        var width    = obj.width; 		//获取窗口的宽度
		//获取窗口的高度
        var height    = obj.height; 	
            if(obj.offset>obj.height){ 
                height = obj.height; 
            } else { 
                height = obj.offset; 
            } 
 		//获取窗口顶边框的位置
        y  = obj.bottom - obj.offset; 
        if(y<=obj.top){ 
            obj.timeout--; 
            if(obj.timeout==0){ 
                window.clearInterval(obj.timer);  
                if(obj.autoHide){
                    obj.hide(); 		//收缩窗口
                }
            } 
        } else { 
            obj.offset = obj.offset + obj.step; 
        } 
        obj.Pop.show(x,y,width,height);    //弹出窗口
 
    }  
    this.timer = window.setInterval(fun,this.speed)  //间隔speed时间调用fun函数弹出窗口    
//单击“关闭”按钮时执行的操作
oPopup.document.getElementById("btn_Close").onclick = function(){  
    	var url="BbsServlet";											//服务器地址
    	var param ="action=changeFlag&id="+bbsid+"&nocache=" + new Date().getTime();	//请求参数 
    	request=httpRequest("post",url,true,callback1,param);	//调用请求方法 
        obj.close = true;
        obj.hide();  	//收缩窗口
}  
  	//单击超链接时执行的操作
oPopup.document.getElementById("aLink").onclick = function(){  
        obj.oncommand();  //调用oncommand函数打开查看超链接详细信息的窗口
}    
}  
function callback1(){}
//设置弹出窗口的左边、右边、顶边和底边框的位置
PopBubble.prototype.box = function(left,right,top,bottom){ 
    try { 
        this.left = left !=null?left:this.right-this.width; 
        this.right = right!=null?right:this.left +this.width; 
        this.bottom  = bottom!=null?(bottom>screen.height?screen.height:bottom):screen.height; 
        this.top = top !=null?top:this.bottom - this.height; 
    } catch(e){} 
} 
  
