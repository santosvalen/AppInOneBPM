<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_CUSTOM_CATEBANNERManage.aspx.cs" Inherits="WEC_CUSTOM_CATEBANNERManage" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
        manager.initFindDL();
        //manager.initPageSizeEvt("txtPageNum");
        bindWinResize(40);
        $("#display_search").click(function () {
            $(".topfind").toggleClass("hide");   if($("#display_search").val()=="��ʾ��ѯ")$("#display_search").val("���ز�ѯ");else $("#display_search").val("��ʾ��ѯ"); 
        });
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfind hide"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
         
            <dl colname="WEC_CUSTOM_CATEBANNER.ID" class="hide">
               <dt><%=WEC_CUSTOM_CATEBANNER.Attribute.ID.ZhName %>��</dt><!--���-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_CUSTOM_CATEBANNER.AID" class="hide">
               <dt><%=WEC_CUSTOM_CATEBANNER.Attribute.AID.ZhName %>��</dt><!--���ںű��-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_CUSTOM_CATEBANNER.PIC_URL" class="hide">
               <dt><%=WEC_CUSTOM_CATEBANNER.Attribute.PIC_URL.ZhName %>��</dt><!--ͼƬ��ַ-->
               <dd><span>
               
                    <input id="txtPIC_URL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_CUSTOM_CATEBANNER.OUT_URL">
               <dt><%=WEC_CUSTOM_CATEBANNER.Attribute.OUT_URL.ZhName %>��</dt><!--���ӵ�ַ-->
               <dd><span>
               
                    <input id="txtOUT_URL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_CUSTOM_CATEBANNER.SORT_ID" class="hide">
               <dt><%=WEC_CUSTOM_CATEBANNER.Attribute.SORT_ID.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtSORT_ID" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_CUSTOM_CATEBANNER.STATUS">
               <dt><%=WEC_CUSTOM_CATEBANNER.Attribute.STATUS.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_CUSTOM_CATEBANNER.ADDTIME">
               <dt><%=WEC_CUSTOM_CATEBANNER.Attribute.ADDTIME.ZhName %>��</dt><!--����ʱ��-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         <dl class="btn"><dd>
                <span><asp:Button ID="btnFind" runat="server" Text="��ѯ" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="���" onclick="_topFindClear(this);"/></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul>
            <li><span><input power="newWEC_CUSTOM_CATEBANNER" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('WEC_CUSTOM_CATEBANNEREdit.aspx?aid=<%=aid%>','','1',900,700);" /></span></li>
            <li><span><input power="editWEC_CUSTOM_CATEBANNER" id="btn_Edit" type="button" value="�༭" onclick="manager.editRecord('WEC_CUSTOM_CATEBANNEREdit.aspx?aid=<%=aid%>','','1',900,700);" /></span></li>
<%--            <li><span class="btn"><input power="newWEC_CUSTOM_CATEBANNER" id="btn_NewSub" type="button" value="�½��¼�" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('WEC_CUSTOM_CATEBANNERBack.aspx?aid=<%=aid%>');" /></span></li>
            <li><span><input type="button" value="��ʾ��ѯ" id="display_search"/></span></li>
        </ul>
        <ol>
            <li><b>ÿҳ��ʾ</b></li>
            <li><input id="txtPageSize" type="text" runat="server" style="width:25px;" /><b>��</b></li>
            <li><span><asp:Button ID="Button4" runat="server" Text="����" OnClick="btnSetPageSize_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">������</a><ol id="ol1"></ol></li>
        </ol>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%-- <td><a href="Manage.aspx" id="a_top" runat="server"><b>����</b></a></td>--%>
                    
                    
                   <%-- <td data="{colname:'<%=WEC_CUSTOM_CATEBANNER.Attribute.ID.LongName%>',show:1}"><%=WEC_CUSTOM_CATEBANNER.Attribute.ID._ZhName %></td><!--���-->
                    
                    
                    <td data="{colname:'<%=WEC_CUSTOM_CATEBANNER.Attribute.AID.LongName%>',show:1}"><%=WEC_CUSTOM_CATEBANNER.Attribute.AID._ZhName %></td><!--���ںű��-->--%>
                    
                    
                    <td data="{colname:'<%=WEC_CUSTOM_CATEBANNER.Attribute.PIC_URL.LongName%>',show:1}"><%=WEC_CUSTOM_CATEBANNER.Attribute.PIC_URL._ZhName %></td><!--ͼƬ��ַ-->
                    
                    
                    <td data="{colname:'<%=WEC_CUSTOM_CATEBANNER.Attribute.OUT_URL.LongName%>',show:1}"><%=WEC_CUSTOM_CATEBANNER.Attribute.OUT_URL._ZhName %></td><!--���ӵ�ַ-->
                    
                    
                    <td data="{colname:'<%=WEC_CUSTOM_CATEBANNER.Attribute.SORT_ID.LongName%>',show:1}"><%=WEC_CUSTOM_CATEBANNER.Attribute.SORT_ID._ZhName %></td><!--����-->
                    
                    
                    <td data="{colname:'<%=WEC_CUSTOM_CATEBANNER.Attribute.STATUS.LongName%>',show:1}"><%=WEC_CUSTOM_CATEBANNER.Attribute.STATUS._ZhName %></td><!--״̬-->
                    
                    
                    <td data="{colname:'<%=WEC_CUSTOM_CATEBANNER.Attribute.ADDTIME.LongName%>',show:1}"><%=WEC_CUSTOM_CATEBANNER.Attribute.ADDTIME._ZhName %></td><!--����ʱ��-->
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((WEC_CUSTOM_CATEBANNER)Container.DataItem).ID%>" /></td>
                   <%-- <td><%#showLeftLinks(((WEC_CUSTOM_CATEBANNER)Container.DataItem).PATH, ((WEC_CUSTOM_CATEBANNER)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                <%--    <td><%#((WEC_CUSTOM_CATEBANNER)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_CUSTOM_CATEBANNER)Container.DataItem).AID %></td>--%>
                    
                    
                    <td><img src="<%#((WEC_CUSTOM_CATEBANNER)Container.DataItem).PIC_URL %>" style="width:50px;height:50px;"/></td>
                    
                    
                    <td><%#((WEC_CUSTOM_CATEBANNER)Container.DataItem).OUT_URL %></td>
                    
                    
                    <td><%#((WEC_CUSTOM_CATEBANNER)Container.DataItem).SORT_ID %></td>
                    
                    
                    <td><%#FormHelper.GetText(WEC_CUSTOM_CATEBANNER.Attribute.STATUS, ((WEC_CUSTOM_CATEBANNER)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#(((WEC_CUSTOM_CATEBANNER)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((WEC_CUSTOM_CATEBANNER)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
    <div class="path-url hide">
        <strong>��ǰ·����</strong><asp:Literal ID="litPathLink" runat="server"></asp:Literal>
    </div>
    <div class="pages">
        <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
    </div>
</div>
</asp:Content>