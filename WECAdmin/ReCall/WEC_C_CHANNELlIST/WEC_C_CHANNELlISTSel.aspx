<%@ Page Title="�û�ѡ��" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_C_CHANNELlISTSel.aspx.cs" Inherits="WEC_C_CHANNELlISTSel" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <base target="_self" />
    <script type="text/javascript">
    var manager = new ListManager({ listCID: "tblist" });
    $(function () {
        manager.initBodyRows(); Sel_Load();
    });

    function selThis_B(tds) {
        var tdObj = $(tds[0]);
        var aObj = tdObj.find("a");
        if (aObj.length > 0) {
            _selERR = "����ѡ�����ӽڵ�����ݣ�";
            _selOK = false;
        }
    }
    function selOK_B(id) {
        //alert(id);
        $("input[id$='hidSelID']").val(id);
        //alert($("input[id$='hidSelID']").val());
        __doPostBack("ctl00$cphBody$LinkButton1", "");
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCondition" type="hidden" runat="server" />
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
  <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
      <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click"></asp:LinkButton><input id="hidSelID" runat="server" type="hidden" />
  </div>
   <div class="topfind"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
         
            <dl colname="ID">
               <dt><%=WEC_C_CHANNELlIST.Attribute.ID.ZhName %>��</dt><!--���-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="AID">
               <dt><%=WEC_C_CHANNELlIST.Attribute.AID.ZhName %>��</dt><!--���ںű��-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="STATUS">
               <dt><%=WEC_C_CHANNELlIST.Attribute.STATUS.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="ADDTIME">
               <dt><%=WEC_C_CHANNELlIST.Attribute.ADDTIME.ZhName %>��</dt><!--����ʱ��-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="NAME">
               <dt><%=WEC_C_CHANNELlIST.Attribute.NAME.ZhName %>��</dt><!--��������-->
               <dd><span>
               
                    <input id="txtNAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="URL">
               <dt><%=WEC_C_CHANNELlIST.Attribute.URL.ZhName %>��</dt><!--����url-->
               <dd><span>
               
                    <textarea id="txtURL" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="REMARK">
               <dt><%=WEC_C_CHANNELlIST.Attribute.REMARK.ZhName %>��</dt><!--������ע-->
               <dd><span>
               
                    <textarea id="txtREMARK" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="CATEGORY_ID">
               <dt><%=WEC_C_CHANNELlIST.Attribute.CATEGORY_ID.ZhName %>��</dt><!--��������-->
               <dd><span>
               
                    <input id="txtCATEGORY_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="QRCODE">
               <dt><%=WEC_C_CHANNELlIST.Attribute.QRCODE.ZhName %>��</dt><!--��ά����ʽ-->
               <dd><span>
               
                    <input id="txtQRCODE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="NOTE">
               <dt><%=WEC_C_CHANNELlIST.Attribute.NOTE.ZhName %>��</dt><!--��ע��Ϣ-->
               <dd><span>
               
                    <textarea id="txtNOTE" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="ADDRESS">
               <dt><%=WEC_C_CHANNELlIST.Attribute.ADDRESS.ZhName %>��</dt><!--�������ڵ���-->
               <dd><span>
               
                    <textarea id="txtADDRESS" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="TYPE">
               <dt><%=WEC_C_CHANNELlIST.Attribute.TYPE.ZhName %>��</dt><!--��������-->
               <dd><span>
               
                    <select id="txtTYPE" runat="server" >
                    </select>
               </span></dd>
        </dl>
         <dl class="btn"><dd>
         <span><asp:Button ID="btn_Find" runat="server" Text="��ѯ" onclick="btnFind_Click" Width="51" /></span>
            <span><input id="btnClear" type="button" value="���" onclick="_topFindClear(this);"  style="width:60px;"/></span>
         </dd></dl>
    </div> 

        <div class="tblist" id="tblist">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.ID._ZhName %></td><!--���-->
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.AID._ZhName %></td><!--���ںű��-->
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.STATUS._ZhName %></td><!--״̬-->
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.ADDTIME._ZhName %></td><!--����ʱ��-->
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.NAME._ZhName %></td><!--��������-->
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.URL._ZhName %></td><!--����url-->
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.REMARK._ZhName %></td><!--������ע-->
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.CATEGORY_ID._ZhName %></td><!--��������-->
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.QRCODE._ZhName %></td><!--��ά����ʽ-->
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.NOTE._ZhName %></td><!--��ע��Ϣ-->
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.ADDRESS._ZhName %></td><!--�������ڵ���-->
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.TYPE._ZhName %></td><!--��������-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).AID %></td>
                    
                    
                    <td><%#FormHelper.GetText(WEC_C_CHANNELlIST.Attribute.STATUS, ((WEC_C_CHANNELlIST)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#(((WEC_C_CHANNELlIST)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((WEC_C_CHANNELlIST)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).NAME %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).URL %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).REMARK %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).CATEGORY_ID %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).QRCODE %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).NOTE %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).ADDRESS %></td>
                    
                    
                    <td><%#FormHelper.GetText(WEC_C_CHANNELlIST.Attribute.TYPE, ((WEC_C_CHANNELlIST)Container.DataItem).TYPE)%></td>
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
           <WebCtrl:AspNetPager ID="aspPager" runat="server" 
         onpagechanged="aspPager_PageChanged">
     </WebCtrl:AspNetPager>
        </div>
</asp:Content>
