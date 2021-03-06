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
public partial class HR_STATION_TYPEEdit : BaseAdminPage
{
    HR_STATION_TYPE valObj =new HR_STATION_TYPE();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "�༭";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["TYPE_ID"]))
        {
            keyid = Request["TYPE_ID"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
                                                          
            txtADDTIME.Value = (DateTime.Now).ToString("yyyy-MM-dd");

            this.txtTYPE_ID.Disabled = true; this.txtTYPE_ID.Value = "0";
            this.txtTYPE_ID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<HR_STATION_TYPE>.GetRowData(HR_STATION_TYPE.Attribute.TYPE_ID, keyid);
                    if(valObj==null) return ;
                    
                    
                    txtTYPE_ID.Value = Convert.ToString(valObj.TYPE_ID);//Convert.ToDecimal                
                    
                    txtTYPE_NAME.Value = Convert.ToString(valObj.TYPE_NAME);//Convert.ToString                
                    
                    txtADDTIME.Value = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd");
                }
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }
        }
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        try
        {
            HR_STATION_TYPE valObj = new HR_STATION_TYPE();
            
            
            if(txtTYPE_ID.Value !="" )
                valObj.TYPE_ID = Convert.ToDecimal(txtTYPE_ID.Value);
            
            
            if(txtTYPE_NAME.Value !="" )
                valObj.TYPE_NAME = Convert.ToString(txtTYPE_NAME.Value);
            
            
            if(txtADDTIME.Value !="" )
                valObj.ADDTIME = Convert.ToDateTime(txtADDTIME.Value);

            if (keyid != "")
            {
                valObj.TYPE_ID = Convert.ToDecimal(keyid);
                count = BLLTable<HR_STATION_TYPE>.Update(valObj, HR_STATION_TYPE.Attribute.TYPE_ID);
            }
            else
            {
                count = BLLTable<HR_STATION_TYPE>.Insert(valObj, HR_STATION_TYPE.Attribute.TYPE_ID);
                keyid = valObj.TYPE_ID.ToString();

            }
            if (count > 0)
            {
                StringBuilder sbData = new StringBuilder("{valObj:''");
                List<AttributeItem> lstCol = valObj.af_AttributeItemList;
                for (int i = 0; i < lstCol.Count; i++)
                {
                    object val = valObj.GetValue(lstCol[i]);
                    if (val != null)
                    {
                        sbData.Append(",").Append(lstCol[i].FieldName).Append(":'").Append(val.ToString()).Append("'");
                    }
                }
                sbData.Append("}");
                if (ViewState["sbData"] == null)
                {
                    ViewState["sbData"] = sbData.ToString();
                }
                else {
                    ViewState["sbData"] += ","+sbData.ToString();
                }
                Button btn = (Button)sender;
                if (btn.ID.IndexOf("btnOK")!=-1)
                {
                    if (ViewState["sbData"] == null)
                    {
                        string dataStr = "[" + ViewState["sbData"] .ToString()+ "]";
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + dataStr + "';}else{window.returnValue = '" + dataStr + "';}window.close();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
                    }
                }
                else
                {
                    
                    
                    txtTYPE_ID.Value ="";
                    
                    
                    txtTYPE_NAME.Value ="";
                    
                    
                    txtADDTIME.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}
