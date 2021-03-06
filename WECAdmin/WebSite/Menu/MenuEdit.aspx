﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="MenuEdit.aspx.cs" Inherits="WECAdmin_WebSite_Menu_MenuEdit" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
  <link href="../../../Themes/WEC/bootstrap.min.css" rel="Stylesheet" type="text/css"/>
  <script src="../../../Lib/Bootstrap/bootstrap.min.js"></script>
 <script type="text/javascript">
     $(function () {
         var checker = new formChecker({ btnIDS: 'btnOK,btnSave' });
         changetype()
     });

     function changetype() {
         if ($("#<%=txtMENU_TYPE.ClientID %>").val() == "click") {
             $("#key").removeClass("hide");
             $("#url").addClass("hide");
         }
         else if ($("#<%=txtMENU_TYPE.ClientID %>").val() == "view") {
             $("#key").addClass("hide");
             $("#url").removeClass("hide");
         }
     }
</script>
  <style>
      .alert {
        padding: 8px 35px 8px 10px;
        text-shadow: none;
        -webkit-box-shadow: 0 2px 4px rgba(0,0,0,0.2);
        -moz-box-shadow: 0 2px 4px rgba(0,0,0,0.2);
        box-shadow: 0 2px 4px rgba(0,0,0,0.2);
        background-color: #f9edbe;
        border: 1px solid #f0c36d;
        -webkit-border-radius: 2px;
        -moz-border-radius: 2px;
        border-radius: 2px;
        color: #333;
        text-align:left;
        width:400px;
      }

  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div class="main">
 <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl><!--<font color="red">(注意:若提交后，未发现菜单变化，请重新关注该公众号)</font>-->
 </div>
<div class="warn">
<asp:Label ID="litWarn" runat="server" Text="" Visible="false"></asp:Label>
</div>
<div class="alert alert-warning pull-left">
     <a href="#" class="close" data-dismiss="alert">×</a>
     <h4>注意</h4>
     <p><font color="green">1级菜单最多只能开启3个，2级子菜单最多开启5个!</font></p>
     <p><font color="green">若提交后，未发现菜单变化，请重新关注该公众号</font></p>
    
</div>

<div class="form" id="divForm">
       <div>
        
           <dl class="hide">
               <dt><%=WEC_MENU.Attribute.ID.ZhName %>：</dt><%--编号--%>
               <dd><span>
               <!--文字-->
                    <input id="txtID" type="text" runat="server" ck="{type:0,min:0,max:50,need:0}"/></span>
               </dd>
           </dl>
           <dl  class="hide">
               <dt><%=WEC_MENU.Attribute.PID.ZhName %>：</dt><%--父编号--%>
               <dd><span>
               <!--文字-->
                    <input id="txtPID" type="text" runat="server" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_MENU.Attribute.MENU_NAME.ZhName %>：</dt><%--菜单名称--%>
               <dd><span>
               <!--文字-->
                    <input id="txtMENU_NAME" type="text" runat="server" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>
           <dl  class="hide">
               <dt><%=WEC_MENU.Attribute.AID.ZhName %>：</dt><%--公众号ID--%>
               <dd><span>
               <!--文字-->
                    <input id="txtAID" type="text" runat="server" ck="{type:1,min:0,need:1}"/></span>
               </dd>
           </dl>
           
           <dl >
               <dt><%=WEC_MENU.Attribute.MENU_TYPE.ZhName %>：</dt><%--菜单TYPE--%>
               <dd><span>
               <!--文字-->
                     <select id="txtMENU_TYPE" runat="server"  onchange="changetype()">
                    </select></span>
               </dd>
           </dl>
           <dl id ="key"  class="hide">
               <dt>关键字：</dt><%--菜单KEY--%>
               <dd><span>
               <!--文字-->
                    <select id="txtMENU_KEY" runat="server">
                    </select></span>
               </dd>
           </dl>
           <dl id="url"  class="hide">
               <dt>外链地址：</dt><%--关键词或链接地--%>
               <dd><span>
               
                    <textarea id="txtURL" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{len:500,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_MENU.Attribute.SORT_ID.ZhName %>：</dt><%--排序--%>
               <dd><span>
               <!--文字-->
                    <input id="txtSORT_ID" type="text" runat="server" ck="{type:1,min:0,max:18,need:1}"/></span>
               </dd>
           </dl>
            <dl>
               <dt><%=WEC_MENU.Attribute.STATUS.ZhName %>：</dt><%--状态--%>
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="bottomtool">
      <ul>
    <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="保存并提交"
            onclick="btnOK_Click"/></span></li>

<%--        <li><span class="btn"><asp:Button ID="Button1" runat="server" Text="提交"
        onclick="btnSubmit_Click"/></span></li>--%>
</ul>
   </div>
</div>
</asp:Content>