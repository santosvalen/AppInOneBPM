using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;

public partial class WEC_CUSTOM_MODEL_SETShow : BaseAdminPage
{
    protected WEC_CUSTOM_MODEL_SET valObj=new WEC_CUSTOM_MODEL_SET();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //zlg 如果有模块，则先配置
        valObj.setConn(conn).setModule(ModuleName);

        title = valObj._ZhName + "详细";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["ID"]))
                {
                    valObj = BLLTable<WEC_CUSTOM_MODEL_SET>.Factory(conn).GetRowData(WEC_CUSTOM_MODEL_SET.Attribute.ID, Request["ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtWEC_CUSTOM_MODEL_SET_ID.Text = Convert.ToString(valObj.ID);//Convert.ToDecimal
                    
                    
                    txtWEC_CUSTOM_MODEL_SET_A_ID.Text = Convert.ToString(valObj.A_ID);//Convert.ToDecimal
                    
                    
                    txtWEC_CUSTOM_MODEL_SET_M_ID.Text = Convert.ToString(valObj.M_ID);//Convert.ToDecimal
                }
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }

            if (Request["ajax"] != null)
            {
                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "utf-8";
                Response.ContentEncoding = System.Text.Encoding.GetEncoding("utf-8");//设置输出流为简体中文
                //Response.ContentType = "html/text";

                this.EnableViewState = false;
                System.Globalization.CultureInfo myCItrad = new System.Globalization.CultureInfo("ZH-CN", true);
                System.IO.StringWriter oStringWriter = new System.IO.StringWriter(myCItrad);
                System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
                divC.RenderControl(oHtmlTextWriter);

                Response.Write(oStringWriter.ToString());
                Response.End();
            }
        }
    }

}
