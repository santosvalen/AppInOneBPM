<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_DEPT_DeptInfoSort2" Title="模块排序" CodeFile="DeptSort.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
function checkValue(me){
    if(me.value!=""){
        if(!/^(\d{1,9}.\d{1,3})|\d{1,9}$/.test(me.value)){
              alert("必须是数字！");
              $(me).addClass("need")
              me.value = "";
              me.focus();
              return false;
        }
    }
}
function beforeSort(){
    var hid=$("#hidSortInfo");
    var txts=$("#tbodylist").find("input");
    var mid="";var val="";
    var info="";
    for(var i=0;i<txts.length;i++){
        mid=txts[i].id.split('_')[1];
        val=txts[i].value;
        if(val==""){
            alert("请输入序号！");
            txts[i].focus();return false;
        }
        if(info!=""){
            info+="|";
        }
        info+=mid+","+val;
    } 
    hid.val(info);
    return true;
}
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main">
<div class="titnav">
  <dl><dt><b>部门序号</b></dt><dd></dd></dl>
    <input id="hidSortInfo" name="hidSortInfo" type="hidden" />
</div>
<div class="tblist">
    <table cellpadding="0" cellspacing="0">
         <thead>
            <tr>
               <td>原序号</td>
               <td>部门名</td>
               <td>新序号</td>
            </tr>
         </thead>
         <tbody id="tbodylist">
               <asp:Repeater ID="repList" runat="server">
                   <ItemTemplate>
                   <tr>
                      <td><%#((HR_DEPT)Container.DataItem).SORT_NO%></td>
                      <td><%#((HR_DEPT)Container.DataItem).DEPT_NAME%></td>
                      <td>
                          <input id='txt_<%#((HR_DEPT)Container.DataItem).DEPT_ID%>' value='<%#((HR_DEPT)Container.DataItem).SORT_NO%>' type="text" style="width:50px;" onblur="return checkValue(this);" /></td>
                   </tr>
                  </ItemTemplate>
              </asp:Repeater>
          </tbody>
      </table>
</div>
<div class="tool">

<p><span><asp:Button ID="btnOK" runat="server" Text="确定" onclick="btnOK_Click" OnClientClick="return beforeSort();"/></span></p>
</div>
</div>
</asp:Content>


