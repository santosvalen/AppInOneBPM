﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SAP_CHART/SAPCHARTBLANK.master" CodeFile="SaleTableChart.aspx.cs" Inherits="SAP_CHART_Sale" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %> 
<%@ Import Namespace="AgileFrame.Common" %> 
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>销售图表</title>
       <script src="js/Production.js"></script>
    <script>
        $(function () {
            $("#month").datetimepicker({
                "language": "zh-CN", "autoclose": 1, format: "yyyy-mm", startView: 3, minView: 3
            });
        });
        </script>
  </asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="body">
    <div class="row">
        <form method="post" runat="server">
             
           <div style="width:800px;">
            <div class="pull-left">
                <span ><label for="vkorg">销售组织</label></span>
                    <input value="<%=vkorg %>" class="form-control" style="width:120px;display:inline;" type="text" id="vkorg" name="vkorg"/>
            </div>
            <div class="pull-left marginLeftAdd2">
           <span ><label for="werk">工厂</label></span>
           <input value="<%=werk %>" class="form-control" style="width:120px;display:inline;" type="text" id="werk" name="werk"/>
             </div>
            <div class="pull-left marginLeftAdd2">
          <span ><label for="month">月份</label></span>
          <input value="<%=month %>" class="form-control" style="width:200px;display:inline;"  id="month" name="month"/>
            </div>
            <div class="pull-left marginLeftAdd2 marginTop27" >
          <asp:Button runat="server" Text="查询" CssClass="btn btn-primary"/>
            </div>
            </div>
        </form>
    </div>
    <% if(IsPostBack){ %>
    <script>
        $(function () {
            //Get context with jQuery - using jQuery's .get() method.
              <% foreach(List<string> datas in dataLists){
                     int index = dataLists.IndexOf(datas);
                     %>
               var ctx = $("#myChart<%=index%>").get(0).getContext("2d");
               //This will get the first returned node in the jQuery collection.
               var myNewChart = new Chart(ctx);

               var data = {
                   labels: [<%=labels%>],
                   datasets: [

                   {
                       label: "<%=lineNames[index][0]%>",
                       fillColor: "rgba(<%=colorList[0]%>,0.5)",
                          strokeColor: "rgba(<%=colorList[0]%>,1)",
                          pointColor: "rgba(<%=colorList[0]%>,1)",
                          pointStrokeColor: "#fff",
                          data: [<%=datas[0]%>]
                      }
                       <% for (int i = 1; i < datas.Count;i++ )
                          {%>
                       ,
                      {
                          label: "<%=lineNames[index][i]%>",
                          fillColor: "rgba(<%=colorList[i%7]%>,0.5)",
                          strokeColor: "rgba(<%=colorList[i%7]%>,1)",
                          pointColor: "rgba(<%=colorList[i%7]%>,1)",
                          pointStrokeColor: "#fff",
                          data: [<%=datas[i%7]%>]
                      }
                      <%}%>
                  ]
           }
               myNewChart.Line(data, {
                   datasetFill: false,
                   animation: false,
                   multiTooltipTemplate: function (obj) {
                       return obj.datasetLabel + " " + obj.value;
                   },
                   scaleLineWidth: 3,
                   scaleLineColor: "rgba(144,144,144,1)",
                   scaleGridLineColor: "rgba(144,144,144,0.5)",
                   scaleGridLineWidth: 1<%--,
                   scaleOverride: true,
                   scaleSteps: 10,
                   scaleStepWidth:<%=stepList[index]%>,
                   scaleStartValue: 0--%>
               });
               <%}%>

           });
      </script>
        
        <ul class="nav nav-tabs marginTopAdd2" role="tablist">
            <%for(int i=0;i<valLists.Count;i++){ %>
             <li role="presentation" class="<%=i==0?"active":"" %>"><a href="#tab<%=i%>" role="tab" data-toggle="tab"><%=panelnames[i] %></a></li>
            <%} %>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
        <%foreach(List<ITableImplement> valList in valLists){
              int index=valLists.IndexOf(valList);
           %>
        <div role="tabpanel" class="tab-pane <%=index==0?"active":"" %>" id="tab<%=index %>">
      <div class=" marginTopAdd2 col-lg-offset-4 ">
          <h4><%= tabnames[index]%></h4>
      </div>
        <div class=" marginTopAdd2 col-lg-12" style="overflow-x:auto;overflow-y:hidden;">
        <table class="table table-bordered table-striped mytable" style="border-top:1px solid #000;table-layout:fixed\9;">
            <thead>
                <tr>
                    <th class="firstTh" width="160"></th>
                    <% foreach (ITableImplement val in valList)
                       {
                           
                           %>
                        <th  width="<%=index==1?"100":"50" %>"><%=Convert.ToString(val["ZDATE"]).Substring(5,2)+"/"+Convert.ToString(val["ZDATE"]).Substring(8,2)%></th>
                    <%} %>
                </tr>
            </thead>
            <tbody>
                <%foreach (AttributeItem item in itemLists[valLists.IndexOf(valList)])
                  {%>
                    <tr>
                        <%if(item.FieldName.Equals("ZDATE")){continue;} %>
                        <td><%=item.ZhName %></td>
                        <% foreach (ITableImplement val in valList)
                           { %>
                           <td><% try {  Response.Write(Convert.ToInt32(val[item])); }
                                   catch (Exception e) { Response.Write(val[item]); }%></td>
                        <%} %>
                    </tr>
                <%} %>
            </tbody>
        </table> 
           </div>
        <div style="clear:both;"></div>
     <canvas id="myChart<%=index%>" width="1000" height="400" style="overflow-x:auto;overflow-y:hidden;"></canvas>
            </div>
   <%}%> 
     </div>
     <%}%>

    </asp:Content>